% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Models_XGBoost.R
\name{predict.ModelXGBoost}
\alias{predict.ModelXGBoost}
\title{Predict values for \code{fit.InducerXGBoost}}
\usage{
\method{predict}{ModelXGBoost}(object, newdata, ...)
}
\arguments{
\item{object}{A model of class \code{ModelXGBoost}}

\item{newdata}{data of class \code{data.frame} or \code{Dataset}}

\item{...}{further arguments}
}
\value{
the fitted values. If the input is a data.frame the predicted values will be given back as a vector of
class \code{numeric}. If the input is dataset like used in model, then the result will be a \code{data.frame}
with predictions and true values in dataset
}
\description{
Predict from the results of a xgboost model
}
\examples{
cars.data <- Dataset(data = cars, target = "dist")
inducer <- InducerXGBoost()
xgbfit <- fit.InducerXGBoost(.inducer = inducer, .data = cars.data)
predict.ModelXGBoost(object = xgbfit, newdata = data.frame(speed = 10))
predict.ModelXGBoost(object = xgbfit, newdata = cars.data[c(1, 2, 3, 4), ])
}
