% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Models_XGBoost.R
\name{predict.ModelXGBoost}
\alias{predict.ModelXGBoost}
\title{Predict values for \code{fit.InducerXGBoost}}
\usage{
\method{predict}{ModelXGBoost}(model, newdata, ...)
}
\arguments{
\item{model}{A model of class \code{ModelXGBoost}}

\item{newdata}{data of class \code{data.frame} or \code{Dataset}}
}
\value{
the fitted values. If the input is a data.frame the predicted values will be given back as a vector. If the input is dataset like used in model, then the result will be a dataframe with predictions and true values in dataset

An object with the predictions of class \code{numeric} or \code{data.frame}
}
\description{
Predict from the results of a xgboost model
}