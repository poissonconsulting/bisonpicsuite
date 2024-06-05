
# bisonpicsuite

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/poissonconsulting/bisonpicsuite/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/poissonconsulting/bisonpicsuite/actions/workflows/R-CMD-check.yaml)
[![codecov](https://codecov.io/gh/poissonconsulting/bisonpicsuite/graph/badge.svg?token=vbj0GkYauL)](https://codecov.io/gh/poissonconsulting/bisonpicsuite)
<!-- badges: end -->

The goal of `bisonpicsuite` is to make it easy to install and load the
`bisonpic` suite of R packages for visualizing and analyzing Wood
**BISON** camera trap (**PIC**) data.

The packages are designed to facilitate data exploration and analysis of
Wood Bison camera trap data, using underlying functions to visualize and
analyze data (`bisonpictools`) and Shiny applications that streamline
the data visualization (`shinybisonpic`) and data analysis
(`runbisonpic`) processes.

## Installation

You can install the latest version of `bisonpicsuite` from
[GitHub](https://github.com/poissonconsulting/bisonpicsuite) with:

``` r
# install.packages("remotes")
remotes::install_github("poissonconsulting/bisonpicsuite")
```

## Load

To load `bisonpicsuite`

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
