# Generate a Summary data.frame for use in reports

**\[stable\]**

Generate a summary table for a report by joining the provided results
data frame with the site-level metadata from dfGroups, and filter and
arrange the data based on provided conditions.

## Usage

``` r
MakeMetricTable(
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

A data.frame containing the summary table

## Examples

``` r
# site-level report
MakeMetricTable(
  dfResults = reportingResults %>%
    dplyr::filter(.data$MetricID == "Analysis_kri0001") %>%
    FilterByLatestSnapshotDate(),
  dfGroups = reportingGroups
)
#>           StudyID GroupID         MetricID                  Group SnapshotDate
#> 1  AA-AA-000-0000   0X036 Analysis_kri0001       0X036 (Gonzales)   2012-12-31
#> 2  AA-AA-000-0000   0X052 Analysis_kri0001         0X052 (Agenar)   2012-12-31
#> 3  AA-AA-000-0000   0X045 Analysis_kri0001         0X045 (Horton)   2012-12-31
#> 4  AA-AA-000-0000   X187X Analysis_kri0001       X187X (al-Hasen)   2012-12-31
#> 5  AA-AA-000-0000   0X027 Analysis_kri0001          0X027 (Owens)   2012-12-31
#> 6  AA-AA-000-0000   0X024 Analysis_kri0001         0X024 (Rinard)   2012-12-31
#> 7  AA-AA-000-0000   0X004 Analysis_kri0001          0X004 (Touch)   2012-12-31
#> 8  AA-AA-000-0000   0X096 Analysis_kri0001        0X096 (el-Agha)   2012-12-31
#> 9  AA-AA-000-0000   0X057 Analysis_kri0001         0X057 (Aragon)   2012-12-31
#> 10 AA-AA-000-0000   0X066 Analysis_kri0001          0X066 (Lipps)   2012-12-31
#> 11 AA-AA-000-0000   0X115 Analysis_kri0001           0X115 (John)   2012-12-31
#> 12 AA-AA-000-0000   0X165 Analysis_kri0001          0X165 (Pinar)   2012-12-31
#> 13 AA-AA-000-0000   0X034 Analysis_kri0001         0X034 (Yeadon)   2012-12-31
#> 14 AA-AA-000-0000   0X179 Analysis_kri0001          0X179 (Terry)   2012-12-31
#> 15 AA-AA-000-0000   0X090 Analysis_kri0001       0X090 (el-Attar)   2012-12-31
#> 16 AA-AA-000-0000   0X166 Analysis_kri0001         0X166 (Garcia)   2012-12-31
#> 17 AA-AA-000-0000   0X123 Analysis_kri0001       0X123 (Martinez)   2012-12-31
#> 18 AA-AA-000-0000   0X143 Analysis_kri0001       0X143 (el-Salih)   2012-12-31
#> 19 AA-AA-000-0000   0X170 Analysis_kri0001         0X170 (Herlin)   2012-12-31
#> 20 AA-AA-000-0000   0X135 Analysis_kri0001          0X135 (Hager)   2012-12-31
#> 21 AA-AA-000-0000   0X029 Analysis_kri0001         0X029 (Truong)   2012-12-31
#> 22 AA-AA-000-0000   0X013 Analysis_kri0001       0X013 (el-Allam)   2012-12-31
#> 23 AA-AA-000-0000   0X177 Analysis_kri0001          0X177 (Crowe)   2012-12-31
#> 24 AA-AA-000-0000   0X042 Analysis_kri0001     0X042 (el-Massoud)   2012-12-31
#> 25 AA-AA-000-0000   0X134 Analysis_kri0001          0X134 (Keese)   2012-12-31
#> 26 AA-AA-000-0000   0X095 Analysis_kri0001       0X095 (Gonzales)   2012-12-31
#> 27 AA-AA-000-0000   0X159 Analysis_kri0001         0X159 (Flores)   2012-12-31
#> 28 AA-AA-000-0000   0X110 Analysis_kri0001       0X110 (Cleckley)   2012-12-31
#> 29 AA-AA-000-0000   0X030 Analysis_kri0001     0X030 (Hutchinson)   2012-12-31
#> 30 AA-AA-000-0000   0X010 Analysis_kri0001        0X010 (al-Radi)   2012-12-31
#> 31 AA-AA-000-0000   0X103 Analysis_kri0001        0X103 (al-Mona)   2012-12-31
#> 32 AA-AA-000-0000   0X121 Analysis_kri0001 0X121 (Rodriguez-Cruz)   2012-12-31
#>    Enrolled Numerator Denominator Metric Score Flag
#> 1         2       327        6619   0.05 -2.25   -2
#> 2         3       378        7502   0.05 -2.04   -2
#> 3         4       383        6013   0.06  2.49    1
#> 4         4       521        8423   0.06  2.24    1
#> 5         1       113        1652   0.07  2.11    1
#> 6         4       491        8002   0.06  2.00    1
#> 7         3       360        7137   0.05 -1.97   -1
#> 8         4       274        5510   0.05 -1.95   -1
#> 9         1        33         823   0.04 -1.91   -1
#> 10        2       187        3792   0.05 -1.73   -1
#> 11        3       266        5249   0.05 -1.62   -1
#> 12        1        73        1569   0.05 -1.57   -1
#> 13        2       222        4392   0.05 -1.52   -1
#> 14        3       339        6552   0.05 -1.45   -1
#> 15        4       302        5850   0.05 -1.40   -1
#> 16        5       484        9192   0.05 -1.35   -1
#> 17        1        66        1391   0.05 -1.34   -1
#> 18        1        66        1391   0.05 -1.34   -1
#> 19        1        66        1391   0.05 -1.34   -1
#> 20        2       193        3793   0.05 -1.32   -1
#> 21        3       202        3960   0.05 -1.32   -1
#> 22        2       153        3027   0.05 -1.26   -1
#> 23        3       136        2694   0.05 -1.20   -1
#> 24        3       265        5092   0.05 -1.19   -1
#> 25        1       111        2219   0.05 -1.18   -1
#> 26        3       274        5257   0.05 -1.18   -1
#> 27        2       193        3743   0.05 -1.14   -1
#> 28        2       188        3628   0.05 -1.06   -1
#> 29        2       111        2191   0.05 -1.05   -1
#> 30        1        52        1070   0.05 -1.01   -1
#> 31        3       226        4317   0.05 -1.01   -1
#> 32        1        73        1467   0.05 -1.00   -1
```
