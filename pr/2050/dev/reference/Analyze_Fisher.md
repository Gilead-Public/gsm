# Fisher's Exact Test Analysis.

**\[stable\]**

Analyzes count data using the Fisher's exact test.

More information can be found in [The Fisher's Exact Method
Section](https://gilead-public.github.io/gsm/articles/KRI%20Method.html#the-fishers-exact-method)
of the KRI Method vignette.

## Usage

``` r
Analyze_Fisher(dfTransformed, strOutcome = "Numerator")
```

## Arguments

- dfTransformed:

  `data.frame` Transformed data for analysis. Data should have one
  record per site with expected columns: `GroupID`, `GroupLevel`,
  `Numerator`, `Denominator`, and `Metric`. For more details see the
  Data Model vignette:
  [`vignette("DataModel", package = "gsm")`](https://gilead-public.github.io/gsm/dev/articles/DataModel.md).
  For this function, `dfTransformed` should typically be created using
  [`Transform_Rate()`](https://gilead-public.github.io/gsm/dev/reference/Transform_Rate.md).

- strOutcome:

  `character` required, name of column in `dfTransformed` dataset to
  perform Fisher's exact test on. Default is "Numerator".

## Value

`data.frame` with one row per site with columns: GroupID, Numerator,
Numerator_Other, Denominator, Denominator_Other, Prop, Prop_Other,
Metric, Estimate, and Score.

## Statistical Methods

The function `Analyze_Fisher` utilizes
[`stats::fisher.test`](https://rdrr.io/r/stats/fisher.test.html) to
generate an estimate of odds ratio as well as a p-value using the
Fisher’s exact test with site-level count data. For each site, the
Fisher’s exact test is conducted by comparing the given site to all
other sites combined in a 2×2 contingency table. The p-values are then
used as a scoring metric in `{gsm}` to flag possible outliers. The
default in
[`stats::fisher.test`](https://rdrr.io/r/stats/fisher.test.html) uses a
two-sided test (equivalent to testing the null of OR = 1) and does not
compute p-values by Monte Carlo simulation unless
`simulate.p.value = TRUE`. Sites with p-values less than 0.05 from the
Fisher’s exact test analysis are flagged by default. The significance
level was set at a common choice.

## Examples

``` r
dfTransformed <- Transform_Rate(
  analyticsInput
)
dfAnalyzed <- Analyze_Fisher(dfTransformed)
```
