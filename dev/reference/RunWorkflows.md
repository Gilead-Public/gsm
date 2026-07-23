# Convenience function to easily run multiple workflows

**\[stable\]**

This function takes a list of workflows and a list of data as input. It
runs each workflow and returns the results as a named list where the
names of the list correspond to the workflow ID (\$meta\$ID).

Workflows are run in the order they are provided in the lWorkflows. The
results from each workflow are passed as inputs (along with lData) for
later workflows.

## Usage

``` r
RunWorkflows(
  lWorkflows,
  lData = NULL,
  lConfig = NULL,
  bKeepInputData = FALSE,
  bReturnResult = TRUE,
  strResultNames = c("Type", "ID")
)
```

## Arguments

- lWorkflows:

  `list` A named list of metadata defining how the workflow should be
  run.

- lData:

  `list` A named list of domain-level data frames.

- lConfig:

  `list` A configuration object with two methods:

  - `LoadData`: A function that loads data specified in
    `lWorkflow$spec`.

  - `SaveData`: A function that saves data returned by the last step in
    `lWorkflow$steps`.

- bKeepInputData:

  `boolean` should the input data be included in `lData` after the
  workflow is run? Only relevant when bReturnResult is FALSE. Default is
  `TRUE`.

- bReturnResult:

  `boolean` should *only* the result from the last step (`lResults`) be
  returned? If false, the full workflow (including `lResults`) is
  returned. Default is `TRUE`.

- strResultNames:

  `string` vector of length two, which describes the meta fields used to
  name the output.

## Value

A named list of results from
[`RunWorkflow()`](https://gilead-public.github.io/gsm/dev/reference/RunWorkflow.md),
where the names correspond to the names of the workflow ID
