# Parameters used in multiple functions

Reused parameter definitions are gathered here for easier usage.

## Arguments

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

- dfInput:

  `data.frame` Input data with one record per subject. Created by
  passing Raw+ data into
  [`Input_Rate()`](https://gilead-public.github.io/gsm/dev/reference/Input_Rate.md).
  Expected columns: `GroupID`, `GroupLevel`, `Numerator`, `Denominator`
  and/or columns specified in `strCountCol` and `strGroupCol`.

- lMetric:

  `list` Metric-specific metadata for use in charts and reporting.
  Created by passing an `lWorkflow` object to
  [`MakeMetric()`](https://gilead-public.github.io/gsm/dev/reference/MakeMetric.md)
  and turing it into a list. Expected columns: `File`,`MetricID`,
  `Group`, `Abbreviation`, `Metric`, `Numerator`, `Denominator`,
  `Model`, `Score`, and `strThreshold`. For more details see the Data
  Model vignette:
  [`vignette("DataModel", package = "gsm")`](https://gilead-public.github.io/gsm/dev/articles/DataModel.md).

- lParamLabels:

  `list` Labels for parameters, with the parameters as names, and the
  label as value.

- bDebug:

  `logical` Print debug messages? Default: `FALSE`.
