
# bisonpicsuite

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/poissonconsulting/bisonpicsuite/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/poissonconsulting/bisonpicsuite/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/poissonconsulting/bisonpicsuite/graph/badge.svg)](https://app.codecov.io/gh/poissonconsulting/bisonpicsuite)
<!-- badges: end -->

The goal of `bisonpicsuite` is to make it easy to install and load the
`bisonpic` suite of R packages for visualizing and analyzing wood
**BISON** camera trap (**PIC**) data.

The packages are designed to facilitate data exploration and analysis of
wood bison camera trap data, using underlying functions to visualize and
analyze data (`bisonpictools`) and Shiny applications that streamline
the data visualization (`shinybisonpic`) and data analysis
(`runbisonpic`) processes.

The data are analyzed using an Bayesian Integrated Population Model,
which combines a stage-structured population projection matrix model
with multiple sources of data into a unified framework, allowing for
estimates of age-sex class ratios, population vital rates, and
abundances, while maintaining the correct propagation of uncertainty.
See the [analytical
methods](https://poissonconsulting.github.io/bisonpictools/articles/bisonpic-methods.html)
vignette for more detail on the modeling approach.

## Installation

You can install the latest version of `bisonpicsuite` from
[GitHub](https://github.com/poissonconsulting/bisonpicsuite) with:

``` r
# install.packages("remotes")
remotes::install_github("poissonconsulting/bisonpicsuite")
```

## Load

To load `bisonpicsuite`, execute the following line of code.

``` r
library(bisonpicsuite)
```

### Packages

The packages installed and loaded by `bisonpicsuite` suite are:

- [bisonpictools](https://github.com/poissonconsulting/bisonpictools)
- [shinybisonpic](https://github.com/poissonconsulting/shinybisonpic)
- [runbisonpic](https://github.com/poissonconsulting/runbisonpic)

## Inspiration

`bisonpicsuite` was inspired by the
[`tidyverse`](https://github.com/tidyverse/tidyverse) package.

## Information

Additional information is available from the
[`bisonpicsuite`](https://poissonconsulting.github.io/bisonpicsuite/)
and
[`bisonpictools`](https://poissonconsulting.github.io/bisonpictools/)
websites, which contain the following articles:

- `bisonpicsuite`
  - [Getting Started with
    bisonpicsuite](https://poissonconsulting.github.io/bisonpicsuite/articles/bisonpicsuite-getting-started.html)
  - [Bisonpic User
    Guide](https://poissonconsulting.github.io/bisonpicsuite/articles/bisonpic-user-guide.html)
- `bisonpictools`
  - [Getting Started with
    bisonpictools](https://poissonconsulting.github.io/bisonpictools/articles/bisonpictools-getting-started.html)
  - [Analytical
    Methods](https://poissonconsulting.github.io/bisonpictools/articles/bisonpic-methods.html)

## Getting Help or Reporting an Issue

To report bugs/issues/feature requests, please file an
[issue](https://github.com/poissonconsulting/bisonpicsuite/issues/).

## How to Contribute

If you would like to contribute to the package, please see our
[CONTRIBUTING](https://github.com/poissonconsulting/bisonpicsuite/blob/master/.github/CONTRIBUTING.md)
guidelines.

## Code of Conduct

Please note that the `bisonpicsuite` project is released with a
[Contributor Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.

## Licensing

Copyright 2023 Province of Alberta

Licensed under the Apache License, Version 2.0 (the “License”); you may
not use this file except in compliance with the License. You may obtain
a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an “AS IS” BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
