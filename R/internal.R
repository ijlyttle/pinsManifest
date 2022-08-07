make_manifest_folder <- function(path) {

  # given a `path` to a folder-board directory,
  # return a named character vector:
  #  - names are names of pins
  #  - values are names of version sub-directories (contain data.txt)

  # get subdirectories of path - these are the (possible) pin-names
  paths_pins <- fs::dir_ls(path, type = "directory")

  # map over subdirectories
  result <- map(paths_pins, get_version_directories)
  names(result) <- fs::path_rel(paths_pins, path)

  # keep non-empty values
  result <- compact(result)

  result
}

get_version_directories <- function(path) {

  # given a `path` to a pin directory,
  # return an unnamed character vector:
  #  - values are names of version sub-directories (contain data.txt)

  names_valid <-
    fs::dir_ls(path, type = "directory") %>%
    keep(~fs::file_exists(fs::path(.x, "data.txt"))) %>%
    fs::path_rel(path)

  names_valid
}

get_manifest <- function(url) {

  # given a `url`,
  # returns named list found at "{url}/pins.txt"

  # remove trailing slash (if there)
  url <- gsub('/$', '', url)

  tempfile <- withr::local_tempfile()

  # pins:::http_download() might be preferable
  utils::download.file(glue::glue("{url}/pins.txt"), tempfile, quiet = TRUE)

  yaml::read_yaml(tempfile)
}

# returns named list of pins (names) and URLs to latest versions
make_manifest_url <- function(manifest, url) {

  # given a `manifest` and a `url`,
  # return a named character vector where:
  #  - names are names of pins
  #  - values are URLs to the latest versions of the pins

  # remove trailing slash (if there)
  url <- gsub('/$', '', url)

  version_latest <- map(manifest, ~glue::glue("{url}/{max(.x)}/"))

  # coerce to character vector
  result <- unlist(version_latest)

  result
}

