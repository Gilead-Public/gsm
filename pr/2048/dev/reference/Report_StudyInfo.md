# Report Study Information

**\[stable\]**

This function generates a table summarizing study metadata as an
interactive [`gt::gt()`](https://gt.rstudio.com/reference/gt.html)
wrapped in HTML.

## Usage

``` r
Report_StudyInfo(
  dfGroups,
  lStudyLabels = NULL,
  strId = "study_table",
  tagHeader = htmltools::h2("Study Status"),
  lStudy = deprecated()
)
```

## Arguments

- dfGroups:

  `data.frame` Group-level metadata dictionary. Created by passing CTMS
  site and study data to
  [`MakeLongMeta()`](https://gilead-public.github.io/gsm/dev/reference/MakeLongMeta.md).
  Expected columns: `GroupID`, `GroupLevel`, `Param`, `Value`.

- lStudyLabels:

  `list` A list containing study labels. Default is NULL.

- strId:

  `character` A string to identify the output table.

- tagHeader:

  `shiny.tag` An HTML tag or tags to use as a header for the table.

- lStudy:

  `deprecated` Study information as a named list.

## Value

A
[`htmltools::tagList()`](https://rstudio.github.io/htmltools/reference/tagList.html)
to display a table of study information.
