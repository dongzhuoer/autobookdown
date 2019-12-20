# build my favorite programming books


## to-do

- `/root/wd/$rmd`
- hadley 3 & rmarkdown fails
- what if `_bookdown_files` already exists
- deploy, `/root/wd`, `/root/git`
- check first author is correct
- thesis
- nutshell
- yihui/bookdown add `new_session: yes` in `_bookdown.yml`

## Overview

Each branch builds a book, it only contains some configuration files (mainly `.travis.yml`). 

The main work (powered by [zhuoerdown](https://github.com/dongzhuoer/zhuoerdown)) is to 

1. download Rmd source code
1. render to GitBook output
1. deploy to [dongzhuoer/bookdown.dongzhuoer.com](https://github.com/dongzhuoer/bookdown.dongzhuoer.com)






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


# list

- _Tidy evaluation_ by Hadley Wickham [code](https://github.com/tidyverse/tidyeval) [output](https://bookdown.dongzhuoer.com/hadley/tidyeval)
- _The tidyverse style guide_ by Hadley Wickham [code](https://github.com/tidyverse/style) [output](https://bookdown.dongzhuoer.com/hadley/style)
- _R for data science_ by Hadley Wickham [code](https://github.com/hadley/r4ds) [output](https://bookdown.dongzhuoer.com/hadley/r4ds)
- _R packages_ by Hadley Wickham [code](https://github.com/hadley/r-pkgs) [output](https://bookdown.dongzhuoer.com/hadley/r-pkgs)
- _Advanced R programming_ by Hadley Wickham [code](https://github.com/hadley/adv-r) [output](https://bookdown.dongzhuoer.com/hadley/adv-r)
- _R Markdown: The Definitive Guide_ by Yihui Xie [code](https://github.com/rstudio/rmarkdown-book) [output](https://bookdown.dongzhuoer.com/yihui/rmarkdown)
- 《R语言忍者秘笈》by 谢益辉 [code](https://github.com/yihui/r-ninja) [output](https://bookdown.dongzhuoer.com/yihui/r-ninja)
- _A minimal book example using bookdown_ by Yihui Xie [code](https://github.com/rstudio/bookdown-demo) [output](https://bookdown.dongzhuoer.com/yihui/bookdown-demo)
- _bookdown: Authoring Books and Technical Documents with R Markdown_ by Yihui Xie [code](https://github.com/rstudio/bookdown/tree/master/inst/examples) [output](https://bookdown.dongzhuoer.com/yihui/bookdown)
- _blogdown: Creating Websites with R Markdown_ by Yihui Xie [code](https://github.com/rstudio/blogdown/tree/master/docs) [output](https://bookdown.dongzhuoer.com/yihui/blogdown)



-----------------------

[![Creative Commons License](https://i.creativecommons.org/l/by-nc/3.0/88x31.png)](http://creativecommons.org/licenses/by-nc/3.0/)  
This work is licensed under a [Creative Commons Attribution-NonCommercial 3.0 Unported License](http://creativecommons.org/licenses/by-nc/3.0/)
