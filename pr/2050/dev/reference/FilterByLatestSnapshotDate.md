# Filter by Latest Snapshot Date

Filter a data frame to the most recent snapshot date.

## Usage

``` r
FilterByLatestSnapshotDate(df, strSnapshotDate = NULL)
```

## Arguments

- df:

  A data frame containing the results.

- strSnapshotDate:

  A character string representing the snapshot date.

## Value

A data frame containing the results for the most recent snapshot date.

## Examples

``` r
reportingResults_latest <- FilterByLatestSnapshotDate(reportingResults)
```
