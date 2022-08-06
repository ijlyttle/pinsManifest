test_that("make_manifest_folder works", {
  expect_snapshot(make_manifest_folder("pins"))
})
