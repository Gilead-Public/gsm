# Qualification Report for the {gsm} R Package

## Introduction

Risk-Based Quality Monitoring (RBQM) is a proactive approach to clinical
trial monitoring that focuses on identifying and addressing the most
critical risks to the integrity of study data and patient safety. This
approach aims to ensure that study data are accurate, reliable, and
credible while optimizing the use of resources and minimizing the burden
on study sites.

The [gsm](https://github.com/Gilead-BioStats/gsm) R package supports
RBQM by performing risk assessments primarily focused on detecting
differences in quality at the site level. This approach is intended to
detect potential issues related to critical data or process(es) across
the major risk categories of safety, efficacy, disposition, treatment,
and general quality. Each category consists of one or more risk
assessment(s). Each risk assessment analyzes the data to flag sites with
potential outliers and provides a visualization to help the user
understand the issue.

## Scope

Qualification testing ensures that core functions execute as expected on
a system-wide scale. Qualification includes executing various
functional, performance, and usability testing. Qualification tests are
designed to provide developers with a repeatable process that is easy to
update and document. This document summarizes the qualification testing
performed on [gsm](https://github.com/Gilead-BioStats/gsm) functions
essential to the analysis workflow.

## Process Overview

Each essential [gsm](https://github.com/Gilead-BioStats/gsm) workflow
function is independently qualified using specifications and test cases
compiled in this report. Details are provided below.

### Specifications

Specifications capture the most critical use cases for a given function.
Each function must have at least one (1) specification, and each
specification must have at least one (1) associated test case. Multiple
specifications may exist for a function, and multiple test cases may
exist for a specification.

Each specification includes the following components:

- **Description:** outlines the use case for the specification

- **Risk Assessment**

  - **Risk Level:** assigned a value of “Low”, “Medium”, or “High”,
    corresponding to the risk associated with the specification failing

  - **Risk Impact:** assigned a value of “Low”, “Medium”, or “High”,
    corresponding to the severity of the impact associated with the
    specification failing

- **Test Cases:** lists measurable test cases associated with the
  specification

### Test Cases

Test cases translate specifications into testable scripts to confirm
that the package functions meet the established requirements. Test cases
represent how a user may utilize the function to help identify code gaps
and support testing automation.

Test cases for [gsm](https://github.com/Gilead-BioStats/gsm) are written
using the standard `testthat` workflow. A single test script is saved
for each test case and is named following the convention
`test_qual_{TestID}.R`, where `TestID` is the test case number. Test
code within these scripts is written clearly and concisely to facilitate
quick execution and interpretability. Note that a single test case may
be associated with multiple specifications.

## Test Results: Overview

| Function Name | Number of Tests | Number Passed | Number Failed | Number Skipped |
|----|----|----|----|----|
| Adverse Event Assessment | 52 | 52 | 0 | 0 |
| Analysis workflow | 22 | 21 | 0 | 0 |
| Analyze_NormalApprox_PredictBounds | 19 | 19 | 0 | 0 |
| Data Change Rate Assessment | 19 | 19 | 0 | 0 |
| Data Entry Lag Assessment | 19 | 19 | 0 | 0 |
| Disposition Assessment | 35 | 35 | 0 | 0 |
| Flag_NormalApprox | 7 | 7 | 0 | 0 |
| Labs Assessment | 19 | 19 | 0 | 0 |
| Mapping workflow | 46 | 46 | 0 | 0 |
| Protocol Deviation Assessment | 30 | 30 | 0 | 0 |
| Query Age Assessment | 35 | 35 | 0 | 0 |
| Query Rate Assessment | 35 | 35 | 0 | 0 |
| Summarize | 16 | 16 | 0 | 0 |

## Test Results: Detailed

### One Row Per Specification

| Spec ID | Spec Description | Risk | Impact | Associated Test IDs |
|----|----|----|----|----|
| S1_1 | Given raw participant-level data, all necessary data.frame transformations are made to create input data for all workflows | High | High | T1_1 |
| S2_1 | Given raw participant-level data, a properly specified Workflow for a KRI creates summarized and flagged data | High | High | T2_1 |
| S2_2 | Given raw participant-level data with missingness, a properly specified Workflow for a KRI creates summarized and flagged data | High | High | T2_2 |
| S3_1 | Given pre-processed input data, a properly specified Workflow for a KRI creates summarized and flagged data | High | High | T3_1 |
| S4_1 | Given appropriate metadata (i.e. vThresholds), flagged observations are properly marked in summary data | High | High | T4_1 |
| S4_2 | Given appropriate metadata (i.e. vThresholds), data.frame of bounds can be created | High | High | T4_2 |
| S5_1 | Given appropriate raw participant-level data, flag values can be correctly assigned to records that meet flagging criteria, including custom thresholding. | High | High | T5_1 |
| S5_2 | Given appropriate raw participant-level data, flag values are correctly assigned as NA for sites with low enrollment. | High | High | T5_2 |
| S6_1 | Given appropriate raw participant-level data, an Adverse Event Assessment can be done using the Normal Approximation method. | High | High | T6_1 |
| S6_2 | Adverse Event Assessments can be done correctly using a grouping variable, such as Site or Country for KRIs, and Study for QTLs, when applicable. | High | High | T6_2 |
| S7_1 | Given appropriate raw participant-level data, a Protocol Deviation Assessment can be done using the Normal Approximation method. | High | High | T7_1 |
| S7_2 | Protocol Deviation Assessments can be done correctly using a grouping variable, such as Site or Country for KRIs, and Study for QTLs, when applicable. | High | High | T7_2 |
| S8_1 | Given appropriate raw participant-level data, a Dispositon Assessment can be done using the Normal Approximation method. | High | High | T8_1 |
| S8_2 | Disposition Assessments can be done correctly using a grouping variable, such as Site or Country for KRIs, and Study for QTLs, when applicable. | High | High | T8_2 |
| S9_1 | Given appropriate raw participant-level data, a Labs Assessment can be done using the Normal Approximation method. | High | High | T9_1 |
| S9_2 | Labs Assessments can be done correctly using a grouping variable, such as Site or Country for KRIs, and Study for QTLs, when applicable. | High | High | T9_2 |
| S10_1 | Given appropriate raw participant-level data, a Data Change Rate Assessment can be done using the Normal Approximation method. | High | High | T10_1 |
| S10_2 | Data Change Rate Assessments can be done correctly using a grouping variable, such as Site, Country, or Study, when applicable. | High | High | T10_2 |
| S11_1 | Given appropriate raw participant-level data, a Data Entry Lag Assessment can be done using the Normal Approximation method. | High | High | T11_1 |
| S11_2 | Data Entry Lag Assessments can be done correctly using a grouping variable, such as Site, Country, or Study, when applicable. | High | High | T11_2 |
| S12_1 | Given appropriate raw participant-level data, a Query Age Assessment can be done using the Normal Approximation method. | High | High | T12_1 |
| S12_2 | Query Age Assessments can be done correctly using a grouping variable, such as Site, Country, or Study, when applicable. | High | High | T12_2 |
| S13_1 | Given appropriate raw participant-level data, a Query Rate Assessment can be done using the Normal Approximation method. | High | High | T13_1 |
| S13_2 | Query Rate Assessments can be done correctly using a grouping variable, such as Site, Country, or Study, when applicable. | High | High | T13_2 |

### One Row Per Test

| Function | Spec ID | Test ID | Test Description | Test Result |
|----|----|----|----|----|
| Mapping workflow | S1_1 | T1_1 | mappings now done by individual domain, test that inputs and outputs of priority 1 mappings are completed as expected | Pass |
| Mapping workflow | S1_1 | T1_1 | mappings now done by individual domain, test that inputs and outputs of priority 2 mappings are completed as expected | Pass |
| Mapping workflow | S1_1 | T1_1 | mappings now done by individual domain, test that inputs and outputs of priority 3 mappings are completed as expected | Pass |
| Analysis workflow | S2_1 | T2_1 | Given raw participant-level data, a properly specified Workflow for a KRI creates summarized and flagged data | Pass |
| Analysis workflow | S2_2 | T2_2 | Given raw participant-level data with missingness, a properly specified Workflow for a KRI creates summarized and flagged data | Pass |
| Analysis workflow | S3_1 | T3_1 | Given pre-processed input data, a properly specified Workflow for a KRI creates summarized and flagged data | Pass |
| Flag_NormalApprox | S4_1 | T4_1 | Given appropriate metadata (i.e. vThresholds), flagged observations are properly marked in summary data | Pass |
| Analyze_NormalApprox_PredictBounds | S4_2 | T4_2 | Given appropriate metadata (i.e. vThresholds), bounds are properly applied to generate flags | Pass |
| Summarize | S5_1 | T5_1 | Given appropriate raw participant-level data, flag values can be correctly assigned to records that meet flagging criteria, including custom thresholding. | Pass |
| Summarize | S5_2 | T5_2 | Given appropriate raw participant-level data, flag values are correctly assigned as NA for sites with low enrollment. | Pass |
| Adverse Event Assessment | S6_1 | T6_1 | Given appropriate raw participant-level data, an Adverse Event Assessment can be done using the Normal Approximation method. | Pass |
| Adverse Event Assessment | S6_2 | T6_2 | Adverse Event Assessments can be done correctly using a grouping variable, such as Site or Country for KRIs, and Study for QTLs, when applicable. | Pass |
| Protocol Deviation Assessment | S7_1 | T7_1 | Given appropriate raw participant-level data, a Protocol Deviation Assessment can be done using the Normal Approximation method. | Pass |
| Protocol Deviation Assessment | S7_2 | T7_2 | Protocol Deviation Assessments can be done correctly using a grouping variable, such as Site or Country for KRIs, and Study for QTLs, when applicable. | Pass |
| Disposition Assessment | S8_1 | T8_1 | Given appropriate raw participant-level data, a Dispositon Assessment can be done using the Normal Approximation method. | Pass |
| Disposition Assessment | S8_2 | T8_2 | Disposition Assessments can be done correctly using a grouping variable, such as Site or Country for KRIs, and Study for QTLs, when applicable. | Pass |
| Labs Assessment | S9_1 | T9_1 | Given appropriate raw participant-level data, a Labs Assessment can be done using the Normal Approximation method. | Pass |
| Labs Assessment | S9_2 | T9_2 | Labs Assessments can be done correctly using a grouping variable, such as Site or Country for KRIs, and Study for QTLs, when applicable. | Pass |
| Data Change Rate Assessment | S10_1 | T10_1 | Given appropriate raw participant-level data, a Data Change Rate Assessment can be done using the Normal Approximation method. | Pass |
| Data Change Rate Assessment | S10_2 | T10_2 | Data Change Rate Assessments can be done correctly using a grouping variable, such as Site, Country, or Study, when applicable. | Pass |
| Data Entry Lag Assessment | S11_1 | T11_1 | Given appropriate raw participant-level data, a Data Entry Lag Assessment can be done using the Normal Approximation method. | Pass |
| Data Entry Lag Assessment | S11_2 | T11_2 | Data Entry Lag Assessments can be done correctly using a grouping variable, such as Site, Country, or Study, when applicable. | Pass |
| Query Age Assessment | S12_1 | T12_1 | Given appropriate raw participant-level data, a Query Age Assessment can be done using the Normal Approximation method. | Pass |
| Query Age Assessment | S12_2 | T12_2 | Query Age Assessments can be done correctly using a grouping variable, such as Site, Country, or Study, when applicable. | Pass |
| Query Rate Assessment | S13_1 | T13_1 | Given appropriate raw participant-level data, a Query Rate Assessment can be done using the Normal Approximation method. | Pass |
| Query Rate Assessment | S13_2 | T13_2 | Query Rate Assessments can be done correctly using a grouping variable, such as Site, Country, or Study, when applicable. | Pass |

## Unit Tests

### Unit Testing Overview

Unit testing was performed in addition to qualification testing to help
ensure that individual pieces of code within the R package function
correctly and produce the expected results. By testing individual units
of code in isolation, developers can identify and fix issues early in
the development process before more significant and scaled problems
arise.

### Unit Test Coverage

The table below summarizes unit test coverage of each
[gsm](https://github.com/Gilead-BioStats/gsm) function. This metric
quantifies the extent of unit testing. The closer this measure is to
100%, the more unit testing that function has.

| Function                               | File Coverage |
|----------------------------------------|---------------|
| R/Analyze_Fisher.R                     | 100.00 %      |
| R/Analyze_Identity.R                   | 100.00 %      |
| R/Analyze_NormalApprox_PredictBounds.R | 100.00 %      |
| R/Analyze_NormalApprox.R               | 100.00 %      |
| R/Analyze_Poisson_PredictBounds.R      | 98.21 %       |
| R/Analyze_Poisson.R                    | 100.00 %      |
| R/data-specs.R                         | 0.00 %        |
| R/Flag.R                               | 100.00 %      |
| R/Input_Rate.R                         | 88.46 %       |
| R/Report_FlagOverTime.R                | 100.00 %      |
| R/Report_FormatFlag.R                  | 100.00 %      |
| R/Report_KRI.R                         | 0.00 %        |
| R/Report_MetricCharts.R                | 97.44 %       |
| R/Report_MetricTable.R                 | 100.00 %      |
| R/Report_OverviewText.R                | 100.00 %      |
| R/Report_Setup.R                       | 84.44 %       |
| R/Report_StudyInfo.R                   | 100.00 %      |
| R/RunQuery.R                           | 86.42 %       |
| R/RunStep.R                            | 81.67 %       |
| R/RunWorkflow.R                        | 95.28 %       |
| R/RunWorkflows.R                       | 100.00 %      |
| R/Summarize.R                          | 100.00 %      |
| R/Transform_Count.R                    | 100.00 %      |
| R/Transform_Rate.R                     | 100.00 %      |
| R/util-ApplySpec.R                     | 74.36 %       |
| R/util-BindResults.R                   | 100.00 %      |
| R/util-CalculatePercentage.R           | 50.00 %       |
| R/util-checkSpec.R                     | 100.00 %      |
| R/util-cli_logger_wrappers.R           | 23.53 %       |
| R/util-clindata.R                      | 66.67 %       |
| R/util-CombineSpecs.R                  | 96.30 %       |
| R/util-func-namespace.R                | 87.50 %       |
| R/util-gt.R                            | 75.00 %       |
| R/util-Ingest.R                        | 100.00 %      |
| R/util-logger.R                        | 0.00 %        |
| R/util-MakeBounds.R                    | 84.91 %       |
| R/util-MakeCharts.R                    | 100.00 %      |
| R/util-MakeLongMeta.R                  | 100.00 %      |
| R/util-MakeMetric.R                    | 100.00 %      |
| R/util-MakeMetricTable.R               | 100.00 %      |
| R/util-MakeParamLabels.R               | 100.00 %      |
| R/util-MakeStudyInfo.R                 | 100.00 %      |
| R/util-MakeWideGroups.R                | 100.00 %      |
| R/util-MakeWorkflowList.R              | 90.16 %       |
| R/util-ParseThreshold.R                | 100.00 %      |
| R/util-RenderRmd.R                     | 0.00 %        |
| R/util-Report.R                        | 89.13 %       |
| R/Visualize_Metric.R                   | 82.98 %       |
| R/Visualize_Scatter.R                  | 100.00 %      |
| R/Visualize_Score.R                    | 94.74 %       |
| R/Widget_BarChart.R                    | 78.26 %       |
| R/Widget_FlagOverTime.R                | 57.78 %       |
| R/Widget_GroupOverview.R               | 84.44 %       |
| R/Widget_ScatterPlot.R                 | 80.00 %       |
| R/Widget_TimeSeries.R                  | 80.43 %       |
| R/zzz.R                                | 93.75 %       |
| Total Coverage                         | 88.71 %       |

## Qualification Testing Environment

### Session Information

**R version 4.6.1 (2026-06-24)**

**Platform:** x86_64-pc-linux-gnu

**locale:** *LC_CTYPE=C.UTF-8*, *LC_NUMERIC=C*, *LC_TIME=C.UTF-8*,
*LC_COLLATE=C.UTF-8*, *LC_MONETARY=C.UTF-8*, *LC_MESSAGES=C.UTF-8*,
*LC_PAPER=C.UTF-8*, *LC_NAME=C*, *LC_ADDRESS=C*, *LC_TELEPHONE=C*,
*LC_MEASUREMENT=C.UTF-8* and *LC_IDENTIFICATION=C*

**attached base packages:** *tcltk*, *stats*, *graphics*, *grDevices*,
*utils*, *datasets*, *methods* and *base*

**other attached packages:** *gsm(v.2.2.4)*, *testthat(v.3.3.2)*,
*riskmetric(v.0.2.7)*, *stringr(v.1.6.0)*, *gh(v.1.6.1)*,
*pander(v.0.6.6)*, *purrr(v.1.2.2)*, *dplyr(v.1.2.1)*, *knitr(v.1.51)*
and *gt(v.1.3.0)*

**loaded via a namespace (and not attached):** *gtable(v.0.3.6)*,
*xfun(v.0.60)*, *bslib(v.0.11.0)*, *ggplot2(v.4.0.3)*,
*htmlwidgets(v.1.6.4)*, *devtools(v.2.5.2)*, *vctrs(v.0.7.3)*,
*tools(v.4.6.1)*, *generics(v.0.1.4)*, *curl(v.7.1.0)*,
*tibble(v.3.3.1)*, *pkgconfig(v.2.0.3)*, *dbplyr(v.2.6.0)*,
*RColorBrewer(v.1.1-3)*, *S7(v.0.2.2)*, *desc(v.1.4.3)*,
*lifecycle(v.1.0.5)*, *compiler(v.4.6.1)*, *farver(v.2.1.2)*,
*brio(v.1.1.5)*, *textshaping(v.1.0.5)*, *htmltools(v.0.5.9)*,
*usethis(v.3.2.1)*, *sass(v.0.4.10)*, *yaml(v.2.3.12)*,
*pillar(v.1.11.1)*, *pkgdown(v.2.2.1)*, *jquerylib(v.0.1.4)*,
*tidyr(v.1.3.2)*, *ellipsis(v.0.3.3)*, *cranlogs(v.2.1.1)*,
*cachem(v.1.1.0)*, *sessioninfo(v.1.2.4)*, *tidyselect(v.1.2.1)*,
*digest(v.0.6.39)*, *stringi(v.1.8.7)*, *duckdb(v.1.5.4.3)*,
*rprojroot(v.2.1.1)*, *fastmap(v.1.2.0)*, *grid(v.4.6.1)*,
*here(v.1.0.2)*, *cli(v.3.6.6)*, *magrittr(v.2.0.5)*,
*triebeard(v.0.4.1)*, *pkgbuild(v.1.4.8)*, *broom(v.1.0.13)*,
*withr(v.3.0.3)*, *waldo(v.0.6.2)*, *scales(v.1.4.0)*,
*backports(v.1.5.1)*, *rmarkdown(v.2.31)*, *httr(v.1.4.8)*,
*otel(v.0.2.0)*, *ragg(v.1.5.2)*, *memoise(v.2.0.1)*,
*evaluate(v.1.0.5)*, *log4r(v.0.4.4.9000)*, *covr(v.3.6.5)*,
*rex(v.1.2.2)*, *urltools(v.1.7.3.1)*, *rlang(v.1.3.0)*,
*Rcpp(v.1.1.2)*, *clindata(v.1.0.5)*, *glue(v.1.8.1)*, *DBI(v.1.3.0)*,
*BiocManager(v.1.30.27)*, *xml2(v.1.6.0)*, *pkgload(v.1.5.3)*,
*rstudioapi(v.0.19.0)*, *jsonlite(v.2.0.0)*, *R6(v.2.6.1)*,
*systemfonts(v.1.3.2)* and *fs(v.2.1.0)*

### Package List

The table below utilizes the `riskmetric` package, which quantifies the
robustness of an R package. The `pkg_score` column captures the risk
involved with using a package. The risk level ranges from 0 (low risk)
to 1 (high risk).

| package     | version    | pkg_score |
|-------------|------------|-----------|
| broom       | 1.0.13     | 0.321     |
| cli         | 3.6.6      | 0.398     |
| DBI         | 1.3.0      | 0.345     |
| dbplyr      | 2.6.0      | 0.371     |
| dplyr       | 1.2.1      | 0.383     |
| ggplot2     | 4.0.3      | 0.410     |
| glue        | 1.8.1      | 0.278     |
| gt          | 1.3.0      | 0.456     |
| htmltools   | 0.5.9      | 0.404     |
| htmlwidgets | 1.6.4      | 0.317     |
| jsonlite    | 2.0.0      | 0.362     |
| lifecycle   | 1.0.5      | 0.287     |
| log4r       | 0.4.4.9000 | 0.434     |
| magrittr    | 2.0.5      | 0.291     |
| purrr       | 1.2.2      | 0.391     |
| rlang       | 1.3.0      | 0.384     |
| stats       | 4.6.1      | 0.704     |
| stringr     | 1.6.0      | 0.365     |
| tibble      | 3.3.1      | 0.348     |
| tidyr       | 1.3.2      | 0.357     |
| utils       | 4.6.1      | 0.687     |
| yaml        | 2.3.12     | 0.273     |

## Pull Request History

#### Pull Request 2049: Catch up Dev to Main

Merging main into dev

<https://github.com/Gilead-Public/gsm/pull/2049>

|  Requester  |   Date Requested    | Reviewers | Review Status |
|:-----------:|:-------------------:|:---------:|:-------------:|
| nandriychuk | 2026-07-23 01:55:12 |           |   APPROVED    |

#### Pull Request 2046: gsm v2.2.4 release candidate

Merging gsm-v2.2.4-rc into main

<https://github.com/Gilead-Public/gsm/pull/2046>

|  Requester   |   Date Requested    |          Reviewers           | Review Status |
|:------------:|:-------------------:|:----------------------------:|:-------------:|
| lauramaxwell | 2025-04-02 18:22:22 | jonthegeek zdz2101 jwildfire |   APPROVED    |

#### Pull Request 2045: gsm deprecation messages

Merging deprecation-msg into dev

<https://github.com/Gilead-Public/gsm/pull/2045>

|  Requester   |   Date Requested    |     Reviewers     | Review Status |
|:------------:|:-------------------:|:-----------------:|:-------------:|
| lauramaxwell | 2025-03-25 15:20:32 | jwildfire zdz2101 |   APPROVED    |

#### Pull Request 2044: Revert dev branch to main content

Merging revert-to-main into dev

<https://github.com/Gilead-Public/gsm/pull/2044>

|  Requester   |   Date Requested    |     Reviewers     | Review Status |
|:------------:|:-------------------:|:-----------------:|:-------------:|
| lauramaxwell | 2025-03-19 19:31:09 | jwildfire zdz2101 |   APPROVED    |

#### Pull Request 2043: revert dev to original `gsm`

Merging main into dev

<https://github.com/Gilead-Public/gsm/pull/2043>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2025-03-18 19:07:38 |           |               |

#### Pull Request 2042: Update vignettes

Merging fix-vignettes into dev

<https://github.com/Gilead-Public/gsm/pull/2042>

|  Requester   |   Date Requested    |     Reviewers     | Review Status |
|:------------:|:-------------------:|:-----------------:|:-------------:|
| lauramaxwell | 2025-03-06 19:52:50 | zdz2101 jwildfire |               |

#### Pull Request 2041: Closes \#2036 remove clindata dependency and create datasim object in data-raw/data folder

Merging fix-2036 into dev

<https://github.com/Gilead-Public/gsm/pull/2041>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
|  zdz2101  | 2025-03-06 19:00:49 | samussiah |   APPROVED    |

#### Pull Request 2039: GSM v2.2.3 release

Merging gsm-v2.2.3-rc into main

<https://github.com/Gilead-Public/gsm/pull/2039>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2025-03-05 19:36:16 |           |   APPROVED    |

#### Pull Request 2038: Remove hard dependency on `InvestigatorLastName` and incorporate tweaks to `gsm.viz` .

Merging forgot-one into dev

<https://github.com/Gilead-Public/gsm/pull/2038>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
| samussiah | 2025-03-05 01:29:22 |           |   APPROVED    |

#### Pull Request 2037: Extend charts to display additional group metadata and support descending thresholds.

Merging fix-rbmviz-update into dev

<https://github.com/Gilead-Public/gsm/pull/2037>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
| samussiah | 2025-03-04 20:15:32 |           |   APPROVED    |

#### Pull Request 2032: Closes \#2017 strips out qualification related components

Merging fix-2017 into gsm-core-test

<https://github.com/Gilead-Public/gsm/pull/2032>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
|  zdz2101  | 2025-02-06 18:55:21 |           |   APPROVED    |

#### Pull Request 2031: Stripping out functions for `{gsm.core}` release

Merging gsm-core-test into dev

<https://github.com/Gilead-Public/gsm/pull/2031>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2025-02-03 13:58:42 |           |   APPROVED    |

#### Pull Request 2030: Fix y-axis label.

Merging fix-1963 into dev

<https://github.com/Gilead-Public/gsm/pull/2030>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
| samussiah | 2025-01-30 18:26:00 |           |   APPROVED    |

#### Pull Request 2028: Revert “Add button to show/hide report table of contents”

Merging revert-2012-fix-1963 into dev

<https://github.com/Gilead-Public/gsm/pull/2028>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
| samussiah | 2025-01-24 21:01:22 |           |   APPROVED    |

#### Pull Request 2025: v2.2.2 release back to dev

Merging main into dev

<https://github.com/Gilead-Public/gsm/pull/2025>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2025-01-22 17:24:54 |           |   APPROVED    |

#### Pull Request 2023: Eliminate `Enrolled` analysis population from `cou0009` metric.

Merging fix-2022 into dev

<https://github.com/Gilead-Public/gsm/pull/2023>

| Requester |   Date Requested    | Reviewers |   Review Status   |
|:---------:|:-------------------:|:---------:|:-----------------:|
| samussiah | 2025-01-17 15:41:50 |           | CHANGES_REQUESTED |

#### Pull Request 2021: v2.2.2 RC

Merging fix-2020 into main

<https://github.com/Gilead-Public/gsm/pull/2021>

| Requester |   Date Requested    |      Reviewers      | Review Status |
|:---------:|:-------------------:|:-------------------:|:-------------:|
| samussiah | 2025-01-15 21:13:25 | dpastoor annezheng2 |   APPROVED    |

#### Pull Request 2019: Remove glossary.

Merging simplify-params into dev

<https://github.com/Gilead-Public/gsm/pull/2019>

| Requester  |   Date Requested    | Reviewers | Review Status |
|:----------:|:-------------------:|:---------:|:-------------:|
| jonthegeek | 2025-01-15 17:36:47 |           |   APPROVED    |

#### Pull Request 2018: Closes \#2010 migration of additional mapping aspects

Merging fix-2010 into fix-1972v2

<https://github.com/Gilead-Public/gsm/pull/2018>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
|  zdz2101  | 2025-01-15 16:54:10 |           |   COMMENTED   |

#### Pull Request 2012: Add button to show/hide report table of contents

Merging fix-1963 into dev

<https://github.com/Gilead-Public/gsm/pull/2012>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2025-01-09 16:44:54 |           |   COMMENTED   |

#### Pull Request 2009: gsm v2.2.1 release

Merging dev into main

<https://github.com/Gilead-Public/gsm/pull/2009>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2025-01-06 20:28:21 |           |   APPROVED    |

#### Pull Request 2008: gsm v2.2.1 release candidate

Merging gsm-v2.2.1-rc into dev

<https://github.com/Gilead-Public/gsm/pull/2008>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2025-01-06 18:37:29 |  zdz2101  |   APPROVED    |

#### Pull Request 2007: Review package dependencies

Merging fix-1979 into dev

<https://github.com/Gilead-Public/gsm/pull/2007>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2025-01-06 16:24:53 |           |   APPROVED    |

#### Pull Request 2006: Fix \#1996- add study-wide average for data entry lag

Merging fix-1996 into dev

<https://github.com/Gilead-Public/gsm/pull/2006>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2024-12-31 15:27:18 | samussiah |               |

#### Pull Request 2005: Add docs and tests for lConfig

Merging fix-1984 into dev

<https://github.com/Gilead-Public/gsm/pull/2005>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2024-12-20 19:02:55 |           |   APPROVED    |

#### Pull Request 2004: add subject disposition

Merging add-disposition into dev

<https://github.com/Gilead-Public/gsm/pull/2004>

| Requester |   Date Requested    |   Reviewers   | Review Status |
|:---------:|:-------------------:|:-------------:|:-------------:|
| samussiah | 2024-12-20 18:01:36 | Zhongkai-Wang |   COMMENTED   |

#### Pull Request 2002: Closes \#1972 intial gsm.mapping spin out

Merging fix-1972v2 into dev

<https://github.com/Gilead-Public/gsm/pull/2002>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
|  zdz2101  | 2024-12-19 17:47:17 |           |   COMMENTED   |

#### Pull Request 1999: Fix 1946

Merging fix-1946 into dev

<https://github.com/Gilead-Public/gsm/pull/1999>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
| samussiah | 2024-12-18 15:50:54 |           |   APPROVED    |

#### Pull Request 1998: Fix \#1992- always return function in namespace util

Merging fix-1992 into dev

<https://github.com/Gilead-Public/gsm/pull/1998>

|  Requester   |   Date Requested    | Reviewers |   Review Status   |
|:------------:|:-------------------:|:---------:|:-----------------:|
| lauramaxwell | 2024-12-17 21:42:00 |           | CHANGES_REQUESTED |

#### Pull Request 1995: update readme report links and dev version

Merging fix-1993 into dev

<https://github.com/Gilead-Public/gsm/pull/1995>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2024-12-12 18:25:37 |           |   APPROVED    |

#### Pull Request 1994: Closes \#1976 wrap all our stop-esque calls into the log4r setup

Merging fix-1976 into dev

<https://github.com/Gilead-Public/gsm/pull/1994>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
|  zdz2101  | 2024-12-12 18:21:13 | samussiah |   COMMENTED   |

#### Pull Request 1991: run styler on 2.2

Merging styler-v2.2 into dev

<https://github.com/Gilead-Public/gsm/pull/1991>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2024-12-11 19:32:33 |           |   APPROVED    |

#### Pull Request 1990: GSM v2.2.0 release

Merging dev into main

<https://github.com/Gilead-Public/gsm/pull/1990>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2024-12-11 19:08:23 |           |   APPROVED    |

#### Pull Request 1988: add namespacing capability

Merging namespacing-1987 into v2.2.0-rc

<https://github.com/Gilead-Public/gsm/pull/1988>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
| dpastoor  | 2024-12-11 14:11:30 |           |   COMMENTED   |

#### Pull Request 1986: fix issue in `RunQuery` related to incomplete column spec

Merging fix-RunQuery into v2.2.0-rc

<https://github.com/Gilead-Public/gsm/pull/1986>

| Requester |   Date Requested    | Reviewers  | Review Status |
|:---------:|:-------------------:|:----------:|:-------------:|
| samussiah | 2024-12-10 18:06:09 | annezheng2 |   APPROVED    |

#### Pull Request 1985: V2.2.0 rc

Merging v2.2.0-rc into dev

<https://github.com/Gilead-Public/gsm/pull/1985>

|  Requester   |   Date Requested    | Reviewers |   Review Status   |
|:------------:|:-------------------:|:---------:|:-----------------:|
| lauramaxwell | 2024-12-09 20:14:41 | jwildfire | CHANGES_REQUESTED |

#### Pull Request 1982: fix ldata passthrough, resolves \#1981

Merging fix-1981 into dev

<https://github.com/Gilead-Public/gsm/pull/1982>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
| dpastoor  | 2024-12-08 15:26:24 |           |   APPROVED    |

#### Pull Request 1977: Closes \#1972 Begin migration of mapping related stuff

Merging fix-1972 into dev

<https://github.com/Gilead-Public/gsm/pull/1977>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
|  zdz2101  | 2024-12-05 21:48:36 |           |   COMMENTED   |

#### Pull Request 1975: Add thresholds back into barcharts

Merging fix-1958 into dev

<https://github.com/Gilead-Public/gsm/pull/1975>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2024-12-05 20:13:11 |           |   APPROVED    |

#### Pull Request 1970: Update vignettes

Merging fix-1954 into dev

<https://github.com/Gilead-Public/gsm/pull/1970>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2024-12-03 21:02:39 |           |   APPROVED    |

#### Pull Request 1969: Fix typo in STUDY.yaml

Merging fix-1968 into dev

<https://github.com/Gilead-Public/gsm/pull/1969>

| Requester  |   Date Requested    | Reviewers | Review Status |
|:----------:|:-------------------:|:---------:|:-------------:|
| jonthegeek | 2024-12-03 19:29:28 |           |   APPROVED    |

#### Pull Request 1965: Closes \#1964 update RunQuery to apply data types where applicable

Merging fix-1964 into dev

<https://github.com/Gilead-Public/gsm/pull/1965>

|  Requester   |   Date Requested    |      Reviewers      | Review Status |
|:------------:|:-------------------:|:-------------------:|:-------------:|
| lauramaxwell | 2024-12-02 14:58:26 | dpastoor annezheng2 |   COMMENTED   |

#### Pull Request 1961: Add hooks to `RunWorkflow` .

Merging fix-1818 into dev

<https://github.com/Gilead-Public/gsm/pull/1961>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
| samussiah | 2024-11-22 22:46:13 |           |   COMMENTED   |

#### Pull Request 1960: Update query for treatment discontinuation KRIs

Merging fix-1959 into dev

<https://github.com/Gilead-Public/gsm/pull/1960>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2024-11-22 20:14:31 |           |   APPROVED    |

#### Pull Request 1957: add fields to STUDY.yaml

Merging fix-1956 into dev

<https://github.com/Gilead-Public/gsm/pull/1957>

|  Requester   |   Date Requested    | Reviewers  | Review Status |
|:------------:|:-------------------:|:----------:|:-------------:|
| lauramaxwell | 2024-11-21 16:25:51 | annezheng2 |   COMMENTED   |

#### Pull Request 1953: Closes \#1937 Display only results of metrics where data is available in reports

Merging fix-1937 into dev

<https://github.com/Gilead-Public/gsm/pull/1953>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
|  zdz2101  | 2024-11-19 20:19:46 |           |   COMMENTED   |

#### Pull Request 1951: Remove `required` from yamls and associated functions

Merging fix-1936 into dev

<https://github.com/Gilead-Public/gsm/pull/1951>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2024-11-18 15:05:49 |           |   COMMENTED   |

#### Pull Request 1949: Fix table placement in qual report pdf

Merging fix-qual-report into dev

<https://github.com/Gilead-Public/gsm/pull/1949>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2024-11-14 20:06:11 |           |   APPROVED    |

#### Pull Request 1947: Release v2.1.2

Merging dev into main

<https://github.com/Gilead-Public/gsm/pull/1947>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2024-11-14 17:21:03 |  zdz2101  |   APPROVED    |

#### Pull Request 1945: PD \> IPD and display site activation / participant enrollment in study info.

Merging fix-1918 into gsm-v2.1.2-rc

<https://github.com/Gilead-Public/gsm/pull/1945>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
| samussiah | 2024-11-14 15:03:08 | jwildfire |   COMMENTED   |

#### Pull Request 1943: Fix 1801

Merging fix-1801 into dev

<https://github.com/Gilead-Public/gsm/pull/1943>

| Requester  |   Date Requested    | Reviewers | Review Status |
|:----------:|:-------------------:|:---------:|:-------------:|
| annezheng2 | 2024-11-12 19:09:30 |           |   APPROVED    |

#### Pull Request 1942: gsm v2.1.2 release candidate

Merging gsm-v2.1.2-rc into dev

<https://github.com/Gilead-Public/gsm/pull/1942>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2024-11-12 18:16:17 | samussiah |   APPROVED    |

#### Pull Request 1941: Add act_fpfv and est_fpfv to STUDY.yaml spec

Merging fix-1940 into dev

<https://github.com/Gilead-Public/gsm/pull/1941>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2024-11-12 14:16:17 |           |   APPROVED    |

#### Pull Request 1939: Closes \#1933 introduces logging capabilities to gsm

Merging fix-1933 into dev

<https://github.com/Gilead-Public/gsm/pull/1939>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
|  zdz2101  | 2024-11-08 22:08:50 | samussiah |   COMMENTED   |

#### Pull Request 1932: Closes \#1928 swaps out last remnants of `kable` and `kableExtra` in favor of `gt`

Merging fix-1928 into dev

<https://github.com/Gilead-Public/gsm/pull/1932>

| Requester |   Date Requested    | Reviewers  | Review Status |
|:---------:|:-------------------:|:----------:|:-------------:|
|  zdz2101  | 2024-11-06 20:18:22 | jonthegeek |   COMMENTED   |

#### Pull Request 1931: Closes \#1882 adds a toggle to display past year or full data

Merging fix-1882 into dev

<https://github.com/Gilead-Public/gsm/pull/1931>

| Requester |   Date Requested    | Reviewers  | Review Status |
|:---------:|:-------------------:|:----------:|:-------------:|
|  zdz2101  | 2024-11-05 18:41:05 | jonthegeek |   COMMENTED   |

#### Pull Request 1930: Update `Metrics.yaml` to not generate `lWorkflows` within steps

Merging fix-1929 into dev

<https://github.com/Gilead-Public/gsm/pull/1930>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2024-11-04 21:09:11 | jwildfire |   COMMENTED   |

#### Pull Request 1926: Fix country metadata

Merging fix-country-metadata into dev

<https://github.com/Gilead-Public/gsm/pull/1926>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
| samussiah | 2024-11-04 15:05:39 |  zdz2101  |   APPROVED    |

#### Pull Request 1923: Fix Ingest return value

Merging Ingest-docs-typo into dev

<https://github.com/Gilead-Public/gsm/pull/1923>

| Requester  |   Date Requested    |  Reviewers   | Review Status |
|:----------:|:-------------------:|:------------:|:-------------:|
| jonthegeek | 2024-10-30 13:47:28 | lauramaxwell |   APPROVED    |

#### Pull Request 1920: Refactor Flag functions

Merging fix-1911 into dev

<https://github.com/Gilead-Public/gsm/pull/1920>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
| jwildfire | 2024-10-29 00:23:04 |           |   COMMENTED   |

#### Pull Request 1917: Keep bg color for switch.

Merging fix-1916 into dev

<https://github.com/Gilead-Public/gsm/pull/1917>

| Requester  |   Date Requested    | Reviewers | Review Status |
|:----------:|:-------------------:|:---------:|:-------------:|
| jonthegeek | 2024-10-28 15:42:51 |           |   APPROVED    |

#### Pull Request 1915: Add Nickname to report header and fix `RunQuery` bug

Merging fix-1878 into dev

<https://github.com/Gilead-Public/gsm/pull/1915>

|  Requester   |   Date Requested    |    Reviewers     | Review Status |
|:------------:|:-------------------:|:----------------:|:-------------:|
| lauramaxwell | 2024-10-28 14:32:07 | andersonjake1988 |   APPROVED    |

#### Pull Request 1913: updated class structure

Merging fix-1912 into dev

<https://github.com/Gilead-Public/gsm/pull/1913>

|    Requester     |   Date Requested    | Reviewers | Review Status |
|:----------------:|:-------------------:|:---------:|:-------------:|
| andersonjake1988 | 2024-10-25 16:34:05 |           |   APPROVED    |

#### Pull Request 1910: avoid column name conflicts between `Groups` and `Results`

Merging lock-down-groups into dev

<https://github.com/Gilead-Public/gsm/pull/1910>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
| samussiah | 2024-10-24 18:00:51 |           |   APPROVED    |

#### Pull Request 1909: Release v2.1.1

Merging dev into main

<https://github.com/Gilead-Public/gsm/pull/1909>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2024-10-23 21:25:59 |           |   APPROVED    |

#### Pull Request 1908: Fix country overview text

Merging fix-country-overview-text into dev

<https://github.com/Gilead-Public/gsm/pull/1908>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2024-10-23 20:33:45 |           |   APPROVED    |

#### Pull Request 1907: Update rbm-viz.

Merging rbm-viz-2.1.0 into dev

<https://github.com/Gilead-Public/gsm/pull/1907>

| Requester  |   Date Requested    | Reviewers | Review Status |
|:----------:|:-------------------:|:---------:|:-------------:|
| jonthegeek | 2024-10-23 18:47:10 |           |   APPROVED    |

#### Pull Request 1906: Embed necessary dependencies in Report_StudyInfo().

Merging fix-1905 into dev

<https://github.com/Gilead-Public/gsm/pull/1906>

| Requester  |   Date Requested    | Reviewers | Review Status |
|:----------:|:-------------------:|:---------:|:-------------:|
| jonthegeek | 2024-10-23 17:15:14 |           |   APPROVED    |

#### Pull Request 1904: Gsm v2.1.1 release candidate

Merging gsm-v2.1.1-rc into dev

<https://github.com/Gilead-Public/gsm/pull/1904>

|  Requester   |   Date Requested    |     Reviewers     | Review Status |
|:------------:|:-------------------:|:-----------------:|:-------------:|
| lauramaxwell | 2024-10-21 20:20:24 | zdz2101 jwildfire |   APPROVED    |

#### Pull Request 1903: Fix overall group select bug.

Merging fix-1902 into dev

<https://github.com/Gilead-Public/gsm/pull/1903>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
| samussiah | 2024-10-18 20:34:37 |  zdz2101  |   APPROVED    |

#### Pull Request 1901: Closes \#1890 and \#1900 to properly check for dates and fix other bugs in checkSpec

Merging fix-1890 into dev

<https://github.com/Gilead-Public/gsm/pull/1901>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2024-10-18 18:10:48 |  zdz2101  |   COMMENTED   |

#### Pull Request 1899: Closes \#1880 add site/participant target numbers and labels to `STUDY.yaml`

Merging fix-1880 into dev

<https://github.com/Gilead-Public/gsm/pull/1899>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
|  zdz2101  | 2024-10-17 21:01:47 |           |   COMMENTED   |

#### Pull Request 1898: Flag colors

Merging fix-1896 into dev

<https://github.com/Gilead-Public/gsm/pull/1898>

| Requester  |   Date Requested    | Reviewers | Review Status |
|:----------:|:-------------------:|:---------:|:-------------:|
| jonthegeek | 2024-10-17 15:48:50 |           |   APPROVED    |

#### Pull Request 1897: Closes \#1894 address bug in `Input_Rate()` for 0 row dataframe inputs for dfNumerator/dfDenominator

Merging fix-1894 into dev

<https://github.com/Gilead-Public/gsm/pull/1897>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
|  zdz2101  | 2024-10-17 15:46:12 |           |   APPROVED    |

#### Pull Request 1892: Closes \#1877 and \#1883 addressing bugfixes related to `StudyID` on `Report_Setup()` and `reportingXXXX` datasets

Merging fix-1877 into dev

<https://github.com/Gilead-Public/gsm/pull/1892>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
|  zdz2101  | 2024-10-15 21:01:24 | samussiah |   COMMENTED   |

#### Pull Request 1891: Only show flag-rows in Report_FlagOverTime()

Merging fix-1879 into dev

<https://github.com/Gilead-Public/gsm/pull/1891>

| Requester  |   Date Requested    | Reviewers | Review Status |
|:----------:|:-------------------:|:---------:|:-------------:|
| jonthegeek | 2024-10-15 15:50:40 |           |               |

#### Pull Request 1889: Resolve errors related to missing data and an incomplete set of `MetricID` in `dfBounds` .

Merging missing-data-fixes into dev

<https://github.com/Gilead-Public/gsm/pull/1889>

| Requester |   Date Requested    |      Reviewers       | Review Status |
|:---------:|:-------------------:|:--------------------:|:-------------:|
| samussiah | 2024-10-14 22:25:59 | zdz2101 lauramaxwell |   APPROVED    |

#### Pull Request 1885: Make Report_StudyInfo() Friendlier to Shiny

Merging fix-1799 into dev

<https://github.com/Gilead-Public/gsm/pull/1885>

| Requester  |   Date Requested    | Reviewers | Review Status |
|:----------:|:-------------------:|:---------:|:-------------:|
| jonthegeek | 2024-10-14 18:12:12 |           |   APPROVED    |

#### Pull Request 1884: Closes \#1659 and \#1660 to use `gt()` instead of `kbl()` in our functions and reports

Merging fix-1660 into dev

<https://github.com/Gilead-Public/gsm/pull/1884>

| Requester |   Date Requested    |       Reviewers        |   Review Status   |
|:---------:|:-------------------:|:----------------------:|:-----------------:|
|  zdz2101  | 2024-10-14 16:17:13 | lauramaxwell samussiah | CHANGES_REQUESTED |

#### Pull Request 1876: Fix country report

Merging fix-country-report into dev

<https://github.com/Gilead-Public/gsm/pull/1876>

| Requester |   Date Requested    |  Reviewers   | Review Status |
|:---------:|:-------------------:|:------------:|:-------------:|
| samussiah | 2024-10-10 18:31:08 | lauramaxwell |   APPROVED    |

#### Pull Request 1875: Closes \#1872 fix miscellaneous aesthetics things and issues

Merging fix-1872 into dev

<https://github.com/Gilead-Public/gsm/pull/1875>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
|  zdz2101  | 2024-10-10 18:24:25 |           |   COMMENTED   |

#### Pull Request 1871: yes to true in yamls

Merging yaml-fix-2.1 into dev

<https://github.com/Gilead-Public/gsm/pull/1871>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2024-10-08 19:06:56 |           |   APPROVED    |

#### Pull Request 1870: Release v2.1.0

Merging dev into main

<https://github.com/Gilead-Public/gsm/pull/1870>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2024-10-08 18:29:43 |           |   COMMENTED   |

#### Pull Request 1869: Closes \#1863 address small bugs in `MakeWorkflowList()` run as intended

Merging fix-1863 into dev

<https://github.com/Gilead-Public/gsm/pull/1869>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
|  zdz2101  | 2024-10-07 17:30:17 | jwildfire |   COMMENTED   |

#### Pull Request 1867: Gsm v2.1.0 Release Candidate

Merging gsm-v2.1.0-rc into dev

<https://github.com/Gilead-Public/gsm/pull/1867>

|  Requester   |   Date Requested    | Reviewers | Review Status |
|:------------:|:-------------------:|:---------:|:-------------:|
| lauramaxwell | 2024-10-04 14:31:53 | jwildfire |   APPROVED    |

#### Pull Request 1865: Workflow updates.

Merging gsm.template-updates into dev

<https://github.com/Gilead-Public/gsm/pull/1865>

| Requester |   Date Requested    |  Reviewers   | Review Status |
|:---------:|:-------------------:|:------------:|:-------------:|
| samussiah | 2024-10-01 15:01:35 | lauramaxwell |               |

#### Pull Request 1864: Load/Save - Take 2

Merging template-refactor-take2 into dev

<https://github.com/Gilead-Public/gsm/pull/1864>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
| jwildfire | 2024-09-30 21:36:28 |           |   COMMENTED   |

#### Pull Request 1862: Closes \#1859 checks and updates qualification tests in test/testqualification to align with new workflows for v2.1.0 release

Merging fix-1859 into dev

<https://github.com/Gilead-Public/gsm/pull/1862>

| Requester |   Date Requested    |    Reviewers     | Review Status |
|:---------:|:-------------------:|:----------------:|:-------------:|
|  zdz2101  | 2024-09-26 19:51:16 | andersonjake1988 |   COMMENTED   |

#### Pull Request 1861: Run `{gsm}` using local data store.

Merging gsm.template-updates into dev

<https://github.com/Gilead-Public/gsm/pull/1861>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
| samussiah | 2024-09-25 17:43:50 | jwildfire |   COMMENTED   |

#### Pull Request 1856: Add `rbm-viz` v2.1.0.

Merging fix-1855 into dev

<https://github.com/Gilead-Public/gsm/pull/1856>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
| samussiah | 2024-09-24 13:11:22 |           |   APPROVED    |

#### Pull Request 1853: Discuss \#1848 sections of package where there’s a difference of usage between `gt` vs “not”- `gt`

Merging fix-1848 into dev

<https://github.com/Gilead-Public/gsm/pull/1853>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
|  zdz2101  | 2024-09-19 20:18:58 |           |   COMMENTED   |

#### Pull Request 1852: Ingest modular

Merging ingest-modular into ingest

<https://github.com/Gilead-Public/gsm/pull/1852>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
| jwildfire | 2024-09-19 16:31:37 | samussiah |   COMMENTED   |

#### Pull Request 1851: Update `checkSpec()` cli message to handle `_all` required

Merging fix-1845 into dev

<https://github.com/Gilead-Public/gsm/pull/1851>

|  Requester   |   Date Requested    |      Reviewers      | Review Status |
|:------------:|:-------------------:|:-------------------:|:-------------:|
| lauramaxwell | 2024-09-19 13:31:01 | jwildfire samussiah |   APPROVED    |

#### Pull Request 1850: Closes \#1653 adds Flag Over Time Widget to Study Overview as a tab

Merging fix-1653-v0.2.1 into dev

<https://github.com/Gilead-Public/gsm/pull/1850>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
|  zdz2101  | 2024-09-18 17:53:55 | jwildfire |   COMMENTED   |

#### Pull Request 1849: MakeStudyInfo() function

Merging fix-1820 into dev

<https://github.com/Gilead-Public/gsm/pull/1849>

| Requester  |   Date Requested    | Reviewers | Review Status |
|:----------:|:-------------------:|:---------:|:-------------:|
| jonthegeek | 2024-09-17 20:31:37 |           |   APPROVED    |

#### Pull Request 1847: make analysis workflow work

Merging workflow-tweaks into ingest

<https://github.com/Gilead-Public/gsm/pull/1847>

| Requester |   Date Requested    |        Reviewers        | Review Status |
|:---------:|:-------------------:|:-----------------------:|:-------------:|
| samussiah | 2024-09-17 15:14:12 | jonthegeek lauramaxwell |   APPROVED    |

#### Pull Request 1844: Add `subjid` to EDC domains in mapping workflow.

Merging fix-1761 into ingest

<https://github.com/Gilead-Public/gsm/pull/1844>

| Requester |   Date Requested    |  Reviewers   | Review Status |
|:---------:|:-------------------:|:------------:|:-------------:|
| samussiah | 2024-09-13 16:53:31 | lauramaxwell |   APPROVED    |

#### Pull Request 1843: MakeMetricTable()

Merging fix-1835 into dev

<https://github.com/Gilead-Public/gsm/pull/1843>

| Requester  |   Date Requested    | Reviewers | Review Status |
|:----------:|:-------------------:|:---------:|:-------------:|
| jonthegeek | 2024-09-13 16:11:28 |           |   COMMENTED   |

#### Pull Request 1841: Refactor Data Ingestion Workflow

Merging ingest into dev

<https://github.com/Gilead-Public/gsm/pull/1841>

| Requester |   Date Requested    | Reviewers | Review Status |
|:---------:|:-------------------:|:---------:|:-------------:|
| jwildfire | 2024-09-13 09:16:58 | samussiah |   COMMENTED   |
