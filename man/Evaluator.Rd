% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/evaluation_Evaluator.R
\name{Evaluator}
\alias{Evaluator}
\title{Build an Evaluator}
\usage{
Evaluator(.name, .configuration = list(), .value = numeric(0), ...)
}
\arguments{
\item{.name}{The name of the Evaluator provided as a string.}

\item{.configuration}{Optional argument for setting the configuration. The configuration has to be a named list.}

\item{.value}{The value of the evaluation measure being used.}

\item{...}{optional arguments.}
}
\value{
An \code{Evaluator} object.
}
\description{
Build an Evaluator object.
}
