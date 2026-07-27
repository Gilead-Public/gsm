# Shiny bindings for Widget_FlagOverTime

**\[stable\]**

Output and render functions for using Widget_FlagOverTime within Shiny
applications and interactive Rmd documents.

## Usage

``` r
Widget_FlagOverTimeOutput(outputId, width = "100%", height = "400px")

renderWidget_FlagOverTime(
  dfResults,
  dfMetrics,
  strGroupLevel = c("Site", "Study", "Country")
)
```

## Arguments

- outputId:

  output variable to read from

- width, height:

  Must be a valid CSS unit (like `'100%'`, `'400px'`, `'auto'`) or a
  number, which will be coerced to a string and have `'px'` appended.

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

  `character` Value for the group level. Default: "Site".
