% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/inducer_InducerLm.R
\name{InducerLm}
\alias{InducerLm}
\title{Function to create an object of class \code{InducerLm}}
\usage{
InducerLm(
  .data = NULL,
  formula,
  subset,
  weights,
  na.action,
  method = "qr",
  model = TRUE,
  x = FALSE,
  y = FALSE,
  qr = TRUE,
  singular.ok = TRUE,
  offset
)
}
\arguments{
\item{.data}{data object of class \code{Dataset}.}

\item{formula}{a formula that should be used for the linear model.}

\item{subset}{An optional argument. A vector specifying a subset of observations that should be used
for fitting the model.}

\item{weights}{An optional argument. A vector of weights that should be used for fitting the model.}

\item{na.action}{An optional argument. A function that specifies how to handle missing values.}

\item{method}{The method which should be used for fitting. For more information see \link{lm}}

\item{model}{if true model is returned}

\item{x}{if true x is returned}

\item{y}{if true y is returned}

\item{qr}{if true the QR decomposition is returned}

\item{singular.ok}{logical. If FALSE (the default in S but not in R) a singular fit is an error}

\item{offset}{this can be used to specify an a priori known component to be included in the linear
predictor during fitting.}
}
\value{
a \code{InducerLm} object
}
\description{
If .data is empty an \code{InducerLm} object will be created. If .data is a \code{Dataset} object
a LM model will be fitted
}
\examples{
cars.data <- Dataset(data = cars, target = "dist")
inducer <- InducerLm()
}
\seealso{
\code{\link[=fit.InducerLm]{fit.InducerLm()}}
}
