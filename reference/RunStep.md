# Run a single step in a workflow.

**\[stable\]**

Runs a single step of an assessment workflow. This function is called by
`RunWorkflow` for each step in the workflow. It prepares the parameters
for the function call and then calls the function specified in
`lStep$name` with the prepared parameters.

The primary utility of this function is to provide a prioritized parser
for function parameterization. Parameters should be specified as a named
list in `lStep$params`, where each element is a key-value pair that will
be parsed and then passed to the specified function as a set of
parameter names/values. Parameter values should be specified as scalar
strings. Those values are then pulled from `lMeta` or `lData` when
possible. When no matching `lData` or `lMeta` objects are found,
parameter values are passed through as strings. Note that parsing
vectorized parameters is not supported at this time; they are passed
directly as character vectors. To pass a vector or list, we recommend
saving it as an object in `lData`.

Full prioritization for parsing parameters is below:

1.  If a single parameter value is equal to "lMeta", the the full lMeta
    object is passed to the function (for the given paramName).

2.  If a single parameter value is equal to "lData", the full lData
    object is passed to the function.

3.  If a single parameter value is equal to "lSpec", the full lSpec
    object is passed to the function.

4.  If a single parameter value is found in names(lMeta), that property
    is pulled from lMeta (e.g. lMeta\${paramVal}) and passed to the
    function.

5.  If a single parameter value is found in names(lData), that property
    is pulled from lData (e.g. lData\${paramVal}) and passed to the
    function.

6.  Otherwise single parameter value is passed to the function as a
    string.

7.  If the parameter value is a vector, the vector is passed to the
    function as a vector or strings.

## Usage

``` r
RunStep(lStep, lData, lMeta, lSpec = NULL)
```

## Arguments

- lStep:

  `list` single workflow step (typically pulled from `lWorkflow$steps`).
  Should include the name of the function to run (`lStep$name`), name of
  the object where the function result should be saved (`lStep$output`)
  and configurable parameters (`lStep$params`) (if any)

- lData:

  `list` a named list of domain level data frames.

- lMeta:

  `list` a named list of meta data.

- lSpec:

  `list` a data specification containing required columns. See
  `vignette("gsm_extensions")`.

## Value

`list` containing the results of the `lStep$name` function call should
contain `.$checks` parameter with results from `is_mapping_vald` for
each domain in `lStep$inputs`.

## Examples

``` r
wf_mapping <- MakeWorkflowList(strPath = "workflow/1_mappings")
lStep <- MakeWorkflowList("kri0001")[["kri0001"]][["steps"]][[1]]
lMeta <- MakeWorkflowList("kri0001")[["kri0001"]][["meta"]]
lData <- list(
  dfSUBJ = clindata::rawplus_dm,
  dfAE = clindata::rawplus_ae,
  dfPD = clindata::ctms_protdev,
  dfCONSENT = clindata::rawplus_consent,
  dfIE = clindata::rawplus_ie
)
lMapped <- RunWorkflow(wf_mapping, lData)$lData
#> 
#> ── Initializing `_` Workflow ───────────────────────────────────────────────────
#> → Workflow `_` has no `steps` property.
#> → Workflow `_` has no `meta` property.
#> 
#> ── No spec found in workflow. Proceeding without checking data. 
#> 
#> ── Returning results from final step: NULL of length 0`. ──
#> 
#> ── Completed `_` Workflow ──────────────────────────────────────────────────────

ae_step <- RunStep(lStep = lStep, lData = lMapped, lMeta = lMeta)
#> 
#> ── Evaluating 1 parameter(s) for `ParseThreshold` 
#> ✔ strThreshold = Threshold: Passing lMeta$Threshold.
#> 
#> ── Calling `ParseThreshold` 
#> Parsed -2,-1,2,3 to numeric vector: -2, -1, 2, 3
```
