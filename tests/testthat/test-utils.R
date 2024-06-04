test_that("bisonpicsuite packages returns character vector of package names", {
  out <- bisonpicsuite_packages()
  expect_type(out, "character")
  expect_true("bisonpictools" %in% out)
})
