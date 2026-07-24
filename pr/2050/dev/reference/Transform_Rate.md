# Transform Rate

**\[stable\]**

Convert from input data format to needed input format to derive KRI for
an Assessment. Calculate a site-level rate.

## Usage

``` r
Transform_Rate(
  dfInput,
  strNumeratorCol = "Numerator",
  strDenominatorCol = "Denominator"
)
```

## Arguments

- dfInput:

  `data.frame` Input data with one record per subject. Created by
  passing Raw+ data into
  [`Input_Rate()`](https://gilead-public.github.io/gsm/dev/reference/Input_Rate.md).
  Expected columns: `GroupID`, `GroupLevel`, `Numerator`, `Denominator`
  and/or columns specified in `strCountCol` and `strGroupCol`.

- strNumeratorCol:

  `string` Column to be counted. Defaults to "Numerator".

- strDenominatorCol:

  `string` Column name for the numerical `Exposure` column. Defaults to
  "Denominator".

## Value

`data.frame` with one row per site with columns `GroupID`, `GroupLevel`,
`Numerator`, `Denominator`, and `Metric`.

## Details

This function transforms data to prepare it for the analysis step. It is
currently only sourced for the Adverse Event, Disposition, Labs, and
Protocol Deviations Assessments.

## Data Specification

(`dfInput`) must include the columns specified by `strNumeratorCol` and
`strDenominatorCol`. Required columns include:

- `GroupID` - Group ID

- `GroupLevel` - Group Type

- `Numerator` - Number of events of interest; the actual name of this
  column is specified by the parameter `strNumeratorCol`

- `Denominator` - Number of days on treatment; the actual name of this
  column is specified by the parameter `strDenominatorCol`

## Examples

``` r
dfTransformed <- Transform_Rate(
  analyticsInput,
  strNumeratorCol = "Numerator",
  strDenominatorCol = "Denominator"
)
```
