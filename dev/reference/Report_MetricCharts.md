# Render charts for a given metric to markdown

**\[stable\]**

This function generates a markdown framework for charts

## Usage

``` r
Report_MetricCharts(lCharts, strMetricID = "", overview = FALSE)
```

## Arguments

- lCharts:

  A list of charts for the selected metric.

- strMetricID:

  `character` MetricID to subset the data.

- overview:

  `logical` TRUE for generating Study Overview & Flag Over Time

## Value

Markdown content with charts and a summary table for the metric
