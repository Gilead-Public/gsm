# Helper function to compile "wide" group metadata

**\[stable\]**

Used to convert metadata dictionary (dfGroups) to a wide format data
frame for use in charts and reports.

## Usage

``` r
MakeWideGroups(dfGroups, strGroupLevel)
```

## Arguments

- dfGroups:

  `data.frame` Group-level metadata dictionary. Created by passing CTMS
  site and study data to
  [`MakeLongMeta()`](https://gilead-public.github.io/gsm/reference/MakeLongMeta.md).
  Expected columns: `GroupID`, `GroupLevel`, `Param`, `Value`.

- strGroupLevel:

  A string specifying the group level; used to filter
  dfGroups\$GroupLevel.

## Value

A long format data frame.

## Examples

``` r
MakeWideGroups(reportingGroups, "Site")
#> # A tibble: 176 × 18
#>    GroupID GroupLevel protocol_row_id site_num site_row_id    studyid      invid
#>    <chr>   <chr>      <chr>           <chr>    <chr>          <chr>        <chr>
#>  1 0X126   Site       1-1G9113        10       123-1234-0X126 AA-AA-000-0… 0X126
#>  2 X060X   Site       1-1G9113        100      123-1234-X060X AA-AA-000-0… X060X
#>  3 0X174   Site       1-1G9113        101      123-1234-0X174 AA-AA-000-0… 0X174
#>  4 0X073   Site       1-1G9113        102      123-1234-0X073 AA-AA-000-0… 0X073
#>  5 0X176   Site       1-1G9113        103      123-1234-0X176 AA-AA-000-0… 0X176
#>  6 0X140   Site       1-1G9113        104      123-1234-0X140 AA-AA-000-0… 0X140
#>  7 0X179   Site       1-1G9113        105      123-1234-0X179 AA-AA-000-0… 0X179
#>  8 0X040   Site       1-1G9113        106      123-1234-0X040 AA-AA-000-0… 0X040
#>  9 0X072   Site       1-1G9113        107      123-1234-0X072 AA-AA-000-0… 0X072
#> 10 0X127   Site       1-1G9113        109      123-1234-0X127 AA-AA-000-0… 0X127
#> # ℹ 166 more rows
#> # ℹ 11 more variables: InvestigatorLastName <chr>, InvestigatorFirstName <chr>,
#> #   site_status <chr>, is_satellite <chr>, account <chr>, site_active_dt <chr>,
#> #   City <chr>, State <chr>, Country <chr>, ParticipantCount <chr>,
#> #   SiteCount <chr>
```
