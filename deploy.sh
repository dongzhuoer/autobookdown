#!/bin/bash


# create container
docker pull dongzhuoer/ubuntu-cn > /dev/null
    # docker rm -f ubuntu0
docker run -dt --name ubuntu0 -w /root dongzhuoer/ubuntu-cn
docker exec ubuntu0 rm .bashrc .profile
docker exec rlang0 bash -c 'echo -e "[user]\n\tname = Zhuoer Dong\n\temail = dongzhuoer@mail.nankai.edu.cn\n" > /root/.gitconfig'
docker exec ubuntu0 bash -c "apt update && apt install -y git wget pandoc"

# fetch gitbook
docker exec ubuntu0 mkdir {hadley,tidyverse,yihui,zhuoer}
docker exec ubuntu0 git clone --depth 1 -b rstudio/bookdown-demo  https://github.com/dongzhuoer/bookdown.dongzhuoer.com.git rstudio/bookdown-demo
docker exec ubuntu0 git clone --depth 1 -b hadley/r4ds            https://github.com/dongzhuoer/bookdown.dongzhuoer.com.git hadley/r4ds
docker exec ubuntu0 git clone --depth 1 -b hadley/adv-r           https://github.com/dongzhuoer/bookdown.dongzhuoer.com.git hadley/adv-r
docker exec ubuntu0 git clone --depth 1 -b hadley/r-pkgs          https://github.com/dongzhuoer/bookdown.dongzhuoer.com.git hadley/r-pkgs
docker exec ubuntu0 git clone --depth 1 -b rstudio/rmarkdown-book https://github.com/dongzhuoer/bookdown.dongzhuoer.com.git rstudio/rmarkdown-book
docker exec ubuntu0 git clone --depth 1 -b rstudio/bookdown       https://github.com/dongzhuoer/bookdown.dongzhuoer.com.git rstudio/bookdown  
docker exec ubuntu0 git clone --depth 1 -b rstudio/blogdown       https://github.com/dongzhuoer/bookdown.dongzhuoer.com.git rstudio/blogdown
docker exec ubuntu0 git clone --depth 1 -b tidyverse/style        https://github.com/dongzhuoer/bookdown.dongzhuoer.com.git tidyverse/style
docker exec ubuntu0 git clone --depth 1 -b tidyverse/tidyeval     https://github.com/dongzhuoer/bookdown.dongzhuoer.com.git tidyverse/tidyeval
docker exec ubuntu0 git clone --depth 1 -b yihui/r-ninja          https://github.com/dongzhuoer/bookdown.dongzhuoer.com.git yihui/r-ninja
docker exec ubuntu0 bash -c "rm -rf */*/.git"

# auxiliary files
docker exec ubuntu0 touch .nojekyll
docker exec ubuntu0 echo bookdown.dongzhuoer.com > wd/CNAME
docker cp index.md ubuntu0:/root && docker exec ubuntu0 pandoc index.md -s -o index.html
docker exec ubuntu0 wget -O readme.md https://gist.githubusercontent.com/dongzhuoer/c19d456cf8c1bd977a2f7916f61beee8/raw/cc-license.md

# push to gh-pages
docker exec ubuntu0 git clone --depth 1 -b gh-pages https://$GITHUB_PAT@github.com/dongzhuoer/bookdown.dongzhuoer.com.git git 
docker exec ubuntu0 mv git/.git .
docker exec ubuntu0 rm -rf git
docker exec ubuntu0 git add --all
docker exec ubuntu0 git commit -m "Travis build at `date '+%Y-%m-%d %H:%M:%S'`" --allow-empty 
docker exec ubuntu0 git push
