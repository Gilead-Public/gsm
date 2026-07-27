# Funnel Plot Analysis with Normal Approximation for Binary and Rate Outcomes.

**\[stable\]**

Creates analysis results data for percentage/rate data using funnel plot
method with normal approximation.

More information can be found in [The Normal Approximation
Method](https://gilead-public.github.io/gsm/articles/KRI%20Method.html#the-normal-approximation-method)
of the KRI Method vignette.

## Usage

``` r
Analyze_NormalApprox(dfTransformed, strType = "binary")
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

- strType:

  `character` Statistical outcome type. Valid values:

  - `"binary"` (default)

  - `"rate"`

## Value

`data.frame` with one row per site with columns: GroupID, Numerator,
Denominator, Metric, OverallMetric, Factor, and Score.

## Statistical Methods

This function applies funnel plots using asymptotic limits based on the
normal approximation of a binomial distribution for the binary outcome,
or normal approximation of a Poisson distribution for the rate outcome
with volume (the sample sizes or total exposure of the sites) to assess
data quality and safety.

## Examples

``` r
# Binary
dfTransformed <- Transform_Rate(analyticsInput)

dfAnalyzed <- Analyze_NormalApprox(dfTransformed, strType = "binary")
#> `OverallMetric`, `Factor`, and `Score` columns created from normal
#> approximation.

# Rate
dfAnalyzed <- Analyze_NormalApprox(dfTransformed, strType = "rate")
#> `OverallMetric`, `Factor`, and `Score` columns created from normal
#> approximation.
```
