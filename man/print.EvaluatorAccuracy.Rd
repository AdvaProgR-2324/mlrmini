% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/evaluation_EvaluatorAccuracyROC.R
\name{print.EvaluatorAccuracy}
\alias{print.EvaluatorAccuracy}
\title{Print an EvaluatorAccuracy}
\usage{
\method{print}{EvaluatorAccuracy}(x, ...)
}
\arguments{
\item{x}{An \code{EvaluatorAccuracy} object which should be printed.}

\item{...}{Optional arguments for the print function.}
}
\description{
Print an \code{EvaluatorAccuracy} object.
}
\examples{
x <- data.frame(var1 = c(1, 2, 3, 4, 5, 6, 7), target = c(1, 1, 1, 1, 0, 1, 0))
predictions <- c(1)
evaluation <- EvaluatorAccuracy(predictions, x, "target")
print(evaluation)
}
\seealso{
\code{\link[=EvaluatorAccuracy]{EvaluatorAccuracy()}}
}
