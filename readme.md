# build my favorite programming books



## Overview

Each branch builds a book, it only contains some configuration files (mainly `.travis.yml`). 

The main work (powered by [zhuoerdown](https://github.com/dongzhuoer/zhuoerdown)) is to 

1. download Rmd source code
1. render to GitBook output
1. deploy to [dongzhuoer/bookdown.dongzhuoer.com](https://github.com/dongzhuoer/bookdown.dongzhuoer.com)



# book list

| book                                                                             | code                                                                  | output                                                             |
|----------------------------------------------------------------------------------|-----------------------------------------------------------------------|---------------------------------------------------------------|
| _A minimal book example using bookdown_ by Yihui Xie                             | [rstudio/bookdown-demo](https://github.com/rstudio/bookdown-demo)                      | <rstudio/bookdown-demo> |
| _R for data science_ by Hadley Wickham                                           | [code](https://github.com/hadley/r4ds)                                | [output](https://bookdown.dongzhuoer.com/hadley/r4ds)         |
| _Advanced R programming_ by Hadley Wickham                                       | [code](https://github.com/hadley/adv-r)                               | [output](https://bookdown.dongzhuoer.com/hadley/adv-r)        |
| _R packages_ by Hadley Wickham                                                   | [code](https://github.com/hadley/r-pkgs)                              | [output](https://bookdown.dongzhuoer.com/hadley/r-pkgs)       |
| _R Markdown: The Definitive Guide_ by Yihui Xie                                  | [code](https://github.com/rstudio/rmarkdown-book)                     | [output](https://bookdown.dongzhuoer.com/rstudio/rmarkdown)   |
| _bookdown: Authoring Books and Technical Documents with R Markdown_ by Yihui Xie | [code](https://github.com/rstudio/bookdown/tree/master/inst/examples) | [output](https://bookdown.dongzhuoer.com/rstudio/bookdown)    |
| _blogdown: Creating Websites with R Markdown_ by Yihui Xie                       | [code](https://github.com/rstudio/blogdown/tree/master/docs)          | [output](https://bookdown.dongzhuoer.com/rstudio/blogdown)    |
| _Tidy evaluation_ by Hadley Wickham                                              | [code](https://github.com/tidyverse/tidyeval)                         | [output](https://bookdown.dongzhuoer.com/tidyverse/tidyeval)  |
| _The tidyverse style guide_ by Hadley Wickham                                    | [code](https://github.com/tidyverse/style)                            | [output](https://bookdown.dongzhuoer.com/tidyverse/style)     |
| 《R语言忍者秘笈》by 谢益辉                                                                  | [code](https://github.com/yihui/r-ninja)                              | [output](https://bookdown.dongzhuoer.com/yihui/r-ninja)       |



# for developers

## to-do

- check first author is correct
- what if `_bookdown_files` already exists
- yihui/bookdown add `new_session: yes` in `_bookdown.yml`
- thesis
- nutshell

## add a new book

- build the book in local, resolve APT & R package dependency
- think out a good name (`niche`), such as `rstudio/bookdown-demo`
- create `niche` branch on GitHub, `_output/niche/.yml`, `niche/DESCRIPTION` in [installr](https://github.com/dongzhuoer/installr), link in `index.md`
- Travis add new job in `build` stage and clone in `deploy.sh`  

## reinitialize

`.git/info/exclude`
```
_bookdown_files
repo
```




-----------------------

[![Creative Commons License](https://i.creativecommons.org/l/by-nc/3.0/88x31.png)](http://creativecommons.org/licenses/by-nc/3.0/)  
This work is licensed under a [Creative Commons Attribution-NonCommercial 3.0 Unported License](http://creativecommons.org/licenses/by-nc/3.0/)
