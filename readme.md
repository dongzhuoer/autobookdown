# build my favorite programming books
[![Build Status](https://travis-ci.com/dongzhuoer/autobookdown.svg?branch=master)](https://travis-ci.com/dongzhuoer/autobookdown)



## Overview

I establish this website mainly for two purposes:

- customize apprearance, powered by [zhuoerdown](https://github.com/dongzhuoer/zhuoerdown)  
  Mainly expand TOC, protect eye (yellow background) and split by section if chapters are too long.  
- facilitate offiline reading by GitHub Pages in [bookdown.dongzhuoer.com](https://gitlab.com/dongzhuoer/bookdown.dongzhuoer.com)  
  User can either clone the whole website, or download standalone `.zip` for his interested book. However, a server is needed for search utility (I set up a local server by Apache in Dokcer).



## to-do

- nutshell
- thesis
- r-pkgs `split_by: section` would fail, but test -f index.html no error
- 在 **本地** 检查每一本书，没有很长章节的话，就不要 `split_by: section` 了
- `split_by: section` cause "??" in cross-reference (link is okay), such as rmarkdown-book
- r4ds `split_by: section+number`, 经 nutshell 测试没问题（有重复都会自动用序号区分），直接到 r4ds 看看那
- r-pkgs `split_by: section`
- yihui/bookdown add `new_session: yes` in `_bookdown.yml`



## add a new book

- Build the book in local, make sure no `_bookdown_files/` folder, resolve APT & R package dependency.
- Think out a good name (`niche`), such as `user/repo` (for GitHub), refer to `.travis.yml` for more complicated case.
- Create `niche` branch on [bookdown.dongzhuoer.com](https://gitlab.com/dongzhuoer/bookdown.dongzhuoer.com), link in `index.md`, `_output/niche/.yml`, `niche/DESCRIPTION` in [installr](https://github.com/dongzhuoer/installr).
- Travis add new job in `build` stage and clone in `deploy.sh`.



## book list

| Title                                                               | Author         | Code                                                                              |
|---------------------------------------------------------------------|----------------|-----------------------------------------------------------------------------------|
| _A Minimal Book Example_                                            | Yihui Xie      | [rstudio/bookdown-demo](https://github.com/rstudio/bookdown-demo)                 |
| _R for data science_                                                | Hadley Wickham | [hadley/r4ds](https://github.com/hadley/r4ds)                                     |
| _Advanced R_                                                        | Hadley Wickham | [hadley/adv-r](https://github.com/hadley/adv-r)                                   |
| _R packages_                                                        | Hadley Wickham | [hadley/r-pkgs](https://github.com/hadley/r-pkgs)                                 |
| _R Markdown: The Definitive Guide_                                  | Yihui Xie      | [rstudio/rmarkdown-book](https://github.com/rstudio/rmarkdown-book)               |
| _bookdown: Authoring Books and Technical Documents with R Markdown_ | Yihui Xie      | [rstudio/bookdown](https://github.com/rstudio/bookdown/tree/master/inst/examples) |
| _blogdown: Creating Websites with R Markdown_                       | Yihui Xie      | [rstudio/blogdown](https://github.com/rstudio/blogdown/tree/master/docs)          |
| _Tidy evaluation_                                                   | Hadley Wickham | [tidyverse/tidyeval](https://github.com/tidyverse/tidyeval)                       |
| _The tidyverse style guide_                                         | Hadley Wickham | [tidyverse/style](https://github.com/tidyverse/style)                             |
| R语言忍者秘笈                                                             | 谢益辉            | [yihui/r-ninja](https://github.com/yihui/r-ninja)                                 |



## candidate

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



## reinitialize

`.git/info/exclude`
```
_bookdown_files
```



-----------------------
[![Creative Commons License](https://i.creativecommons.org/l/by-nc/4.0/88x31.png)](http://creativecommons.org/licenses/by-nc/4.0/)  
This work is licensed under a [Creative Commons Attribution-NonCommercial 4.0 International License](http://creativecommons.org/licenses/by-nc/4.0/)
