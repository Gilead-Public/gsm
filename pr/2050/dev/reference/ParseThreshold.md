# Parse a string into a numeric vector

**\[stable\]**

This function takes a comma-separated string and parses it into a
numeric vector. It checks if all values in the string are numeric and
returns the parsed vector. If any value is not numeric, it throws an
error.

## Usage

``` r
ParseThreshold(strThreshold, bSort = TRUE)
```

## Arguments

- strThreshold:

  `character` A comma-separated string of numeric values.

- bSort:

  `logical` Sort thresholds in ascending order? Default: `TRUE`.

## Value

A numeric vector containing the parsed values.

## Examples

``` r
# standard thresholds
ParseThreshold("-3,-2,2,3")
#> Parsed -3,-2,2,3 to numeric vector: -3, -2, 2, 3
#> [1] -3 -2  2  3

# by default thresholds will be sorted in ascending order
ParseThreshold("3,2,-2,-3")
#> Parsed 3,2,-2,-3 to numeric vector: 3, 2, -2, -3
#> [1] -3 -2  2  3

# optionally disable the sort
ParseThreshold("0.9,0.85", bSort = FALSE)
#> Parsed 0.9,0.85 to numeric vector: 0.9, 0.85
#> [1] 0.90 0.85
```
