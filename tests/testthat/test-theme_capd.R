test_that("theme_capd defaults works", {

  th <- theme_capd()[[1]]

  ## test that theme is correct object type
  expect_s3_class(th, "theme")

  ## test that font is passed on properly
  expect_equal(th$text$family, "Source Sans 3")

  ## test that default font size is 11
  expect_equal(th$text$size, 11)
})

test_that("theme_capd font sizes adjust", {

  size_sm <- 4
  th <- theme_capd(base_size = size_sm)[[1]]

  ## test that default font size is 4
  expect_equal(th$text$size, size_sm)

  ## test that title relative font size is 1.2
  expect_equal(as.numeric(th$plot.title$size) * as.numeric(th$text$size), size_sm * 1.2)

  ## test that title relative font size is 1.2
  expect_equal(as.numeric(th$plot.title$size) * as.numeric(th$text$size), size_sm * 1.2)

})
