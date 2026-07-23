# Generate a summary table for a report

**\[stable\]**

This function generates a summary table for a report by joining the
provided results data frame with the site-level metadata from dfGroups.
It then filters and arranges the data based on certain conditions and
displays the result in a datatable.

## Usage

``` r
Report_MetricTable(
  dfResults,
  dfGroups = NULL,
  strGroupLevel = c("Site", "Country", "Study"),
  strGroupDetailsParams = NULL,
  vFlags = c(-2, -1, 1, 2)
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
  `Metric`, `Score`, `Flag`, `MetricID`, `StudyID`, `SnapshotDate`. For
  this function, `dfResults` must be filtered to a single KRI
  (`MetricID`).

- dfGroups:

  `data.frame` Group-level metadata dictionary. Created by passing CTMS
  site and study data to
  [`MakeLongMeta()`](https://gilead-public.github.io/gsm/dev/reference/MakeLongMeta.md).
  Expected columns: `GroupID`, `GroupLevel`, `Param`, `Value`.

- strGroupLevel:

  group level for the table

- strGroupDetailsParams:

  one or more parameters from dfGroups to be added as columns in the
  table

- vFlags:

  `integer` List of flag values to include in output table. Default:
  `c(-2, -1, 1, 2)`.

## Value

A [`gt::gt()`](https://gt.rstudio.com/reference/gt.html) containing the
summary table.

## Examples

``` r
# site-level report
Report_MetricTable(
  dfResults = reportingResults %>%
    dplyr::filter(.data$MetricID == "Analysis_kri0001") %>%
    FilterByLatestSnapshotDate(),
  dfGroups = reportingGroups
)


  

Group
```
