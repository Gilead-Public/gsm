# Package index

## Visualize

Generate a visualization from the Assessment results

- [`Visualize_Metric()`](https://gilead-public.github.io/gsm/reference/Visualize_Metric.md)
  **\[stable\]** : Visualize_Metric Function
- [`Visualize_Scatter()`](https://gilead-public.github.io/gsm/reference/Visualize_Scatter.md)
  **\[stable\]** : Group-level visualization of group-level results
- [`Visualize_Score()`](https://gilead-public.github.io/gsm/reference/Visualize_Score.md)
  **\[stable\]** : Group-level visualization of scores.
- [`Widget_BarChartOutput()`](https://gilead-public.github.io/gsm/reference/Widget_BarChart-shiny.md)
  [`renderWidget_BarChart()`](https://gilead-public.github.io/gsm/reference/Widget_BarChart-shiny.md)
  **\[stable\]** : Shiny bindings for Widget_BarChart
- [`Widget_BarChart()`](https://gilead-public.github.io/gsm/reference/Widget_BarChart.md)
  **\[stable\]** : Bar Chart Widget
- [`Widget_FlagOverTimeOutput()`](https://gilead-public.github.io/gsm/reference/Widget_FlagOverTime-shiny.md)
  [`renderWidget_FlagOverTime()`](https://gilead-public.github.io/gsm/reference/Widget_FlagOverTime-shiny.md)
  **\[stable\]** : Shiny bindings for Widget_FlagOverTime
- [`Widget_FlagOverTime()`](https://gilead-public.github.io/gsm/reference/Widget_FlagOverTime.md)
  **\[stable\]** : Flag Over Time Widget
- [`Widget_GroupOverviewOutput()`](https://gilead-public.github.io/gsm/reference/Widget_GroupOverview-shiny.md)
  [`renderWidget_GroupOverview()`](https://gilead-public.github.io/gsm/reference/Widget_GroupOverview-shiny.md)
  **\[stable\]** : Shiny bindings for Widget_GroupOverview
- [`Widget_GroupOverview()`](https://gilead-public.github.io/gsm/reference/Widget_GroupOverview.md)
  **\[stable\]** : Group Overview Widget
- [`Widget_ScatterPlotOutput()`](https://gilead-public.github.io/gsm/reference/Widget_ScatterPlot-shiny.md)
  [`renderWidget_ScatterPlot()`](https://gilead-public.github.io/gsm/reference/Widget_ScatterPlot-shiny.md)
  **\[stable\]** : Shiny bindings for Widget_ScatterPlot
- [`Widget_ScatterPlot()`](https://gilead-public.github.io/gsm/reference/Widget_ScatterPlot.md)
  **\[stable\]** : Scatter Plot Widget
- [`Widget_TimeSeriesOutput()`](https://gilead-public.github.io/gsm/reference/Widget_TimeSeries-shiny.md)
  [`renderWidget_TimeSeries()`](https://gilead-public.github.io/gsm/reference/Widget_TimeSeries-shiny.md)
  **\[stable\]** : Shiny bindings for Widget_TimeSeries
- [`Widget_TimeSeries()`](https://gilead-public.github.io/gsm/reference/Widget_TimeSeries.md)
  **\[stable\]** : Time Series Widget
- [`Analyze_NormalApprox_PredictBounds()`](https://gilead-public.github.io/gsm/reference/Analyze_NormalApprox_PredictBounds.md)
  **\[stable\]** : Funnel Plot Analysis with Normal Approximation -
  Predicted Boundaries.
- [`Analyze_Poisson_PredictBounds()`](https://gilead-public.github.io/gsm/reference/Analyze_Poisson_PredictBounds.md)
  **\[stable\]** : Poisson Analysis - Predicted Boundaries.

## Analyze

Conduct statistical analysis based on input data

- [`Analyze_NormalApprox()`](https://gilead-public.github.io/gsm/reference/Analyze_NormalApprox.md)
  **\[stable\]** : Funnel Plot Analysis with Normal Approximation for
  Binary and Rate Outcomes.
- [`Analyze_Identity()`](https://gilead-public.github.io/gsm/reference/Analyze_Identity.md)
  **\[stable\]** : Identity Analysis.
- [`Analyze_Fisher()`](https://gilead-public.github.io/gsm/reference/Analyze_Fisher.md)
  **\[stable\]** : Fisher's Exact Test Analysis.
- [`Analyze_Poisson()`](https://gilead-public.github.io/gsm/reference/Analyze_Poisson.md)
  **\[stable\]** : Poisson Analysis - Site Residuals.

## Data Pipeline

Create site-level summary, analyzed, and flagged data for an assessment

- [`Input_Rate()`](https://gilead-public.github.io/gsm/reference/Input_Rate.md)
  **\[stable\]** : Input_Rate
- [`Transform_Count()`](https://gilead-public.github.io/gsm/reference/Transform_Count.md)
  **\[stable\]** : Transform Count
- [`Transform_Rate()`](https://gilead-public.github.io/gsm/reference/Transform_Rate.md)
  **\[stable\]** : Transform Rate
- [`Flag()`](https://gilead-public.github.io/gsm/reference/Flag.md)
  **\[stable\]** : Flag
- [`Flag_NormalApprox()`](https://gilead-public.github.io/gsm/reference/Flag_NormalApprox.md)
  **\[stable\]** : Flag_NormalApprox
- [`Flag_Poisson()`](https://gilead-public.github.io/gsm/reference/Flag_Poisson.md)
  **\[stable\]** : Flag_Poisson
- [`Summarize()`](https://gilead-public.github.io/gsm/reference/Summarize.md)
  **\[stable\]** : Make Summary Data Frame

## Reporting

Creates summary tables and HTML objects to create a report

- [`Report_FlagOverTime()`](https://gilead-public.github.io/gsm/reference/Report_FlagOverTime.md)
  **\[stable\]** : Summarize flags by SnapshotDate
- [`Report_FormatFlag()`](https://gilead-public.github.io/gsm/reference/Report_FormatFlag.md)
  **\[stable\]** : KRI Directionality Logo.
- [`Report_KRI()`](https://gilead-public.github.io/gsm/reference/Report_KRI.md)
  **\[stable\]** : Report_KRI function
- [`Report_MetricCharts()`](https://gilead-public.github.io/gsm/reference/Report_MetricCharts.md)
  **\[stable\]** : Render charts for a given metric to markdown
- [`Report_MetricTable()`](https://gilead-public.github.io/gsm/reference/Report_MetricTable.md)
  **\[stable\]** : Generate a summary table for a report
- [`Report_StudyInfo()`](https://gilead-public.github.io/gsm/reference/Report_StudyInfo.md)
  **\[stable\]** : Report Study Information

## Utility

Utility functions for use within the Data Model

- [`ApplySpec()`](https://gilead-public.github.io/gsm/reference/ApplySpec.md)
  **\[stable\]** : Apply Data Specification
- [`BindResults()`](https://gilead-public.github.io/gsm/reference/BindResults.md)
  **\[stable\]** : Helper function to bind results from multiple
  workflows
- [`cli_fmt()`](https://gilead-public.github.io/gsm/reference/cli_fmt.md)
  : cli style console appender for gsm
- [`CalculatePercentage()`](https://gilead-public.github.io/gsm/reference/CalculatePercentage.md)
  : Helper function to compile "long" group metadata
- [`CheckSpec()`](https://gilead-public.github.io/gsm/reference/CheckSpec.md)
  **\[stable\]** : Check if the data and spec are compatible
- [`CombineSpecs()`](https://gilead-public.github.io/gsm/reference/CombineSpecs.md)
  : Combine Multiple Specifications
- [`FilterByLatestSnapshotDate()`](https://gilead-public.github.io/gsm/reference/FilterByLatestSnapshotDate.md)
  : Filter by Latest Snapshot Date
- [`FilterByFlags()`](https://gilead-public.github.io/gsm/reference/FilterByFlags.md)
  : Filter out non-flagged rows on FlagOverTime Widget
- [`GetStrFunctionIfNamespaced()`](https://gilead-public.github.io/gsm/reference/GetStrFunctionIfNamespaced.md)
  **\[experimental\]** : GetFunctionIfNamespaced
- [`Ingest()`](https://gilead-public.github.io/gsm/reference/Ingest.md)
  : Ingests data from a source based on a given specification.
- [`LogMessage()`](https://gilead-public.github.io/gsm/reference/LogMessage.md)
  : Custom logging function that wraps cli messaging
- [`MakeBounds()`](https://gilead-public.github.io/gsm/reference/MakeBounds.md)
  **\[stable\]** : Calculate Bounds for display in scatterplots
- [`MakeCharts()`](https://gilead-public.github.io/gsm/reference/MakeCharts.md)
  **\[stable\]** : Helper function to create charts for multiple metrics
- [`MakeMetric()`](https://gilead-public.github.io/gsm/reference/MakeMetric.md)
  **\[stable\]** : Parse metadata from workflows to a data frame
- [`MakeMetricTable()`](https://gilead-public.github.io/gsm/reference/MakeMetricTable.md)
  **\[stable\]** : Generate a Summary data.frame for use in reports
- [`MakeLongMeta()`](https://gilead-public.github.io/gsm/reference/MakeLongMeta.md)
  **\[stable\]** : Helper function to compile "long" group metadata
- [`MakeParamLabels()`](https://gilead-public.github.io/gsm/reference/MakeParamLabels.md)
  [`MakeParamLabelsList()`](https://gilead-public.github.io/gsm/reference/MakeParamLabels.md)
  **\[stable\]** : Create Labels for Parameters
- [`MakeStudyInfo()`](https://gilead-public.github.io/gsm/reference/MakeStudyInfo.md)
  **\[stable\]** : Generate a study information data.frame for use in
  reports
- [`MakeWideGroups()`](https://gilead-public.github.io/gsm/reference/MakeWideGroups.md)
  **\[stable\]** : Helper function to compile "wide" group metadata
- [`MakeWorkflowList()`](https://gilead-public.github.io/gsm/reference/MakeWorkflowList.md)
  **\[stable\]** : Load workflows from a package/directory.
- [`ParseThreshold()`](https://gilead-public.github.io/gsm/reference/ParseThreshold.md)
  **\[stable\]** : Parse a string into a numeric vector
- [`RenderRmd()`](https://gilead-public.github.io/gsm/reference/RenderRmd.md)
  : Custom Rmarkdown render function
- [`RunStep()`](https://gilead-public.github.io/gsm/reference/RunStep.md)
  **\[stable\]** : Run a single step in a workflow.
- [`RunQuery()`](https://gilead-public.github.io/gsm/reference/RunQuery.md)
  **\[stable\]** : Run a SQL query on a data frame or DuckDB table
- [`RunWorkflow()`](https://gilead-public.github.io/gsm/reference/RunWorkflow.md)
  **\[stable\]** : Run a workflow via it's YAML specification.
- [`RunWorkflows()`](https://gilead-public.github.io/gsm/reference/RunWorkflows.md)
  **\[stable\]** : Convenience function to easily run multiple workflows
- [`SetLogger()`](https://gilead-public.github.io/gsm/reference/SetLogger.md)
  : set the default package logger
- [`stop_if()`](https://gilead-public.github.io/gsm/reference/stop_if.md)
  : Custom stop message
- [`UseClindata()`](https://gilead-public.github.io/gsm/reference/UseClindata.md)
  **\[stable\]** : UseClindata Function

## Sample Data

data used for examples and testing

- [`analyticsInput`](https://gilead-public.github.io/gsm/reference/analyticsInput.md)
  **\[stable\]** : analyticsInput Dataset
- [`analyticsSummary`](https://gilead-public.github.io/gsm/reference/analyticsSummary.md)
  **\[stable\]** : analyticsSummary Dataset
- [`reportingBounds`](https://gilead-public.github.io/gsm/reference/reportingBounds.md)
  **\[stable\]** : reportingBounds Dataset
- [`reportingGroups`](https://gilead-public.github.io/gsm/reference/reportingGroups.md)
  **\[stable\]** : reportingGroups Dataset
- [`reportingMetrics`](https://gilead-public.github.io/gsm/reference/reportingMetrics.md)
  **\[stable\]** : reportingMetrics Dataset
- [`reportingResults`](https://gilead-public.github.io/gsm/reference/reportingResults.md)
  **\[stable\]** : reportingResults Dataset
- [`reportingBounds_country`](https://gilead-public.github.io/gsm/reference/reportingBounds_country.md)
  **\[stable\]** : reportingBounds_country Dataset
- [`reportingGroups_country`](https://gilead-public.github.io/gsm/reference/reportingGroups_country.md)
  **\[stable\]** : reportingGroups_country Dataset
- [`reportingMetrics_country`](https://gilead-public.github.io/gsm/reference/reportingMetrics_country.md)
  **\[stable\]** : reportingMetrics_country Dataset
- [`reportingResults_country`](https://gilead-public.github.io/gsm/reference/reportingResults_country.md)
  **\[stable\]** : reportingResults_country Dataset
