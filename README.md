
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggcapdthemes

<!-- badges: start -->
<!-- badges: end -->

The goal of ggcapdthemes is to …

## Installation

You can install the development version of ggcapdthemes from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("usepa/ggcapdthemes")
```

Note: while `ggcapdthemes` is still an internal repository, you will
also need a Github Personal Access Token (PAT) to install it.

1.  Create GitHub personal access token with ‘repo scope’

    - Go to <https://github.com/settings/tokens> and select Tokens
      (classic) on the left-hand side. Then click “Generate New Token”
      –\> “Generate new token (classic)”.

    - Give it a name and select all boxes under repo scope. Scroll down
      and click “Generate Token”.

    - Copy this code somewhere safe. Note: it will expire at some point
      and need to be re-generated.

2.  set GitHub credentials in Rstudio

    - store credentials long-term: run `usethis::edit_r_environ()` to
      open your .Renviron file and and add a line with your PAT in this
      format: `GITHUB_PAT = 'abc'`. After saving this file, make sure to
      restart your R session for it to take effect (Go to the session
      toolbar and click “Restart R”).
    - You can specify an extra argument scope = ‘project’ if you only
      want the PAT to work for a particular Rstudio project

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(ggplot2)
library(ggcapdthemes)
## basic example code
df <- mpg
ggplot(df, aes(x=cyl, y=cty)) +
   geom_point() +
   theme_egrid()
```

<img src="man/figures/README-example-1.png" width="100%" />
