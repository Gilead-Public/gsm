# Identity Analysis.

**\[stable\]**

Used in the data pipeline between `Transform` and `Flag` to rename KRI
and Score columns.

More information can be found in [The Identity
Method](https://gilead-public.github.io/gsm/articles/KRI%20Method.html#the-identity-method)
of the KRI Method vignette.

## Usage

``` r
Analyze_Identity(dfTransformed, strValueCol = "Metric")
```

## Arguments

- dfTransformed:

  `data.frame` Transformed data for analysis. Data should have one
  record per site with expected columns: `GroupID`, `GroupLevel`,
  `Numerator`, `Denominator`, and `Metric`. For more details see the
  Data Model vignette:
  [`vignette("DataModel", package = "gsm")`](https://gilead-public.github.io/gsm/articles/DataModel.md).
  For this function, `dfTransformed` should typically be created using
  [`Transform_Count()`](https://gilead-public.github.io/gsm/reference/Transform_Count.md).

- strValueCol:

  `character` Name of column that will be copied as `Score`

## Value

`data.frame` with one row per site with columns: GroupID, TotalCount,
Metric, and Score.

## Examples

``` r
dfTransformed <- Transform_Count(analyticsInput, strCountCol = "Numerator")
dfAnalyzed <- Analyze_Identity(dfTransformed)
#> `Score` column created from `Metric`.
```
