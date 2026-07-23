# Ingests data from a source based on a given specification.

This function ingests data from a source based on a given specification.
It iterates over each domain in the specification and checks if the
columns exist in the source data. It then constructs a query to select
the columns from the source and calls the `RunQuery` function to
retrieve the data. The resulting data frames are stored in a list, where
each data frame corresponds to a domain in the specification.

## Usage

``` r
Ingest(lSourceData, lSpec, strDomain = "Raw")
```

## Arguments

- lSourceData:

  `list` A named list of source data frames.

- lSpec:

  `list` A named list of column specifications.

- strDomain:

  `character` Domain name to add to the data frames after ingestions.
  Default: "Raw"

## Value

`list` A named list of data frames, where each data frame corresponds to
a domain in the specification.

## Examples

``` r
lSourceData <- list(
  Source_STUDY = clindata::ctms_study,
  Source_SITE = clindata::ctms_site,
  Source_SUBJ = clindata::rawplus_dm,
  Source_AE = clindata::rawplus_ae,
  Source_PD = clindata::ctms_protdev,
  Source_LB = clindata::rawplus_lb,
  Source_STUDCOMP = clindata::rawplus_studcomp,
  Source_SDRGCOMP = clindata::rawplus_sdrgcomp,
  Source_QUERY = clindata::edc_queries,
  Source_DATAENT = clindata::edc_data_pages,
  Source_DATACHG = clindata::edc_data_points,
  Source_ENROLL = clindata::rawplus_enroll
)

lIngestWorkflow <- MakeWorkflowList(strPath = "workflow/1_mappings")[[1]]
lRawData <- Ingest(lSourceData, lIngestWorkflow$spec)
#> ℹ Ingesting data for AE.
#> Creating a new temporary DuckDB connection.
#> duckdb is keeping downloaded extensions in a temporary directory:
#> ℹ /tmp/RtmpDL3vD7/duckdb/extensions
#> This is removed when the R session ends, so extensions are re-downloaded each session.
#> ℹ To keep them, point `options(duckdb.extension_directory =)` or the `DUCKDB_EXTENSION_DIRECTORY` environment variable at a permanent path.
#> ✔ SQL Query complete: 4854 rows returned.
#> Disconnected from temporary DuckDB connection.
```
