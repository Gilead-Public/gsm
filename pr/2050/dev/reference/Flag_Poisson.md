# Flag_Poisson

\#' @description **\[stable\]**

## Usage

``` r
Flag_Poisson(
  dfAnalyzed,
  strColumn = "Score",
  vThreshold = c(-3, -2, 2, 3),
  vFlag = c(-2, -1, 0, 1, 2),
  vFlagOrder = c(2, -2, 1, -1, 0)
)
```

## Arguments

- dfAnalyzed:

  `data.frame` where flags should be added.

- strColumn:

  `character` Name of the column to use for thresholding. Default:
  `"Score"`

- vThreshold:

  `numeric` Vector of numeric values representing threshold values.
  Default is `c(-3,-2,2,3)` which is typical for z-scores.

- vFlag:

  `numeric` Vector of flag values. There must be one more item in Flag
  than thresholds - that is
  `length(vThreshold)+1 == length(vFlagValues)`. Default is
  `c(-2,-1,0,1,2)`, which is typical for z-scores.

- vFlagOrder:

  `numeric` Vector of ordered flag values. Output data.frame will be
  sorted based on flag column using the order provided. NULL (or values
  that don't match vFlag) will leave the data unsorted. Must have
  identical values to vFlag. Default is `c(2,-2,1,-1,0)` which puts
  largest z-score outliers first in the data set.

## Details

Alias for
[`Flag()`](https://gilead-public.github.io/gsm/dev/reference/Flag.md)
