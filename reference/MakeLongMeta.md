# Helper function to compile "long" group metadata

**\[stable\]**

Used to create components of the group metadata dictionary (dfGroups)
for use in charts and reports. This function takes a data frame and a
string specifying the group columns, and returns a long format data
frame.

## Usage

``` r
MakeLongMeta(data, strGroupLevel, strGroupCols = "GroupID")
```

## Arguments

- data:

  The input data frame.

- strGroupLevel:

  A string specifying the group type.

- strGroupCols:

  A string specifying the group columns.

## Value

A long format data frame.

## Examples

``` r
df <- data.frame(GroupID = c(1, 2, 3), Param1 = c(10, 20, 30), Param2 = c(100, 200, 300))
MakeLongMeta(df, "GroupID")
#> # A tibble: 6 × 4
#>   GroupID Param  Value GroupLevel
#>   <chr>   <chr>  <chr> <chr>     
#> 1 1       Param1 10    GroupID   
#> 2 1       Param2 100   GroupID   
#> 3 2       Param1 20    GroupID   
#> 4 2       Param2 200   GroupID   
#> 5 3       Param1 30    GroupID   
#> 6 3       Param2 300   GroupID   
```
