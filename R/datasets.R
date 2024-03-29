#' @title Create a `Dataset` object
#'
#' @description
#' From a given named `matrix` or a named `data.frame` a `Dataset` is created.
#' The user needs to specify the target covariable/columnname as a string.
#' Optionally the `type` can be set to either `regression` or `classification`.
#' If this is not provided the target will be automatically inferred from
#' the type in matrix or data.frame.
#'
#' @param data A matrix or data.frame object with relevant data and named columns.
#' @param target A string of a column name of data specifying the target.
#' @param type A string specifying whether a regression or classification should be done.
#' @param name Name attribute that will be stored internally.
#'
#' @return An object of class 'Dataset' with attributes 'data' containing the actual data as a data.frame,
#'     'target' with the name of the target covariable, 'type' which is either 'classification' or 'regression'
#'  and 'name'.
#'
#' @examples
#' cars.data <- Dataset(cars, target = "dist")
#'
#' @export
Dataset <- function(data, target, type = NULL, name = as.name(deparse(substitute(data), 20)[[1]])) {
  # checks
  checkmate::assert(checkmate::check_data_frame(data), checkmate::check_matrix(data))
  checkmate::assert(target %in% names(data))
  if (inherits(data, "matrix")) {
    checkmate::assert_numeric(data)
  }
  checkmate::assert_named(data)
  checkmate::assert_character(target)
  # set type to classification or regression
  if (is.null(type)) {
    type <- if (is.factor(data[[target]]) || is.character(data[[target]])) "Classification" else "Regression"
  } else {
    checkmate::assert_choice(type, c("regression", "classification"))
  }
  # return a structure with actual data and metainfo
  structure(
    list(
      data = data.table::as.data.table(data),
      target = target,
      type = type,
      name = as.character(name)
    ),
    class = c(paste0("Dataset", type), "Dataset")
  )
}
#' @title A print method for `Dataset` objects
#'
#' @description
#' Prints the first and last two rows of `data` along with an informative text
#' on the target and task.
#'
#' @param x an object of class 'Dataset'
#' @param ... other arguments passed to function
#'
#' @examples
#' cars.data <- Dataset(cars, target = "dist")
#' print(cars.data)
#'
#' @export
`print.Dataset` <- function(x, ...) {
  checkmate::assertClass(x, "Dataset")
  cat(sprintf(
    'Dataset "%s", predicting "%s" (%s)\n',
    x$name, x$target, x$type
  ))
  print(x$data, topn = 2)
  invisible(x)
}
#' @title Subset a `Dataset` Object
#'
#' @description
#' This function subsets a custom dataset object based on specified row indices and optional column names.
#' If column names are not specified, it defaults to using all columns. The function checks if the provided
#' column names exist in the dataset and whether they include the target variable, which cannot be removed.
#'
#' @param x A  Dataset object.
#' @param i row indices or nothing.
#' @param j covariate names or nothing.
#' @param ... Other arguments passed to function
#'
#' @return A object of type 'Dataset.
#'
#' @examples
#' cars.data <- Dataset(cars, target = "dist")
#' cars.data[c(1, 2, 3), "dist"]
#' @export
`[.Dataset` <- function(x, i, j = NULL, ...) {
  checkmate::assert_class(x, "Dataset")
  checkmate::assert(is.null(j) | is.character(j))
  # check or set subsetting args
  if (missing(i)) {
    i <- seq_len(nrow(x$data))
  } else {
    i <- unique(i)
    checkmate::assert_integerish(i)
  }
  if (is.null(j)) {
    j <- colnames(x$data)
  } else {
    checkmate::assert_character(j)
    checkmate::assert(all(j %in% names(x$data)))
    j <- unique(j)
  }
  # check for target covariate
  if (!x$target %in% j) stop(sprintf('Cannot remove target column "%s"', x$target))
  subsetted <- x$data[i, j, with = FALSE]
  x$data <- subsetted
  x
}
#' @title Create a data.frame object from a `Dataset` object
#'
#' @description
#' This function returns the actual data of a Dataset as a data.frame.
#' Additional information associated with a Dataset are neglected.
#'
#' @param x A Dataset object.
#' @param ... Additional arguments
#'
#' @return A data.frame with the actual data of the original Dataset.
#'
#' @examples
#' cars.data <- Dataset(cars, target = "dist")
#' as.data.frame(cars.data)
#'
#' @export
as.data.frame.Dataset <- function(x, ...) {
  checkmate::assert_class(x, "Dataset")
  as.data.frame(x$data)
}
