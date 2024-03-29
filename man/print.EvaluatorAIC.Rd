% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/evaluation_EvaluatorAIC.R
\name{print.EvaluatorAIC}
\alias{print.EvaluatorAIC}
\title{Print an EvaluatorAIC}
\usage{
\method{print}{EvaluatorAIC}(x, ...)
}
\arguments{
\item{x}{An \code{EvaluatorAIC} object which should be printed.}

\item{...}{Optional arguments for the print function}
}
\description{
Print an \code{EvaluatorAIC} object.
}
\examples{
cars.ds <- Dataset(data = cars, target = "dist")
mod_fit <- fit(InducerLm(), cars.ds, formula = as.formula("dist~speed"))
evaluation <- EvaluatorAIC(mod_fit)
print(evaluation)
}
