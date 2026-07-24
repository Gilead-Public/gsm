# Update Column Specification

This function updates a column specification by handling deduplication,
resolving conflicts in the `required` field, and checking for type
mismatches.

## Usage

``` r
update_column(existing_col, new_col, col_name)
```

## Arguments

- existing_col:

  A list representing the existing column specification (can be `NULL`
  if the column does not yet exist).

- new_col:

  A list representing the new column specification to be merged with the
  existing one.

## Value

A list containing the updated column specification.
