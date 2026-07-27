# Summarize flags by SnapshotDate

**\[stable\]**

Create a table of longitudinal study data by site, study, or country,
showing flags over time.

## Usage

``` r
Report_FlagOverTime(
  dfResults,
  dfMetrics,
  strGroupLevel = c("Site", "Study", "Country")
)
```

## Arguments

- dfResults:

  `data.frame` A stacked summary of analysis pipeline output. Created by
  passing a list of results returned by
  [`Summarize()`](https://gilead-public.github.io/gsm/reference/Summarize.md)
  to
  [`BindResults()`](https://gilead-public.github.io/gsm/reference/BindResults.md).
  Expected columns: `GroupID`, `GroupLevel`, `Numerator`, `Denominator`,
  `Metric`, `Score`, `Flag`, `MetricID`, `StudyID`, `SnapshotDate`.

- dfMetrics:

  `data.frame` Metric-specific metadata for use in charts and reporting.
  Created by passing an `lWorkflow` object to
  [`MakeMetric()`](https://gilead-public.github.io/gsm/reference/MakeMetric.md).
  Expected columns: `File`, `MetricID`, `Group`, `Abbreviation`,
  `Metric`, `Numerator`, `Denominator`, `Model`, `Score`, and
  `Threshold`. For more details see the Data Model vignette:
  [`vignette("DataModel", package = "gsm")`](https://gilead-public.github.io/gsm/articles/DataModel.md).

- strGroupLevel:

  A string specifying the group type.

## Value

An object of class `gt_tbl`.
