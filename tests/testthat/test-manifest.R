url <- "https://raw.githubusercontent.com/ijlyttle/pinsManifest/main/tests/testthat/pins"

test_that("board_url_manifest() works", {

  board <- board_url_manifest(url)

  expect_s3_class(board, "pins_board_url")

  expect_identical(pins::pin_list(board), c("mtcars-csv", "mtcars-json"))
})

test_that("manifest_latest() works", {
  expect_snapshot(manifest_latest(url))
})
