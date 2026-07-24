# Calculate Bounds for display in scatterplots

**\[stable\]**

Calculate bounds across a set of metrics.

## Usage

``` r
MakeBounds(
  dfResults,
  dfMetrics,
  strMetrics = unique(dfResults$MetricID),
  dSnapshotDate = unique(dfResults$SnapshotDate),
  strStudyID = unique(dfResults$StudyID)
)
```

## Arguments

- dfResults:

  `data.frame` A stacked summary of analysis pipeline output. Created by
  passing a list of results returned by
  [`Summarize()`](https://gilead-public.github.io/gsm/dev/reference/Summarize.md)
  to
  [`BindResults()`](https://gilead-public.github.io/gsm/dev/reference/BindResults.md).
  Expected columns: `GroupID`, `GroupLevel`, `Numerator`, `Denominator`,
  `Metric`, `Score`, `Flag`, `MetricID`, `StudyID`, `SnapshotDate`.

- dfMetrics:

  `data.frame` Metric-specific metadata for use in charts and reporting.
  Created by passing an `lWorkflow` object to
  [`MakeMetric()`](https://gilead-public.github.io/gsm/dev/reference/MakeMetric.md).
  Expected columns: `File`, `MetricID`, `Group`, `Abbreviation`,
  `Metric`, `Numerator`, `Denominator`, `Model`, `Score`, and
  `Threshold`. For more details see the Data Model vignette:
  [`vignette("DataModel", package = "gsm")`](https://gilead-public.github.io/gsm/dev/articles/DataModel.md).

- strMetrics:

  Character vector of `MetricID`s to include in `dfBounds`. All unique
  values from `dfResults$MetricID` used by default.

- dSnapshotDate:

  Snapshot date. Uses `dfResults$SnapshotDate` by default. If more than
  one snapshot date is found in `dfResults`, a warning is thrown and
  this function returns `NULL`.

- strStudyID:

  Study ID. Uses `dfResults$StudyID` by default. If more than one
  snapshot date is found in `dfResults`, a warning is thrown and this
  function returns `NULL`.

## Value

A data frame.

## Examples

``` r
dfBounds <- MakeBounds(
  dfResults = reportingResults,
  dfMetrics = reportingMetrics
)
#> Creating stacked dfBounds data for strMetrics
#> Warning: More than one `dSnapshotDate` found. Returning NULL
```
