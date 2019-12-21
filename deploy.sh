#!/bin/bash

# fetch gitbook
mkdir -p wd/{hadley,tidyverse,yihui,zhuoer}
git clone --depth 1 -b rstudio/bookdown-demo  https://github.com/dongzhuoer/bookdown.dongzhuoer.com.git wd/rstudio/bookdown-demo
git clone --depth 1 -b hadley/r4ds            https://github.com/dongzhuoer/bookdown.dongzhuoer.com.git wd/hadley/r4ds
git clone --depth 1 -b hadley/adv-r           https://github.com/dongzhuoer/bookdown.dongzhuoer.com.git wd/hadley/adv-r
git clone --depth 1 -b hadley/r-pkgs          https://github.com/dongzhuoer/bookdown.dongzhuoer.com.git wd/hadley/r-pkgs
git clone --depth 1 -b rstudio/rmarkdown-book https://github.com/dongzhuoer/bookdown.dongzhuoer.com.git wd/rstudio/rmarkdown-book
git clone --depth 1 -b rstudio/bookdown       https://github.com/dongzhuoer/bookdown.dongzhuoer.com.git wd/rstudio/bookdown  
git clone --depth 1 -b rstudio/blogdown       https://github.com/dongzhuoer/bookdown.dongzhuoer.com.git wd/rstudio/blogdown
git clone --depth 1 -b tidyverse/style        https://github.com/dongzhuoer/bookdown.dongzhuoer.com.git wd/tidyverse/style
git clone --depth 1 -b tidyverse/tidyeval     https://github.com/dongzhuoer/bookdown.dongzhuoer.com.git wd/tidyverse/tidyeval
git clone --depth 1 -b yihui/r-ninja          https://github.com/dongzhuoer/bookdown.dongzhuoer.com.git wd/yihui/r-ninja
rm -rf wd/*/*/.git

# auxiliary files
touch wd/.nojekyll
echo bookdown.dongzhuoer.com > wd/CNAME
sudo apt update && sudo apt install -y pandoc && pandoc index.md -s -o index.html
wget -O wd/readme.md https://gist.githubusercontent.com/dongzhuoer/c19d456cf8c1bd977a2f7916f61beee8/raw/cc-license.md

# push to gh-pages
git clone --depth 1 -b gh-pages https://$GITHUB_PAT@github.com/dongzhuoer/bookdown.dongzhuoer.com.git repo && mv repo/.git wd
cd wd && git add --all && git commit -m "Travis build at `date '+%Y-%m-%d %H:%M:%S'`" --allow-empty && git push -f && cd ..
