# Visualize_Metric Function

**\[stable\]**

The function creates all available charts for a metric using the data
provided

## Usage

``` r
Visualize_Metric(
  dfResults = dfResults,
  dfBounds = NULL,
  dfGroups = NULL,
  dfMetrics = NULL,
  strMetricID = NULL,
  strSnapshotDate = NULL,
  bDebug = FALSE
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

- dfBounds:

  `data.frame` Set of predicted percentages/rates and upper- and
  lower-bounds across the full range of sample sizes/total exposure
  values for reporting. Created by passing `dfResults` and `dfMetrics`
  to
  [`MakeBounds()`](https://gilead-public.github.io/gsm/dev/reference/MakeBounds.md).
  Expected columns: `Threshold`, `Denominator`, `Numerator`, `Metric`,
  `MetricID`, `StudyID`, `SnapshotDate`.

- dfGroups:

  `data.frame` Group-level metadata dictionary. Created by passing CTMS
  site and study data to
  [`MakeLongMeta()`](https://gilead-public.github.io/gsm/dev/reference/MakeLongMeta.md).
  Expected columns: `GroupID`, `GroupLevel`, `Param`, `Value`.

- dfMetrics:

  `data.frame` Metric-specific metadata for use in charts and reporting.
  Created by passing an `lWorkflow` object to
  [`MakeMetric()`](https://gilead-public.github.io/gsm/dev/reference/MakeMetric.md).
  Expected columns: `File`, `MetricID`, `Group`, `Abbreviation`,
  `Metric`, `Numerator`, `Denominator`, `Model`, `Score`, and
  `Threshold`. For more details see the Data Model vignette:
  [`vignette("DataModel", package = "gsm")`](https://gilead-public.github.io/gsm/dev/articles/DataModel.md).

- strMetricID:

  `character` MetricID to subset the data.

- strSnapshotDate:

  `character` Snapshot date to subset the data.

- bDebug:

  `logical` Display console in html viewer for debugging. Default is
  `FALSE`.

## Value

A list containing the following charts:

- scatterPlot: A scatter plot using JavaScript.

- barChart: A bar chart using JavaScript with metric on the y-axis.

- timeSeries: A time series chart using JavaScript with score on the
  y-axis.

- metricTable: A table containing all

## Examples

``` r
lCharts <- Visualize_Metric(
  dfResults = reportingResults,
  dfBounds = reportingBounds,
  dfGroups = reportingGroups,
  dfMetrics = reportingMetrics,
  strMetricID = "Analysis_kri0001"
)
#> Parsed -2,-1,2,3 to numeric vector: -2, -1, 2, 3
```
