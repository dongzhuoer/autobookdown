# build my favorite programming books
[![Build Status](https://travis-ci.com/dongzhuoer/autobookdown.svg?branch=master)](https://travis-ci.com/dongzhuoer/autobookdown)



## Overview

I establish this website mainly for two purposes:

- customize apprearance, powered by [zhuoerdown](https://github.com/dongzhuoer/zhuoerdown), mainly use yellow color to protect eye and expand TOC
- store source code in [bookdown.dongzhuoer.com](https://github.com/dongzhuoer/bookdown.dongzhuoer.com) to facilitate offiline reading




# book list

| book                                                                             | code                                                                              |
|----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| _A minimal book example using bookdown_ by Yihui Xie                             | [rstudio/bookdown-demo](https://github.com/rstudio/bookdown-demo)                 |
| _R for data science_ by Hadley Wickham                                           | [hadley/r4ds](https://github.com/hadley/r4ds)                                     |
| _Advanced R programming_ by Hadley Wickham                                       | [hadley/adv-r](https://github.com/hadley/adv-r)                                   |
| _R packages_ by Hadley Wickham                                                   | [hadley/r-pkgs](https://github.com/hadley/r-pkgs)                                 |
| _R Markdown: The Definitive Guide_ by Yihui Xie                                  | [rstudio/rmarkdown-book](https://github.com/rstudio/rmarkdown-book)               |
| _bookdown: Authoring Books and Technical Documents with R Markdown_ by Yihui Xie | [rstudio/bookdown](https://github.com/rstudio/bookdown/tree/master/inst/examples) |
| _blogdown: Creating Websites with R Markdown_ by Yihui Xie                       | [rstudio/blogdown](https://github.com/rstudio/blogdown/tree/master/docs)          |
| _Tidy evaluation_ by Hadley Wickham                                              | [tidyverse/tidyeval](https://github.com/tidyverse/tidyeval)                       |
| _The tidyverse style guide_ by Hadley Wickham                                    | [tidyverse/style](https://github.com/tidyverse/style)                             |
| 《R语言忍者秘笈》by 谢益辉                                                                  | [yihui/r-ninja](https://github.com/yihui/r-ninja)                                 |



# for developers

## to-do

- check first author is correct
- what if `_bookdown_files` already exists
- yihui/bookdown add `new_session: yes` in `_bookdown.yml`
- thesis
- nutshell

## add a new book

- Build the book in local, resolve APT & R package dependency.
- Think out a good name (`niche`), such as `user/repo` (for GitHub), refer to `.travis.yml` for more complicated case.
- Create `niche` branch on GitHub, `_output/niche/.yml`, `niche/DESCRIPTION` in [installr](https://github.com/dongzhuoer/installr), link in `index.md`.
- Travis add new job in `build` stage and clone in `deploy.sh`.

## reinitialize

`.git/info/exclude`
```
_bookdown_files
repo
```



-----------------------

[![Creative Commons License](https://i.creativecommons.org/l/by-nc/3.0/88x31.png)](http://creativecommons.org/licenses/by-nc/3.0/)  
This work is licensed under a [Creative Commons Attribution-NonCommercial 3.0 Unported License](http://creativecommons.org/licenses/by-nc/3.0/)



The website of my writing and favorite programming books.

two purpose (powered by [build-bookdown](https://github.com/dongzhuoer/build-bookdown)).

1. Use GitHub pages to host the website
1. Download a book as `.zip` for _offline_ reading, since each book lives in its own branch


# Implementation

- `gh-pages` branch contains whole website, other branches contain individual books.
- `master` branch runs Travis CI,
  1. fetch book contents from individual branches
  1. build `index.html`, create `CNAME` and fetch CC 4.0 `readme.md`
  1. deploy to `gh-pages` branch

# to-do

1. pass `- env` as shell parameter
1. use separate directory for each book's cache

# new book

- https://github.com/cpsievert/plotly_book
- https://github.com/csgillespie/efficientR
- https://github.com/hadley/mastering-shiny
- https://github.com/wch/rgcookbook
- https://github.com/tidyverse/design
- https://github.com/hadley/ggplot2-book
- https://github.com/hadley/r-pkgs


```r
remotes::install_github("dongzhuoer/installr/hadley/r-pkgs", upgrade = TRUE)
remotes::install_github("dongzhuoer/installr/cpsievert/plotly_book", upgrade = TRUE)
remotes::install_github("dongzhuoer/installr/csgillespie/efficientR", upgrade = TRUE)
remotes::install_github("dongzhuoer/installr/hadley/mastering-shiny", upgrade = TRUE)
remotes::install_github("dongzhuoer/installr/wch/rgcookbook", upgrade = TRUE) # libgdal-dev libprotobuf-dev protobuf-compiler libv8-dev libjq-dev
remotes::install_github("dongzhuoer/installr/tidyverse/design", upgrade = TRUE) 
remotes::install_github("dongzhuoer/installr/hadley/ggplot2-book", upgrade = TRUE) # remotes::install_github("ropensci/USAboundariesData")
```

- https://topepo.github.io/caret/index.html

