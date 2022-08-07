url <- "https://raw.githubusercontent.com/ijlyttle/pinsManifest/main/tests/testthat/pins"
manifest_url <- get_manifest(url)

test_that("make_manifest_folder() works", {
  expect_snapshot(make_manifest_folder("pins"))
})

test_that("get_manifest() works", {
  expect_snapshot(manifest_url)
})

test_that("make_manifest_url() works", {
  expect_snapshot(make_manifest_url(manifest_url, url))
})
