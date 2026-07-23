# Run a SQL query on a data frame or DuckDB table

**\[stable\]**

`RunQuery` executes a SQL query on a data frame or a DuckDB lazy table,
allowing dynamic use of local or database-backed data. If a DuckDB
connection is passed in as `df`, it operates on the existing connection.
Otherwise, it creates a temporary DuckDB table from the provided data
frame for SQL processing.

The SQL query should include the placeholder `FROM df` to indicate where
the primary data source (`df`) should be referenced.

## Usage

``` r
RunQuery(strQuery, df, bUseSchema = FALSE, lColumnMapping = NULL)
```

## Arguments

- strQuery:

  `character` SQL query to run, containing placeholders `"FROM df"`.

- df:

  `data.frame` or `tbl_dbi` A data frame or DuckDB lazy table to use in
  the SQL query.

- bUseSchema:

  `boolean` should we use a schema to enforce data types. Defaults to
  `FALSE`.

- lColumnMapping:

  `list` a namesd list of column specifications for a single data.frame.
  Required if `bUseSchema` is `TRUE`.

## Value

`data.frame` containing the results of the SQL query.

## Examples

``` r
df <- data.frame(
  Name = c("John", "Jane", "Bob"),
  Age = c(25, 30, 35),
  Salary = c(50000, 60000, 70000)
)
query <- "SELECT * FROM df WHERE AGE > 30"

result <- RunQuery(query, df)
#> Creating a new temporary DuckDB connection.
#> ✔ SQL Query complete: 1 rows returned.
#> Disconnected from temporary DuckDB connection.
```
