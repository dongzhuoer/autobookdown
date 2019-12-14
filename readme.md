# build my favorite programming books

## Overview

Each branch builds a book, it only contains some configuration files (mainly `.travis.yml`). 

The main work (powered by [zhuoerdown](https://github.com/dongzhuoer/zhuoerdown)) is to 

1. download Rmd source code
1. render to GitBook output
1. deploy to [dongzhuoer/bookdown.dongzhuoer.com](https://github.com/dongzhuoer/bookdown.dongzhuoer.com)




mkdir -p hadley/adv-r
mkdir -p hadley/r-pkgs
mkdir -p hadley/r4ds
mkdir -p hadley/style
mkdir -p hadley/tidyeval
mkdir -p yihui/blogdown
mkdir -p yihui/bookdown
mkdir -p yihui/bookdown-demo
mkdir -p yihui/r-ninja
mkdir -p yihui/rmarkdown


## add a new book

1. check whether the book can be built
   1. clone source code repo 
   1. build on local
   1. build in `dongzhuoer/rlang:zhuoerdown` Docker image

1. add the book to this repo 
   1. create an orphan branch with name `author-book`
   1. set up `.travis.yml`

1. add the book to `bookdown.dongzhuoer.com` repo
   1. create an orphan branch with name `author-book`
   1. `git clone` in `.travis.yml`
   1. add a link in `index.md`



-----------------------

[![Creative Commons License](https://i.creativecommons.org/l/by-nc/3.0/88x31.png)](http://creativecommons.org/licenses/by-nc/3.0/)  
This work is licensed under a [Creative Commons Attribution-NonCommercial 3.0 Unported License](http://creativecommons.org/licenses/by-nc/3.0/)
