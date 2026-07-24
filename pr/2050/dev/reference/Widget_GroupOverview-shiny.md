# Shiny bindings for Widget_GroupOverview

**\[stable\]**

Output and render functions for using Widget_GroupOverview within Shiny
applications and interactive Rmd documents.

## Usage

``` r
Widget_GroupOverviewOutput(outputId, width = "100%", height = "400px")

renderWidget_GroupOverview(expr, env = parent.frame(), quoted = FALSE)
```

## Arguments

- outputId:

  output variable to read from

- width, height:

  Must be a valid CSS unit (like `'100%'`, `'400px'`, `'auto'`) or a
  number, which will be coerced to a string and have `'px'` appended.

- expr:

  An expression that generates a Widget_GroupOverview

- env:

  The environment in which to evaluate `expr`.

- quoted:

  Is `expr` a quoted expression (with
  [`quote()`](https://rdrr.io/r/base/substitute.html))? This is useful
  if you want to save an expression in a variable.
