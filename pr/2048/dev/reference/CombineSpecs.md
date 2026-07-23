# Combine Multiple Specifications

This function combines multiple domain specifications into a single
specification list, ensuring deduplication of columns, resolving
conflicts in the `required` field, and checking for type mismatches.

## Usage

``` r
CombineSpecs(lSpecs, bIsWorkflow = TRUE)
```

## Arguments

- lSpecs:

  A list of lists, where each sublist represents a either a gsm workflow
  or a spec object from a workflow

- bIsWorkflow:

  Is lSpecs a list of workflows? If so, .\$spec is extracted. Default:
  TRUE

## Value

A list representing the combined specifications across all domains.

## Examples

``` r
spec1 <- list(
  df1 = list(
    col1 = list(type = "character"),
    col2 = list(type = "character")
  ),
  df2 = list(
    col3 = list(type = "character"),
    col4 = list(type = "integer")
  )
)

spec2 <- list(
  df1 = list(
    col1 = list(type = "character"),
    col5 = list(type = "character")
  ),
  df3 = list(
    col6 = list(type = "character"),
    col7 = list(type = "character")
  )
)

combined <- CombineSpecs(list(spec1, spec2), bIsWorkflow = FALSE)

mappings <- MakeWorkflowList(strPath = "workflow/1_mappings")
mapping_spec <- CombineSpecs(mappings)
```
