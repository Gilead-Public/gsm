# Helper function to compile "long" group metadata

Used to create percentage values on enrollment data, such as site
activation and and participant enrollment, and pasting together an
appropriate n/N (xx.x%) value as well.

## Usage

``` r
CalculatePercentage(
  data,
  strCurrentCol,
  strTargetCol,
  strPercVal,
  strPercStrVal
)
```

## Arguments

- data:

  The input dataframe

- strCurrentCol:

  Column that represents site count or participant count

- strTargetCol:

  Column that represents the target count for site/participants

- strPercVal:

  Name of column that will contain the numeric percentage value on
  enrollment

- strPercStrVal:

  Name of column that will contain the n/N (xx.x%) string

## Value

A data frame containing two additional columns for the precentage value
and associated string
