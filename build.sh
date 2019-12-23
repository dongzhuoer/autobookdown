#!/bin/bash
# build gitbook in Docker
# @param repo, user/wd in GitHub, such as rstudio/bookdown-demo
# @param wd, directory containing .Rmd files
# @param url, website of original book
# @param niche, ecological space including installr, dongzhuoer.bookdown.com, _output/*yml
# @param apt, packages to install via APT

# create container
docker pull dongzhuoer/rlang:zhuoerdown > /dev/null
    # docker rm -f rlang0
docker run -dt --name rlang0 -v $HOME/.local/lib/R/site-library:/usr/local/lib/R/site-library dongzhuoer/rlang:zhuoerdown

# prepare files
docker exec rlang0 rm -r /root
docker exec rlang0 git clone --depth 1 https://github.com/$repo.git /root
docker cp _output/$niche.yml rlang0:/_output.yml
docker cp _bookdown_files rlang0:/root

# dependency
docker exec rlang0 bash -c 'echo -e "[user]\n\tname = Zhuoer Dong\n\temail = dongzhuoer@mail.nankai.edu.cn\n" > /root/.gitconfig'
[ "$apt" ] && docker exec rlang0 bash -c "apt update && apt install -y $apt"
docker exec -e GITHUB_PAT=$GITHUB_PAT rlang0 Rscript -e "remotes::install_github('dongzhuoer/installr/$niche')"

# build book
download_link="https://github.com/dongzhuoer/bookdown.dongzhuoer.com/archive/$niche.zip"
docker exec -w /root/$rmd rlang0 Rscript -e "bookdown::render_book('', zhuoerdown::make_gitbook('/_output.yml', '$url', '$download_link'), output_dir = '/output')"
docker exec rlang0 Rscript -e "file.copy(zhuoerdown:::pkg_file('bookdown.css'), '/output')"
docker exec rlang0 Rscript -e "download.file('https://gist.githubusercontent.com/dongzhuoer/c19d456cf8c1bd977a2f7916f61beee8/raw/cc-license.md', 'readme.md')"
docker exec rlang0 test -f /output/index.html

# deploy
docker exec rlang0 git clone --depth 1 -b $niche https://$GITHUB_PAT@github.com/dongzhuoer/bookdown.dongzhuoer.com.git /git 
docker exec rlang0 mv /git/.git /output
docker exec rlang0 rm -rf /git
docker exec -w /output rlang0 git add --all
docker exec -w /output rlang0 git commit -m "Travis build at `date '+%Y-%m-%d %H:%M:%S'`" --allow-empty 
docker exec -w /output rlang0 git push

# before cache
docker exec rlang0 chown -R `id -u`:`id -g` /usr/local/lib/R/site-library
rm -rf _bookdown_files && docker cp rlang0:/root/_bookdown_files .
