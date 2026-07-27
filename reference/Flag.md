# Flag

**\[stable\]**

Add columns flagging sites that represent possible statistical outliers
when the Identity statistical method is used.

## Usage

``` r
Flag(
  dfAnalyzed,
  strColumn = "Score",
  vThreshold = c(-3, -2, 2, 3),
  vFlag = c(-2, -1, 0, 1, 2),
  vFlagOrder = c(2, -2, 1, -1, 0)
)
```

## Arguments

- dfAnalyzed:

  `data.frame` where flags should be added.

- strColumn:

  `character` Name of the column to use for thresholding. Default:
  `"Score"`

- vThreshold:

  `numeric` Vector of numeric values representing threshold values.
  Default is `c(-3,-2,2,3)` which is typical for z-scores.

- vFlag:

  `numeric` Vector of flag values. There must be one more item in Flag
  than thresholds - that is
  `length(vThreshold)+1 == length(vFlagValues)`. Default is
  `c(-2,-1,0,1,2)`, which is typical for z-scores.

- vFlagOrder:

  `numeric` Vector of ordered flag values. Output data.frame will be
  sorted based on flag column using the order provided. NULL (or values
  that don't match vFlag) will leave the data unsorted. Must have
  identical values to vFlag. Default is `c(2,-2,1,-1,0)` which puts
  largest z-score outliers first in the data set.

## Value

`data.frame` dfAnalyzed is returned with an additional `Flag` column.

## Details

This function provides a generalized framework for flagging sites as
part of the GSM data model (see
[`vignette("DataModel")`](https://gilead-public.github.io/gsm/articles/DataModel.md)).

## Data Specification

`Flag` is designed to support the input data (`dfAnalyzed`) from the
[`Analyze_Identity()`](https://gilead-public.github.io/gsm/reference/Analyze_Identity.md)
function. At a minimum, the input data must have a `strGroupCol`
parameter and a numeric `strColumn` parameter defined. `strColumn` will
be compared to the specified thresholds in `vThreshold` to define a new
`Flag` column, which identifies possible statistical outliers. If a user
would like to see the directionality of those identified points, they
can define the `strValueColumn` parameter, which will assign a positive
or negative indication to already flagged points.

The following columns are considered required:

- `GroupID` - Group ID; default is `SiteID`

- `GroupLevel` - Group Type

- `strColumn` - A column to use for thresholding

The following column is considered optional:

- `strValueColumn` - A column to be used for the sign/directionality of
  the flagging

## Examples

``` r

dfTransformed <- Transform_Rate(analyticsInput)
dfAnalyzed <- Analyze_NormalApprox(dfTransformed)
#> `OverallMetric`, `Factor`, and `Score` columns created from normal
#> approximation.
dfFlagged <- Flag(dfAnalyzed)
#> ℹ Sorted dfFlagged using custom Flag order: 2.Sorted dfFlagged using custom Flag order: -2.Sorted dfFlagged using custom Flag order: 1.Sorted dfFlagged using custom Flag order: -1.Sorted dfFlagged using custom Flag order: 0.
```
