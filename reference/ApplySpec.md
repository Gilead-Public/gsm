# Apply Data Specification

**\[stable\]**

Apply a column specification to a data frame. The column specification
is a named list where the names are the target column names and the
values are lists of column specifications. The column specifications can
include:

- `type`: The data type to convert the column to.

- `source_col`: The name of the source column to map to the target
  column.

## Usage

``` r
ApplySpec(dfSource, columnSpecs, domain)
```

## Arguments

- dfSource:

  `data.frame` Data frame to apply the column specification to.

- columnSpecs:

  `list` Column specification.

- domain:

  `character` Domain name.

## Value

`data.frame` `dfSource` with the column specification applied.
