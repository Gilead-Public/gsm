# UseClindata Function

**\[stable\]**

The 'UseClindata' function takes an optional argument 'lDomains' and
performs the following steps:

1.  Checks if the 'clindata' package is installed using
    'requireNamespace'.

2.  If the package is not installed, aborts with an error message using
    'cli::cli_abort'.

3.  If the package is installed, evaluates each element in 'lDomains'
    using 'eval(parse(text = .x))' and stores the results in
    'clindata_list'.

4.  Returns 'clindata_list'.

## Usage

``` r
UseClindata(lDomains = NULL)
```

## Arguments

- lDomains:

  (optional) A list of domains to be evaluated.

## Value

clindata_list A list containing the results of evaluating each domain
using 'eval(parse(text = .x))'.

## Examples

``` r
dfs <- UseClindata(
  list(
    "dfSUBJ" = "clindata::rawplus_dm",
    "dfAE" = "clindata::rawplus_ae"
  )
)
```
