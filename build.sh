#!/bin/bash
# build gitbook in Docker

# @details

# @param 1 user/repo
# @param 2 directory containing .Rmd files
# @param 3 packages to install by APT
# @param 4 bash command to run
# @param 5 subdirectory dependent
# @param 6 website of original book


# @note


docker run -dt --name rlang0 -v $HOME/.local/lib/R:/usr/local/lib/R/site-library dongzhuoer/rlang:zhuoerdown 2> /dev/null
docker exec rlang0 bash -c "apt update && apt install -y $apt"
docker exec rlang0 git clone --depth 1 https://github.com/$user/$repo.git /root
# mkdir _bookdown_files
docker cp _bookdown_files rlang0:/root/$wd
docker exec -w /root/$wd rlang0 bash -c "$command"
docker exec -w /root/$wd rlang0 Rscript -e "remotes::install_github('dongzhuoer/installr/$user/$repo')"
docker exec -w /root/$wd rlang0 Rscript -e "bookdown::render_book('', zhuoerdown::make_gitbook('$url', '_'), output_dir = '/gitbook')"
docker exec rlang0 Rscript -e "file.copy(zhuoerdown:::pkg_file('bookdown.css'), '/gitbook')"
docker exec rlang0 ls /gitbook
wget https://gist.githubusercontent.com/dongzhuoer/c19d456cf8c1bd977a2f7916f61beee8/raw/cc-license.md
docker cp cc-license.md rlang0:/gitbook/readme.md

#docker exec -e GITHUB_PAT=$GITHUB_PAT rlang0 env

# git clone --depth 1 $repo_git $work_dir/repo && mv $work_dir/repo/.git $work_dir/output
# cd $work_dir/output && git add --all && git commit -m "travis build at `date '+%Y-%m-%d %H:%M:%S'`" --allow-empty && git push -f

# mv $work_dir/input/$wd/_bookdown_files $TRAVIS_BUILD_DIR || echo 'cache not available'
