# Shiny bindings for Widget_ScatterPlot

**\[stable\]**

Output and render functions for using Widget_ScatterPlot within Shiny
applications and interactive Rmd documents.

## Usage

``` r
Widget_ScatterPlotOutput(outputId, width = "100%", height = "400px")

renderWidget_ScatterPlot(expr, env = parent.frame(), quoted = FALSE)
```

## Arguments

- outputId:

  output variable to read from

- width, height:

  Must be a valid CSS unit (like `'100%'`, `'400px'`, `'auto'`) or a
  number, which will be coerced to a string and have `'px'` appended.

- expr:

  An expression that generates a Widget_ScatterPlot

- env:

  The environment in which to evaluate `expr`.

- quoted:

  Is `expr` a quoted expression (with
  [`quote()`](https://rdrr.io/r/base/substitute.html))? This is useful
  if you want to save an expression in a variable.
