
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pinsManifest

<!-- badges: start -->

[![R-CMD-check](https://github.com/ijlyttle/pinsManifest/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ijlyttle/pinsManifest/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of pinsManifest is to help with a particular use-case for
[pins]():

-   you create a board using `pins::board_folder()`
-   you serve the board using `pins::board_url()`

The mechanism is to make a *manifest* file of pins used to create a
`pins::board_url()`.

## Installation

You can install the development version of pinsManifest from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ijlyttle/pinsManifest")
```

## Example

``` r
library("pinsManifest")
```

### Writing a folder-board

Let’s say you have a `pins::board_folder()` that you want to serve as a
website, perhaps using GitHub. You can write a manifest file for the
pins using `pin_write_manifest()`:

``` r
board <- pins::board_folder("/some/path")

# add/update pins

pin_write_manifest(board)
```

    #> Manifest file written to `/some/path/pins.txt`

This writes a manifest file, `pins.txt` to root directory of your board.
It stores the names of your pins and the names of each version of each
pin.

Note: `pin_write_manifest()` supports only boards created using
`pins::board_folder()`.

### Reading a URL-board

To create a `pins::board_url()`, you need a named character-vector
where:

-   names are names of pins
-   values are the URLs that point to a version-directory

The problem is that the names of version directories are, by design,
hard to predict and manage manually.

This is where a manifest file, `pins.txt` can help. When you call
`board_url_manifest()`, it downloads `pins.txt`, then parses it to
provide information to build a `pins::board_url()`.

A demonstration board is provided using `url_demo_manifest()`:

``` r
board_demo <- board_url_manifest(url_demo_manifest())

pins::pin_list(board_demo)
#> [1] "mtcars-csv"  "mtcars-json"
pins::pin_meta(board_demo, "mtcars-json")
#> List of 11
#>  $ file       : chr "mtcars-json.json"
#>  $ file_size  : 'fs_bytes' int 4.05K
#>  $ pin_hash   : chr "c2702fb156ba5c38"
#>  $ type       : chr "json"
#>  $ title      : chr "mtcars-json: a pinned 32 x 11 data frame"
#>  $ description: NULL
#>  $ created    : POSIXct[1:1], format: "2022-08-06 19:58:00"
#>  $ api_version: num 1
#>  $ user       : list()
#>  $ name       : chr "mtcars-json"
#>  $ local      :List of 4
#>   ..$ dir     : 'fs_path' chr "~/Library/Caches/pins/url/94f8727184d79b18fa08f804cec2f2d5"
#>   ..$ url     : chr "https://raw.githubusercontent.com/ijlyttle/pinsManifest/main/tests/testthat/pins/mtcars-json/20220807T005818Z-c2702/"
#>   ..$ version : NULL
#>   ..$ file_url: chr "https://raw.githubusercontent.com/ijlyttle/pinsManifest/main/tests/testthat/pins/mtcars-json/20220807T005818Z-c"| __truncated__
```

### Behind the scenes

The function `manifest_latest()`:

-   takes a `url` describing the root directory of a board
-   downloads and parses the `pins.txt` file at the root
-   returns a named character vector where:
    -   names are names of pins
    -   values are URLs to directory for the latest version for each pin

The return value can be used to build a `pins::board_url()`:

``` r
manifest_latest(url_demo_manifest())
#>                                                                                                             mtcars-csv 
#>  "https://raw.githubusercontent.com/ijlyttle/pinsManifest/main/tests/testthat/pins/mtcars-csv/20220807T005820Z-48c73/" 
#>                                                                                                            mtcars-json 
#> "https://raw.githubusercontent.com/ijlyttle/pinsManifest/main/tests/testthat/pins/mtcars-json/20220807T005818Z-c2702/"
```
