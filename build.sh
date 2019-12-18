#!/bin/bash
# build gitbook in Docker
# @param repo, user/repo in GitHub, such as rstudio/bookdown-demo
# @param wd, directory containing .Rmd files
# @param url, website of original book
# @param niche, ecological space including installr, dongzhuoer.bookdown.com, _output/*yml
# @param apt, packages to install via APT

# create container
docker pull dongzhuoer/rlang:zhuoerdown > /dev/null
    # docker rm -f rlang0
docker run -dt --name rlang0 -v $HOME/.local/lib/R/site-library:/usr/local/lib/R/site-library dongzhuoer/rlang:zhuoerdown

# prepare files
docker exec rlang0 git clone --depth 1 https://github.com/$repo.git /root/repo
    # mkdir -p _bookdown_files
docker cp _bookdown_files rlang0:/root/repo/$wd 
docker cp _output/$niche.yml rlang0:/root/_output.yml

# dependency
docker exec rlang0 bash -c 'echo -e "[user]\n\tname = Zhuoer Dong\n\temail = dongzhuoer@mail.nankai.edu.cn\n" > /root/.gitconfig'
docker exec rlang0 bash -c "apt update && apt install -y $apt"
docker exec -e GITHUB_PAT=$GITHUB_PAT rlang0 Rscript -e "remotes::install_github('dongzhuoer/installr/$niche')"

# build book
docker exec -w /root/repo/$wd rlang0 Rscript -e "bookdown::render_book('', zhuoerdown::make_gitbook('$root', '/root/_output.yml'), output_dir = '/root/gitbook')"
docker exec rlang0 Rscript -e "file.copy(zhuoerdown:::pkg_file('bookdown.css'), '/root/gitbook')"
docker exec rlang0 wget -o /root/gitbook/readme.md https://gist.githubusercontent.com/dongzhuoer/c19d456cf8c1bd977a2f7916f61beee8/raw/cc-license.md

# deploy
docker exec rlang0 git clone --depth 1 -b $niche https://$GITHUB_PAT@github.com/dongzhuoer/bookdown.dongzhuoer.com.git /root/gh-pages
docker exec rlang0 mv /root/gh-pages/.git /root/gitbook
docker exec -w /root/gitbook rlang0 git add --all
docker exec -w /root/gitbook rlang0 git commit -m "travis build at `date '+%Y-%m-%d %H:%M:%S'`" --allow-empty
docker exec -w /root/gitbook rlang0 git push -f

# before cache
docker exec rlang0 chown -R `id -u`:`id -g` /usr/local/lib/R/site-library
rm -r _bookdown_files && docker cp rlang0:/root/repo/$wd/_bookdown_files . 
