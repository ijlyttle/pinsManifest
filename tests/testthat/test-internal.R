test_that("make_manifest_folder() works", {
  expect_snapshot(make_manifest_folder("pins"))
})

test_that("get_manifest() works", {
  expect_snapshot(
    # get_manifest("https://raw.githubusercontent.com/ijlyttle/pinsManifest/main/tests/testthat/pins")
  )
})
