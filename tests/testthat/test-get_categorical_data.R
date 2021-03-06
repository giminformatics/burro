context("test-get_categorical_data")
library(ggplot2)
library(fivethirtyeight)
data(diamonds)

cats1 <- get_category_variables(iris)
cats2 <- get_category_variables(diamonds)
cats4 <- get_category_variables(mtcars)

test_that("get category variables works", {
  expect_equal(length(cats1), 1)
  expect_equal(length(cats2), 3)
  expect_equal(names(cats1), "Species")
  expect_equal(NULL, cats4)
})

#checking whether check_data assigns attributes correctly
data1 <- check_data(mtcars)
data2 <- check_data(diamonds)

test_that("check_data works",{
  expect_null(attr(data1, "categoricalVars"))
  expect_equal(11, length(attr(data1, "numericVars")))
  expect_equal(3, length(attr(data2, "categoricalVars")))
  expect_equal(7, length(attr(data2, "numericVars")))

})


