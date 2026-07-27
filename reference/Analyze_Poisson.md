# Poisson Analysis - Site Residuals.

**\[stable\]**

## Usage

``` r
Analyze_Poisson(dfTransformed)
```

## Arguments

- dfTransformed:

  `data.frame` Transformed data for analysis. Data should have one
  record per site with expected columns: `GroupID`, `GroupLevel`,
  `Numerator`, `Denominator`, and `Metric`. For more details see the
  Data Model vignette:
  [`vignette("DataModel", package = "gsm")`](https://gilead-public.github.io/gsm/articles/DataModel.md).
  For this function, `dfTransformed` should typically be created using
  [`Transform_Rate()`](https://gilead-public.github.io/gsm/reference/Transform_Rate.md).

## Value

`data.frame` with one row per site with columns: GroupID, Numerator,
Denominator, Metric, Score, and PredictedCount.

## Details

Fits a Poisson model to site-level data and adds columns capturing
Residual and Predicted Count for each site.

More information can be found in [The Poisson Regression
Method](https://gilead-public.github.io/gsm/articles/KRI%20Method.html#the-poisson-regression-method)
of the KRI Method vignette.

## Statistical Methods

This function fits a Poisson model to site-level data and then
calculates residuals for each site. The Poisson model is run using
standard methods in the `stats` package by fitting a `glm` model with
family set to `poisson` using a "log" link. Site-level residuals are
calculated using
[`stats::predict.glm`](https://rdrr.io/r/stats/predict.glm.html) via
[`broom::augment`](https://generics.r-lib.org/reference/augment.html).

## Examples

``` r
dfTransformed <- Transform_Rate(analyticsInput)

dfAnalyzed <- Analyze_Poisson(dfTransformed)
#> ℹ Fitting log-linked Poisson generalized linear model of [ Numerator ] ~ [ log( Denominator ) ].
```
