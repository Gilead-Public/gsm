# Helper function to bind results from multiple workflows

**\[stable\]**

Used to stack results (e.g. `dfSummary`) from a list of analysis
pipeline output formatted like the result of
[`RunWorkflows()`](https://gilead-public.github.io/gsm/reference/RunWorkflows.md).
Also adds study level metadata when provided.

## Usage

``` r
BindResults(
  lAnalysis,
  strName,
  dSnapshotDate = Sys.Date(),
  strStudyID = NULL,
  bUselData = FALSE
)
```

## Arguments

- lAnalysis:

  Named List of analysis results in the format returned by
  [`RunWorkflows()`](https://gilead-public.github.io/gsm/reference/RunWorkflows.md).

- strName:

  Name of the object to stack. Pulled from `lAnalysis` (or from
  `lAnalysis$lData` when `bUselData` is `TRUE`).

- dSnapshotDate:

  Date of the snapshot. Default is
  [`Sys.Date()`](https://rdrr.io/r/base/Sys.time.html).

- strStudyID:

  Study ID.

- bUselData:

  Should the function bind results from an `lData` object (or look
  directly in the root elements of `lAnalysis`)? Default is `FALSE.`

## Value

A data frame.
