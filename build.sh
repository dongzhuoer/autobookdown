#!/bin/bash
# build gitbook in Docker
# @param repo, user/wd in GitHub, such as rstudio/bookdown-demo
# @param wd, directory containing .Rmd files
# @param url, website of original book
# @param niche, ecological space including installr, dongzhuoer.bookdown.com, _output/*yml
# @param apt, packages to install via APT

# prepare files
mkdir -p wd
git clone --depth 1 https://github.com/$repo.git wd/repo
cp _output/$niche.yml wd/_output.yml

# create container
docker pull dongzhuoer/rlang:zhuoerdown > /dev/null
    # docker rm -f rlang0
docker run -dt --name rlang0 -v `pwd`/wd:/root -v `pwd`/_bookdown_files:/root/repo/_bookdown_files -v $HOME/.local/lib/R/site-library:/usr/local/lib/R/site-library dongzhuoer/rlang:zhuoerdown

# dependency
docker exec rlang0 bash -c 'echo -e "[user]\n\tname = Zhuoer Dong\n\temail = dongzhuoer@mail.nankai.edu.cn\n" > /root/.gitconfig'
docker exec rlang0 bash -c "apt update && apt install -y $apt"
docker exec -e GITHUB_PAT=$GITHUB_PAT rlang0 Rscript -e "remotes::install_github('dongzhuoer/installr/$niche')"

# build book
download_link = "https://github.com/dongzhuoer/bookdown.dongzhuoer.com/archive/$niche.zip"
docker exec -w /root/repo/$rmd rlang0 Rscript -e "bookdown::render_book('', zhuoerdown::make_gitbook('/root/_output.yml', '$url', '$download_link'), output_dir = '/root/output')"
docker exec rlang0 Rscript -e "file.copy(zhuoerdown:::pkg_file('bookdown.css'), '/root/output')"
docker exec rlang0 bash -c "apt install -y wget"
docker exec rlang0 wget -O /root/output/readme.md https://gist.githubusercontent.com/dongzhuoer/c19d456cf8c1bd977a2f7916f61beee8/raw/cc-license.md
test -f wd/output/index.html || exit 1

# deploy
git clone --depth 1 -b $niche https://$GITHUB_PAT@github.com/dongzhuoer/bookdown.dongzhuoer.com.git wd/git && mv wd/git/.git wd/output && rm -r wd/git
cd wd/output && git add --all && commit -m "Travis build at `date '+%Y-%m-%d %H:%M:%S'`" --allow-empty && git push && cd ../..

# before cache
docker exec rlang0 chown -R `id -u`:`id -g` _bookdown_files /usr/local/lib/R/site-library
