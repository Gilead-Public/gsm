# Transform Count

**\[stable\]**

Convert from input data format to needed input format to derive KRI for
an Assessment. Calculate site-level count.

## Usage

``` r
Transform_Count(dfInput, strCountCol, strGroupCol = "GroupID")
```

## Arguments

- dfInput:

  `data.frame` Input data with one record per subject. Created by
  passing Raw+ data into
  [`Input_Rate()`](https://gilead-public.github.io/gsm/reference/Input_Rate.md).
  Expected columns: `GroupID`, `GroupLevel`, `Numerator`, `Denominator`
  and/or columns specified in `strCountCol` and `strGroupCol`.

- strCountCol:

  Required. Numerical or logical. Column to be counted.

- strGroupCol:

  `character` Name of column for grouping variable. Default: `"GroupID"`

## Value

`data.frame` with one row per site with columns `GroupID`, `TotalCount`,
and `Metric.`

## Details

This function transforms data to prepare it for the analysis step. It is
currently only sourced for the Consent and IE Assessments.

## Data Specification

(`dfInput`) must include the columns specified by `strCountCol` and
`strGroupCol`. Required columns include:

- `GroupID` - Group ID

- `GroupLevel` - Group Type

- `Numerator` - Number of events of interest; the actual name of this
  column is specified by the parameter `strNumeratorCol`

- `Denominator` - Number of days on treatment; the actual name of this
  column is specified by the parameter `strDenominatorCol`

The input data has one or more rows per site. `Transform_Count()` sums
`strCountCol` for a `TotalCount` for each site. `Metric` is set to
`TotalCount` to be used downstream in the workflow.

## Examples

``` r
dfTransformed <- Transform_Count(analyticsInput, strCountCol = "Numerator")
```
