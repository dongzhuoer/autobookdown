# build _bookdown: Authoring Books and Technical Documents with R Markdown_ by Yihui Xie
[![Build Status](https://travis-ci.com/dongzhuoer/build-bookdown.svg?token=CyRgUWsqWCctKvAxMXto&branch=yihui-bookdown)](https://travis-ci.com/dongzhuoer/build-bookdown)

[Source code](https://github.com/rstudio/bookdown/tree/master/inst/examples)

[Output](https://bookdown.dongzhuoer.com/yihui/bookdown)


add `new_session: yes` in `_bookdown.yml`

## package dependency

I extract `setup` chunk of `index.Rmd` and search `@R-` for all cited R packages. So there may be some redundency, but anyway I just want that the book can be built, the exact dependency should be specified by the author.

