# GetFunctionIfNamespaced

**\[experimental\]**

This function looks to see if a strFunction is namespaced and looks it
up allowing the do.call in run step to process correctly. This will
return a function.

## Usage

``` r
GetStrFunctionIfNamespaced(strFunction)
```

## Arguments

- strFunction:

  the function to be called

## Examples

``` r
fn <- GetStrFunctionIfNamespaced("dplyr::glimpse")
fn(head(Theoph))
#> Rows: 6
#> Columns: 5
#> $ Subject <ord> 1, 1, 1, 1, 1, 1
#> $ Wt      <dbl> 79.6, 79.6, 79.6, 79.6, 79.6, 79.6
#> $ Dose    <dbl> 4.02, 4.02, 4.02, 4.02, 4.02, 4.02
#> $ Time    <dbl> 0.00, 0.25, 0.57, 1.12, 2.02, 3.82
#> $ conc    <dbl> 0.74, 2.84, 6.57, 10.50, 9.66, 8.58
```
