# Calculate needed values for report

**\[stable\]**

## Usage

``` r
Report_Setup(dfGroups = NULL, dfMetrics = NULL, dfResults = NULL)
```

## Arguments

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

- dfResults:

  `data.frame` A stacked summary of analysis pipeline output. Created by
  passing a list of results returned by
  [`Summarize()`](https://gilead-public.github.io/gsm/dev/reference/Summarize.md)
  to
  [`BindResults()`](https://gilead-public.github.io/gsm/dev/reference/BindResults.md).
  Expected columns: `GroupID`, `GroupLevel`, `Numerator`, `Denominator`,
  `Metric`, `Score`, `Flag`, `MetricID`, `StudyID`, `SnapshotDate`.

## Value

`list` with the following elements:

- `GroupLevel` (character): The group level of the report.

- `SnapshotDate` (Date): The date of the snapshot.

- `lStudy` (list): Study-level metadata.

- `StudyID` (character): The study ID.

- `red_kris` (numeric): The number of red flags.

- `amber_kris` (numeric): The number of amber flags.
