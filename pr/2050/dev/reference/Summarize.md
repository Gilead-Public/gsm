# Make Summary Data Frame

**\[stable\]**

Create a concise summary of assessment results that is easy to aggregate
across assessments

## Usage

``` r
Summarize(dfFlagged, nMinDenominator = NULL)
```

## Arguments

- dfFlagged:

  data.frame in format produced by
  [`Flag()`](https://gilead-public.github.io/gsm/dev/reference/Flag.md).

- nMinDenominator:

  `numeric` Specifies the minimum denominator required to return a
  `score` and calculate a `flag`. Default: NULL

## Value

Simplified finding data.frame with columns for GroupID, GroupType,
Metric, Score, Flag when associated with a workflow.

## Details

`Summarize` supports the input data (`dfFlagged`) from the `Flag`
function.

## Data Specification

(`dfFlagged`) has the following required columns:

- `GroupID` - Group ID

- `GroupLevel` - Group Type

- `Flag` - Flagging value of -1, 0, or 1

- `Score` - Column from analysis results.

## Examples

``` r

dfTransformed <- Transform_Rate(analyticsInput)
dfAnalyzed <- Analyze_NormalApprox(dfTransformed)
#> `OverallMetric`, `Factor`, and `Score` columns created from normal
#> approximation.
dfFlagged <- Flag(dfAnalyzed)
#> ℹ Sorted dfFlagged using custom Flag order: 2.Sorted dfFlagged using custom Flag order: -2.Sorted dfFlagged using custom Flag order: 1.Sorted dfFlagged using custom Flag order: -1.Sorted dfFlagged using custom Flag order: 0.
dfSummary <- Summarize(dfFlagged)
```
