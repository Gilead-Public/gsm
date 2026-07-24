# Report_KRI function

**\[stable\]**

This function generates a KRI report based on the provided inputs.

## Usage

``` r
Report_KRI(
  lCharts = NULL,
  dfResults = NULL,
  dfGroups = NULL,
  dfMetrics = NULL,
  strOutputDir = getwd(),
  strOutputFile = NULL
)
```

## Arguments

- lCharts:

  A list of charts to include in the report.

- dfResults:

  `data.frame` A stacked summary of analysis pipeline output. Created by
  passing a list of results returned by
  [`Summarize()`](https://gilead-public.github.io/gsm/dev/reference/Summarize.md)
  to
  [`BindResults()`](https://gilead-public.github.io/gsm/dev/reference/BindResults.md).
  Expected columns: `GroupID`, `GroupLevel`, `Numerator`, `Denominator`,
  `Metric`, `Score`, `Flag`, `MetricID`, `StudyID`, `SnapshotDate`.

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

- strOutputDir:

  The output directory path for the generated report. If not provided,
  the report will be saved in the current working directory.

- strOutputFile:

  The output file name for the generated report. If not provided, the
  report will be named based on the study ID, Group Level and Date.

## Value

File path of the saved report html is returned invisibly. Save to object
to view absolute output path.

## Examples

``` r
if (FALSE) { # \dontrun{
# Run site-level KRI report.
lChartsSite <- MakeCharts(
  dfResults = reportingResults,
  dfGroups = reportingGroups,
  dfMetrics = reportingMetrics,
  dfBounds = reportingBounds
)

strOutputFile <- "StandardSiteReport.html"
kri_report_path <- Report_KRI(
  lCharts = lChartsSite,
  dfResults = reportingResults,
  dfGroups = reportingGroups,
  dfMetrics = reportingMetrics,
  strOutputFile = strOutputFile
)

# Run country-level KRI report.
lChartsCountry <- MakeCharts(
  dfResults = reportingResults_country,
  dfGroups = reportingGroups_country,
  dfMetrics = reportingMetrics_country,
  dfBounds = reportingBounds_country
)

strOutputFile <- "StandardCountryReport.html"
kri_report_path <- Report_KRI(
  lCharts = lChartsCountry,
  dfResults = reportingResults_country,
  dfGroups = reportingGroups_country,
  dfMetrics = reportingMetrics_country,
  strOutputFile = strOutputFile
)
} # }
```
