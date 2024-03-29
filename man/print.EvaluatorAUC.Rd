% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/evaluation_EvaluatorAccuracyROC.R
\name{print.EvaluatorAUC}
\alias{print.EvaluatorAUC}
\title{Print an EvaluatorAUC.}
\usage{
\method{print}{EvaluatorAUC}(x, ...)
}
\arguments{
\item{x}{An \code{EvaluatorAUC} object which should be printed.}

\item{...}{Optional arguments for the print function}
}
\description{
Print an \code{EvaluatorAUC} object.
}
\examples{
x <- data.frame(var1 = c(1, 2, 3, 4, 5, 6, 7), target = c(1, 1, 1, 1, 0, 1, 0))
predictions <- c(1)
evaluation <- EvaluatorAUC(predictions, x, "target")
print(evaluation)
# or simply
evaluation
}
\seealso{
\code{\link[=EvaluatorAUC]{EvaluatorAUC()}}
}
