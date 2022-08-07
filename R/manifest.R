#' Create a URL board with a manifest
#'
#' @inheritParams manifest_latest
#' @inherit pins::board_url params return
#'
#' @export
#' @examples
#' board <- board_url_manifest(url_demo_manifest())
#' pins::pin_list(board)
#' pins::pin_meta(board, "mtcars-csv")
#'
board_url_manifest <- function(url, cache = NULL,
                               use_cache_on_failure = is_interactive()) {

  url %>%
    manifest_latest() %>%
    pins::board_url(cache = cache, use_cache_on_failure = use_cache_on_failure)
}

#' Get the manifest of the latest pins at a URL
#'
#' Reads a manifest created using [pin_write_manifest()] to create a named
#' character vector that can be used to create a [pins::board_url()].
#'
#' @param url root URL of the board
#'
#' @return `character`, named vector:
#'   - names are names of pins
#'   - values
#'
#' @examples
#' manifest_latest(url_demo_manifest())
#' @export
#'
manifest_latest <- function(url) {
   url %>%
    get_manifest() %>%
    make_manifest_url(url)
}

#' Demonstration URL
#'
#' @return `character` URL for demonstration board
#'
#' @examples
#' url_demo_manifest()
#' @export
#'
url_demo_manifest <- function() {
  "https://raw.githubusercontent.com/ijlyttle/pinsManifest/main/tests/testthat/pins"
}
