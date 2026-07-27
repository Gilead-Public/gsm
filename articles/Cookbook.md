# Cookbook

## Introduction

This vignette contains sample code showing how to use the Good
Statistical Monitoring [gsm](https://github.com/Gilead-BioStats/gsm)
package using sample data from
[`{clindata}`](https://github.com/Gilead-BioStats/clindata). For more
information on the [gsm](https://github.com/Gilead-BioStats/gsm) package
see the [package homepage](https://gilead-public.github.io/gsm/).

## Setup and Installation

Run the following:

``` r

## Install devtools
install.packages('devtools')

## Install and load sample raw data
devtools::install_github("Gilead-BioStats/clindata", ref = "main")
library(clindata)

## Install and load gsm
devtools::install_github("Gilead-BioStats/gsm", ref = "main")
library(gsm)
```

## Example 1 - Adverse Events Metric - Scripted

This example uses the standard {gsm} analysis workflows to creates
site-level Adverse Event scripts. See the [Data Analysis
Vignette](https://gilead-public.github.io/gsm/articles/DataAnalysis.html)
for more detail.

- **Example 1.1** calculates the Site-level AE rates.
- **Example 1.2** adds a filter to include only Serious Adverse Events
  (SAEs) and implements pipes to run through the workflow.
- **Example 1.3** generates bar charts showing SAE rates and z-scores by
  study.
- **Example 1.4** generates a scatter plot with confidence bound for SAE
  rates.

``` r

#### Example 1.1 - Generate an Adverse Event Metric using the standard {gsm} workflow

dfInput <- Input_Rate(
  dfSubjects= clindata::rawplus_dm,
  dfNumerator= clindata::rawplus_ae,
  dfDenominator = clindata::rawplus_dm,
  strSubjectCol = "subjid",
  strGroupCol = "siteid",
  strNumeratorMethod= "Count",
  strDenominatorMethod= "Sum",
  strDenominatorCol= "timeonstudy"
)

dfTransformed <- Transform_Rate(dfInput)
dfAnalyzed <- Analyze_NormalApprox(dfTransformed, strType = "rate")
dfFlagged <- Flag_NormalApprox(dfAnalyzed, vThreshold = c(-3,-2,2,3))
dfSummarized <- Summarize(dfFlagged)

table(dfSummarized$Flag)

#### Example 1.2 - Make an SAE Metric by adding a filter.  Also works with pipes.

SAE_KRI <- Input_Rate(
  dfSubjects= clindata::rawplus_dm,
  dfNumerator= clindata::rawplus_ae %>% filter(aeser=="Y"),
  dfDenominator = clindata::rawplus_dm,
  strSubjectCol = "subjid",
  strGroupCol = "siteid",
  strNumeratorMethod= "Count",
  strDenominatorMethod= "Sum",
  strDenominatorCol= "timeonstudy"
) %>%
  Transform_Rate %>%
  Analyze_NormalApprox(strType = "rate") %>%
  Flag_NormalApprox(vThreshold = c(-3,-2,2,3)) %>%
  Summarize

table(SAE_KRI$Flag)

### Example 1.3 - Visualize Metric distribution using Bar Charts using provided htmlwidgets
labels <- list(  
  Metric= "Serious Adverse Event Rate",
  Numerator= "Serious Adverse Events",
  Denominator= "Days on Study"
)

Widget_BarChart(dfResults = SAE_KRI, lMetric=labels, strOutcome="Metric")
Widget_BarChart(dfResults = SAE_KRI, lMetric=labels, strOutcome="Score")
Widget_BarChart(dfResults = SAE_KRI, lMetric=labels, strOutcome="Numerator")

### Example 1.4 - Create Scatter plot with confidence bounds
dfBounds <- Analyze_NormalApprox_PredictBounds(SAE_KRI, vThreshold = c(-3,-2,2,3))
Widget_ScatterPlot(SAE_KRI, lMetric = labels, dfBounds = dfBounds)
```

## Example 2 - Adverse Events Metrics - Workflow

This examples introduces YAML workflows to re-generate the same results
as in **Example 1** via a reusable pipeline. See the [Data Model
Vignette](https://gilead-public.github.io/gsm/articles/DataModel.html)
for more detail.

- **Example 2.1** runs the AE KRI workflow.
- **Example 2.2** updates the metadata to run country-level metrics.
- **Example 2.3** adds a filtering step to the workflow to generate the
  SAE metric.

``` r

#### Example 2.1 - Configurable Adverse Event Workflow

# Define YAML workflow
AE_workflow <- read_yaml(text=
'meta:
  Type: Analysis
  ID: kri0001
  GroupLevel: Site
  Abbreviation: AE
  Metric: Adverse Event Rate
  Numerator: Adverse Events
  Denominator: Days on Study
  Model: Normal Approximation
  Score: Adjusted Z-Score
  AnalysisType: rate
  Threshold: -2,-1,2,3
  nMinDenominator: 30
spec:
  Mapped_AE:
    subjid:
      type: character
  Mapped_SUBJ:
    subjid:
      type: character
    invid:
      type: character
    timeonstudy:
      type: integer
steps:
  - output: vThreshold
    name: ParseThreshold
    params:
      strThreshold: Threshold
  - output: Analysis_Input
    name: Input_Rate
    params:
      dfSubjects: Mapped_SUBJ
      dfNumerator: Mapped_AE
      dfDenominator: Mapped_SUBJ
      strSubjectCol: subjid
      strGroupCol: invid
      strGroupLevel: GroupLevel
      strNumeratorMethod: Count
      strDenominatorMethod: Sum
      strDenominatorCol: timeonstudy
  - output: Analysis_Transformed
    name: Transform_Rate
    params:
      dfInput: Analysis_Input
  - output: Analysis_Analyzed
    name: Analyze_NormalApprox
    params:
      dfTransformed: Analysis_Transformed
      strType: AnalysisType
  - output: Analysis_Flagged
    name: Flag_NormalApprox
    params:
      dfAnalyzed: Analysis_Analyzed
      vThreshold: vThreshold
  - output: Analysis_Summary
    name: Summarize
    params:
      dfFlagged: Analysis_Flagged
      nMinDenominator: nMinDenominator
  - output: lAnalysis
    name: list
    params:
      ID: ID
      Analysis_Input: Analysis_Input
      Analysis_Transformed: Analysis_Transformed
      Analysis_Analyzed: Analysis_Analyzed
      Analysis_Flagged: Analysis_Flagged
      Analysis_Summary: Analysis_Summary
')

# Run the workflow
AE_data <-list(
  Mapped_SUBJ= clindata::rawplus_dm,
  Mapped_AE= clindata::rawplus_ae
)
AE_KRI <- RunWorkflow(lWorkflow = AE_workflow, lData = AE_data)

# Create Barchart from workflow
Widget_BarChart(dfResults = AE_KRI$Analysis_Summary)

#### Example 2.2 - Run Country-Level Metric
AE_country_workflow <- AE_workflow
AE_country_workflow$meta$GroupLevel <- "Country"
AE_country_workflow$steps[[2]]$params$strGroupCol <- "country"

AE_country_KRI <- RunWorkflow(lWorkflow = AE_country_workflow, lData = AE_data)
Widget_BarChart(dfResults = AE_country_KRI$Analysis_Summary, lMetric = AE_country_workflow$meta)

#### Example 2.3 - Create SAE workflow

# Tweak AE workflow metadata
SAE_workflow <- AE_workflow
SAE_workflow$meta$File <- "SAE_KRI"
SAE_workflow$meta$Metric <- "Serious Adverse Event Rate"
SAE_workflow$meta$Numerator <- "Serious Adverse Events"

# Add a step to filter out non-serious AEs `RunQuery`
filterStep <- list(list(
  name = "RunQuery",
  output = "Mapped_AE",
  params= list(
    df= "Mapped_AE",
    strQuery = "SELECT * FROM df WHERE aeser = 'Y'"
  ))
)
SAE_workflow$steps <- SAE_workflow$steps %>% append(filterStep, after=0)

# Run the updated workflow
SAE_KRI <- RunWorkflow(lWorkflow = SAE_workflow, lData = AE_data )
Widget_BarChart(dfResults = SAE_KRI$Analysis_Summary, lMetric = SAE_workflow$meta)
```

## Example 3 - Study-Level Reporting Workflows

This example extends the previous examples to generate charts and
reports for multiple KRIs. See the [Data Reporting
Vignette](https://gilead-public.github.io/gsm/articles/DataReporting.html)
for more detail.

- **Example 3.1** steps through several workflows to generate a report
  for all 12 standard site-level KRIs.
- **Example 3.2** automates data ingestion using
  [`Ingest()`](https://gilead-public.github.io/gsm/reference/Ingest.md)
  and
  [`CombineSpecs()`](https://gilead-public.github.io/gsm/reference/CombineSpecs.md).
- **Example 3.3** generates a report incorporating multiple timepoints
  using the sample `reporting` data saved as part of {gsm}.

``` r

#### 3.1 - Create a KRI Report using 12 standard metrics in a step-by-step workflow

# Source Data
lSource <- list(
    Source_SUBJ = clindata::rawplus_dm,
    Source_AE = clindata::rawplus_ae,
    Source_PD = clindata::ctms_protdev,
    Source_LB = clindata::rawplus_lb,
    Source_STUDCOMP = clindata::rawplus_studcomp,
    Source_SDRGCOMP = clindata::rawplus_sdrgcomp %>%
      dplyr::filter(.data$phase == 'Blinded Study Drug Completion'),
    Source_DATACHG = clindata::edc_data_points,
    Source_DATAENT = clindata::edc_data_pages,
    Source_QUERY = clindata::edc_queries,
    Source_ENROLL = clindata::rawplus_enroll,
    Source_SITE = clindata::ctms_site,
    Source_STUDY = clindata::ctms_study
)

# Step 0 - Data Ingestion - standardize tables/columns names
lRaw <- list(
    Raw_SUBJ = lSource$Source_SUBJ,
    Raw_AE = lSource$Source_AE,
    Raw_PD = lSource$Source_PD %>%
      rename(subjid = subjectenrollmentnumber),
    Raw_LB = lSource$Source_LB,
    Raw_STUDCOMP = lSource$Source_STUDCOMP %>%
      select(subjid, compyn),
    Raw_SDRGCOMP = lSource$Source_SDRGCOMP,
    Raw_DATACHG = lSource$Source_DATACHG %>%
      rename(subject_nsv = subjectname),
    Raw_DATAENT = lSource$Source_DATAENT %>%
      rename(subject_nsv = subjectname),
    Raw_QUERY = lSource$Source_QUERY %>%
      rename(subject_nsv = subjectname),
    Raw_ENROLL = lSource$Source_ENROLL,
    Raw_SITE = lSource$Source_SITE %>%
      rename(studyid = protocol) %>%
      rename(invid = pi_number) %>%
      rename(InvestigatorFirstName = pi_first_name) %>%
      rename(InvestigatorLastName = pi_last_name) %>%
      rename(City = city) %>%
      rename(State = state) %>%
      rename(Country = country) %>%
      rename(Status = site_status),
    Raw_STUDY = lSource$Source_STUDY %>%
      rename(studyid = protocol_number) %>%
      rename(Status = status)
)

# Step 1 - Create Mapped Data Layer - filter, aggregate and join raw data to create mapped data layer
mappings_wf <- MakeWorkflowList(strPath = "workflow/1_mappings")
mapped <- RunWorkflows(mappings_wf, lRaw)

# Step 2 - Create Metrics - calculate metrics using mapped data
metrics_wf <- MakeWorkflowList(strPath = "workflow/2_metrics")
analyzed <- RunWorkflows(metrics_wf, mapped)

# Step 3 - Create Reporting Layer - create reports using metrics data
reporting_wf <- MakeWorkflowList(strPath = "workflow/3_reporting")
reporting <- RunWorkflows(reporting_wf, c(mapped, list(lAnalyzed = analyzed,
                                                       lWorkflows = metrics_wf)))

# Step 4 - Create KRI Reports - create KRI report using reporting data
module_wf <- MakeWorkflowList(strPath = "workflow/4_modules")
lReports <- RunWorkflows(module_wf, reporting)

#### 3.2 - Automate data ingestion using Ingest() and CombineSpecs()
# Step 0 - Data Ingestion - standardize tables/columns names
mappings_wf <- MakeWorkflowList(strPath = "workflow/1_mappings")
mappings_spec <- CombineSpecs(mappings_wf)
lRaw <- Ingest(lSource, mappings_spec)

# Step 1 - Create Mapped Data Layer - filter, aggregate and join raw data to create mapped data layer
mapped <- RunWorkflows(mappings_wf, lRaw)

# Step 2 - Create Metrics - calculate metrics using mapped data
metrics_wf <- MakeWorkflowList(strPath = "workflow/2_metrics")
analyzed <- RunWorkflows(metrics_wf, mapped)

# Step 3 - Create Reporting Layer - create reports using metrics data
reporting_wf <- MakeWorkflowList(strPath = "workflow/3_reporting")
reporting <- RunWorkflows(reporting_wf, c(mapped, list(lAnalyzed = analyzed,
                                                       lWorkflows = metrics_wf)))

# Step 4 - Create KRI Report - create KRI report using reporting data
module_wf <- MakeWorkflowList(strPath = "workflow/4_modules")
lReports <- RunWorkflows(module_wf, reporting)

#### 3.4 - Combine steps in to a single workflow
#ss_wf <- MakeWorkflowList(strNames = "Snapshot")
#lReports <- RunWorkflows(ss_wf, lSource)

#### 3.4 - Use Study configuration to specify data sources
# StudyConfig <- Read_yaml("inst/workflow/config.yaml")
# mapped <- RunWorkflows(mappings_wf, lConfig=StudyConfig)
# analyzed <- RunWorkflows(metrics_wf,  lConfig=StudyConfig)
# reporting <- RunWorkflows(reporting_wf,  lConfig=StudyConfig)
# lReports <- RunWorkflows(module_wf,  lConfig=StudyConfig)

#### 3.3 Site-Level KRI Report with multiple SnapshotDate
lCharts <- MakeCharts(
  dfResults = gsm::reportingResults,
  dfGroups = gsm::reportingGroups,
  dfMetrics = gsm::reportingMetrics,
  dfBounds = gsm::reportingBounds
)

kri_report_path <- Report_KRI(
  lCharts = lCharts,
  dfResults =  FilterByLatestSnapshotDate(reportingResults),
  dfGroups =  gsm::reportingGroups,
  dfMetrics = gsm::reportingMetrics
)
```
