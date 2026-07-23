# Funnel Plot Analysis with Normal Approximation - Predicted Boundaries.

**\[stable\]**

Applies a funnel plot analysis with normal approximation to site-level
data, and then calculates predicted percentages/rates and upper- and
lower-bounds across the full range of sample sizes/total exposure
values.

## Usage

``` r
Analyze_NormalApprox_PredictBounds(
  dfTransformed,
  vThreshold = c(-3, -2, 2, 3),
  strType = "binary",
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

  `numeric` upper and lower boundaries based on standard deviation.
  Should be identical to the thresholds used in `*_Assess()` functions.

- strType:

  `character` Statistical method. Valid values:

  - `"binary"` (default)

  - `"rate"`

- nStep:

  `numeric` step size of imputed bounds.

## Value

`data.frame` containing predicted boundary values with upper and lower
bounds across the range of observed values.

## Statistical Methods

This function applies a funnel plot analysis with normal approximation
to site-level data and then calculates predicted percentages/rates and
upper- and lower- bounds (funnels) based on the standard deviation from
the mean across the full range of sample sizes/total exposure values.

## Examples

``` r
# Binary
dfTransformed <- Transform_Rate(analyticsInput)

dfAnalyzed <- Analyze_NormalApprox(dfTransformed, strType = "binary")
#> `OverallMetric`, `Factor`, and `Score` columns created from normal
#> approximation.
dfBounds <- Analyze_NormalApprox_PredictBounds(dfTransformed, c(-3, -2, 2, 3), strType = "binary")
#> nStep was not provided. Setting default step to 43.44.

# Rate
dfAnalyzed <- Analyze_NormalApprox(dfTransformed, strType = "rate")
#> `OverallMetric`, `Factor`, and `Score` columns created from normal
#> approximation.
dfBounds <- Analyze_NormalApprox_PredictBounds(dfTransformed, c(-3, -2, 2, 3), strType = "rate")
#> nStep was not provided. Setting default step to 43.44.
```
