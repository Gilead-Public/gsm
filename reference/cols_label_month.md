# Month and year columns for gt tables

Split date columns in the style "YYYY-MM" or "YYYY-MM-DD" into month
columns with year spanners.

## Usage

``` r
cols_label_month(data, columns = gt::everything())
```

## Arguments

- data:

  A `gt_tbl` object.

- columns:

  Columns to target for formatting.

## Value

An object of class `gt_tbl`.
