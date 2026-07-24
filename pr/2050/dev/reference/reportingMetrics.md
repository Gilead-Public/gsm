# reportingMetrics Dataset

**\[stable\]**

## Usage

``` r
reportingMetrics
```

## Format

A data frame with 12 rows and 17 columns:

- MetricID:

  unique metric identifier

- GroupLevel:

  level of grouping variable

- Abbreviation:

  abbreviation for the metric

- Metric:

  name of the metric

- Numerator:

  data source for the numerator

- Denominator:

  data source for the denominator

- Model:

  model used to calculate metric

- Score:

  type of score reported

- Type:

  statistical outcome type

- Threshold:

  thresholds to be used for bounds and flags

- nMinDenominator:

  minimum denominator required to return a score and calculate a flag

- ID:

  ID

- Priority:

  Priority in workflow

- Output:

  output

- Name:

  name

- Description:

  description

- AnalysisType:

  analysis type

## Source

Generated from `reportingMetrics.csv` dataset in the `gsm` package.
