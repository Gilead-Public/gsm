# Create message describing study summary for Report

**\[stable\]**

## Usage

``` r
Report_OverviewText(lSetup, dfResults, lStudy)
```

## Arguments

- lSetup:

  `list` that is produced by
  [`Report_StudyInfo()`](https://gilead-public.github.io/gsm/reference/Report_StudyInfo.md).

- dfResults:

  `data.frame` A stacked summary of analysis pipeline output. Created by
  passing a list of results returned by
  [`Summarize()`](https://gilead-public.github.io/gsm/reference/Summarize.md)
  to
  [`BindResults()`](https://gilead-public.github.io/gsm/reference/BindResults.md).
  Expected columns: `GroupID`, `GroupLevel`, `Numerator`, `Denominator`,
  `Metric`, `Score`, `Flag`, `MetricID`, `StudyID`, `SnapshotDate`.

- lStudy:

  `list` contains study-level metadata.
