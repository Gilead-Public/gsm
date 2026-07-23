# Poisson Analysis - Predicted Boundaries.

**\[stable\]**

Fits a Poisson model to site-level data and then calculates predicted
count values and upper- and lower- bounds for across the full range of
exposure values.

## Usage

``` r
Analyze_Poisson_PredictBounds(
  dfTransformed,
  vThreshold = c(-5, 5),
  nStep = NULL
)
```

## Arguments

- dfTransformed:

  `data.frame` Transformed data for analysis. Data should have one
  record per site with expected columns: `GroupID`, `GroupLevel`,
  `Numerator`, `Denominator`, and `Metric`. For more details see the
  Data Model vignette:
  [`vignette("DataModel", package = "gsm")`](https://gilead-public.github.io/gsm/dev/articles/DataModel.md).
  For this function, `dfTransformed` should typically be created using
  [`Transform_Rate()`](https://gilead-public.github.io/gsm/dev/reference/Transform_Rate.md).

- vThreshold:

  `numeric` upper and lower boundaries in residual space. Should be
  identical to the thresholds used AE_Assess().

- nStep:

  `numeric` step size of imputed bounds.

## Value

`data.frame` containing predicted boundary values with upper and lower
bounds across the range of observed values.

## Statistical Methods

This function fits a Poisson model to site-level data and then
calculates residuals for each site. The Poisson model is run using
standard methods in the `stats` package by fitting a `glm` model with
family set to `poisson` using a "log" link. Upper and lower boundary
values are then calculated using the method described here TODO: Add
link.

## Examples

``` r
dfTransformed <- Transform_Rate(analyticsInput)

dfBounds <- Analyze_Poisson_PredictBounds(dfTransformed, c(-5, 5))
#> → nStep was not provided. Setting default step to 0.0128712626417737
```
