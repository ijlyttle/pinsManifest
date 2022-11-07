test_that("pin_write_manifest() works", {

  # copy test-fixture, remove pin manifest
  tempdir <- withr::local_tempdir()
  fs::dir_copy("pins", tempdir)
  fs::file_delete(fs::path(tempdir, "pins", "_pins.yaml"))

  board <- pins::board_folder(fs::path(tempdir, "pins"))

  expect_error(pin_write_manifest(3), "numeric")

  # create new manifest
  expect_message(
    board_return <- pin_write_manifest(board),
    "^Manifest file"
  )

  expect_identical(board_return, board)

  # expect new manifest identical to old manifest
  expect_true(
    compare_file_text(
      fs::path(tempdir, "pins", "_pins.yaml"),
      fs::path("pins", "_pins.yaml")
    )
  )
})
