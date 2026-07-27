# Run a workflow via it's YAML specification.

**\[stable\]**

Attempts to run a single assessment (`lWorkflow`) using shared data
(`lData`) and metadata (`lMapping`). Calls `RunStep` for each item in
`lWorkflow$workflow` and saves the results to `lWorkflow`.

## Usage

``` r
RunWorkflow(
  lWorkflow,
  lData = NULL,
  lConfig = NULL,
  bReturnResult = TRUE,
  bKeepInputData = TRUE
)
```

## Arguments

- lWorkflow:

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

- bReturnResult:

  `boolean` should *only* the result from the last step (`lResults`) be
  returned? If false, the full workflow (including `lResults`) is
  returned. Default is `TRUE`.

- bKeepInputData:

  `boolean` should the input data be included in `lData` after the
  workflow is run? Only relevant when bReturnResult is FALSE. Default is
  `TRUE`.

## Value

Object containing the results of the workflow's last step (if
`bLastResult` is `TRUE`) or the full workflow object (if
`bReturnResults` is `TRUE`) or the full workflow object (if
`bReturnResults` is `FALSE`).

`list` contains just lData if `bReturnData` is `TRUE`, otherwise returns
the full `lWorkflow` object.

## Examples

``` r
if (FALSE) { # \dontrun{
# ----
# Workflow using in-memory data.

lRawData <- list(
  Raw_AE = clindata::rawplus_ae,
  Raw_SUBJ = clindata::rawplus_dm
)

# Generate mapped input data to metric workflow.
lMappingWorkflows <- MakeWorkflowList(
  c("AE", "SUBJ"),
  bExact = TRUE
)

lMappedData <- RunWorkflows(
  lMappingWorkflows,
  lRawData
)

# Run the metric workflow.
lMetricWorkflow <- MakeWorkflowList("kri0001")$kri0001
lMetricOutput <- RunWorkflow(
  lMetricWorkflow,
  lMappedData
)

# ----
# Workflow using data read/write functions.

# Define a function that loads data.
LoadData <- function(lWorkflow, lConfig, lData) {
  lData <- lData
  purrr::imap(
    lWorkflow$spec,
    ~ {
      input <- lConfig$Domains[[.y]]

      if (is.function(input)) {
        data <- input()
      } else if (is.character(input)) {
        data <- read.csv(input)
      }

      lData[[.y]] <- ApplySpec(data, .x)
    }
  )
  return(lData)
}

# Define a function that saves data to .csv.
SaveData <- function(lWorkflow, lConfig) {
  domain <- paste0(lWorkflow$meta$Type, "_", lWorkflow$meta$ID)
  if (domain %in% names(lConfig$Domains)) {
    output <- lConfig$Domains[[domain]]

    write.csv(
      lWorkflow$lResult,
      output
    )
  }
}

# Define a configuration object with LoadData/SaveData functions and a list of named data sources.
lConfig <- list(
  LoadData = LoadData,
  SaveData = SaveData,
  Domains = c(
    Raw_AE = function() {
      clindata::rawplus_ae
    },
    Raw_SUBJ = function() {
      clindata::rawplus_dm
    },
    Mapped_AE = file.path(tempdir(), "mapped-ae.csv"),
    Mapped_SUBJ = file.path(tempdir(), "mapped-subj.csv")
  )
)

# Generate mapped input data to metric workflow.
lMappingWorkflows <- MakeWorkflowList(
  c("AE", "SUBJ"),
  bExact = TRUE
)

lMappedData <- RunWorkflows(
  lMappingWorkflows,
  lConfig = lConfig
)

# Run the metric workflow.
lMetricWorkflow <- MakeWorkflowList("kri0001")$kri0001
lMetricOutput <- RunWorkflow(
  lMetricWorkflow,
  lConfig = lConfig
)
} # }
```
