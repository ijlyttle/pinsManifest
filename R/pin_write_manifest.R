#' Write a manifest file
#'
#' This can be used if you have a `pins::board_folder()` that you want to
#' serve as a web-site such that others can consume using `pins::board_url()`.
#'
#' This function is called for the side-effect of writing a manifest file,
#' `_pins.yaml`.
#'
#' @param board A pin board, currently only `board_folder()` is supported.
#'
#' @return `board`, invisibly.
#'
#' @export
#'
pin_write_manifest <- function(board) {
  UseMethod("pin_write_manifest")
}

#' @export
#'
pin_write_manifest.default <- function(board) {
  stop(glue::glue("Not supported for {class(board)[[1]]}."))
}

#' @export
#'
pin_write_manifest.pins_board_folder <- function(board) {

  manifest <- make_manifest_folder(board$path)
  yaml::write_yaml(manifest, fs::path(board$path, "_pins.yaml"))

  message(
    glue::glue("Manifest file written to `{fs::path(board$path, '_pins.yaml')}`")
  )

  invisible(board)
}
