test_that("theme_capd defaults works", {

  th <- theme_capd()[[1]]

  ## test that theme is correct object type
  expect_s3_class(th1, "theme")

  ## test that font is passed on properly
  expect_equal(th$text$family, "Source Sans 3")

  ## test that default font size is 11
  expect_equal(th$text$size, 11)
})
