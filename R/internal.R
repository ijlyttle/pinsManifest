# returns named list of pins (names) and versions (values)
make_manifest_folder <- function(path) {

  # get subdirectories of path - these are the (possible) pin-names
  paths_pins <- fs::dir_ls(path, type = "directory")

  # map over subdirectories
  result <- map(paths_pins, get_version_directories)
  names(result) <- fs::path_rel(paths_pins, path)

  result
}

get_version_directories <- function(path) {

  names_valid <-
    fs::dir_ls(path, type = "directory") |>
    keep(~fs::file_exists(fs::path(.x, "data.txt"))) |>
    fs::path_rel(path) |>
    identity()

  names_valid
}

# returns named list found at "{url}/manifest.txt"
get_manifest <- function(url) {

}

# returns named list of pins (names) and URLs to latest versions
make_manifest_url <- function(manifest, url) {

}
