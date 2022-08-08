path_fixture <- function() {
  here::here("tests", "testthat", "pins")
}

# this is meant to be run interactively: only by developers of this package
# it is run for the side-effect of creating a test fixture
create_test_fixture <- function() {

  path_pins <- path_fixture()

  if (fs::dir_exists(path_pins)) {
    fs::dir_delete(path_pins)
  }

  board_fixture <- pins::board_folder(path_pins, versioned = TRUE)

  mtcars <- datasets::mtcars

  pins::pin_write(board_fixture, mtcars, name = "mtcars-json", type = "json")
  Sys.sleep(2)
  pins::pin_write(board_fixture, mtcars, name = "mtcars-json", type = "json")

  # write phantom directory (no data.txt)
  fs::dir_create(fs::path(path_pins, "mtcars-json", "not-a-version"))

  pins::pin_write(board_fixture, mtcars, name = "mtcars-csv", type = "csv")

  # write phantom pin
  fs::dir_create(path_pins, "not-a-pin")

  # write pins.txt
  manifest <- make_manifest_folder(path_pins)
  yaml::write_yaml(manifest, fs::path(path_pins, "pins.txt"))

  invisible(NULL)
}
