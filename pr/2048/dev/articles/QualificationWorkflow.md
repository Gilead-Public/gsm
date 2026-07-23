# Qualification Workflow

## Introduction

Qualification for this repository is done to ensure that the package is
functioning as intended and that core functions execute as expected on a
system-wide scale. While unit tests should also be written to test the
code, qualification testing is used to test that the expected behaviors
are happening correctly. Qualification is done using a set of
machine-readable documents and associated functions to create a strong
documentation structure as well as a cohesive qualification report. This
qualification process will be modified to add new assessments and should
be updated whenever there are updates that affect the workflows tested
by qualification tests. Qualification tests are designed to provide
developers with a repeatable process that is easy to update and
document.

## Process Overview

Each GSM assessment is independently qualified using **Specifications**
and **Test Cases**, which are then compiled into a **Qualification
Report**.

- **Specifications** - the expected behaviors that are being tested.
- **Test Cases** - testable pieces of code associated with
  Specifications.
- **Qualification Report** - Summary snapshot of all qualification
  activity.

## Specifications

Specifications should capture the most important use cases for a given
function. Each function must have at least one (1) specification, and
each specification must have at least one (1) associated test case.
Multiple specifications may exist for a function, and multiple test
cases may exist for a specification.

Each Specification should include the following components:

- **Description** - Outlines the use case for the specification.  
- **Risk Assessment** - An evaluation of risk for the the use case.
  Includes 2 components:
  - **Risk Level** - Risk Level can be “Low,” “Medium,” or “High,”
    corresponding to the risk associated with the specification
    failing.  
  - **Risk Impact** - Risk Impact can be “Low,” “Medium,” or “High,”
    corresponding to the severity of the impact associated with the
    specification failing.  
- **Test Cases** - A list of test cases associated with the
  specification.

The specifications (including Description, Risk Level, and Risk Impact)
should be documented in `qualification_specs.csv`, to be rendered by the
Qualification Report, documented in a later section. For example, the
first specification from `qualification_specs.csv` is written as:

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

## Test Cases

Test cases translate specifications into testable scripts to confirm
that the package functions meet the established requirements. Test cases
should be representative of how a user may utilize the function to help
identify code gaps and support testing automation. Test cases are linked
to the assessment as shown above.

Test cases are written using the standard `testthat` workflow and saved
in `tests/testqualification/qualification`. Each test case should be
saved as an individual file and named using the convention
`test_qual_{TestID}.R`, where TestID corresponds to the test case
number. Test code within these scripts should be written clearly and
concisely to facilitate quick execution, review, and interpretation.
Test cases should also have an informative description to outline what
is being tested.

Note that test cases can be associated with multiple specifications. For
example, S1_1 includes tests (T1_1, T1_2, T1_3) that the AE_Assess
function is performed properly for the Poisson method. Each of these
tests (T1_1, T1_2, T1_3) tests whether the Poisson method output is
accurate when the data is grouped by a different grouping variable
(Site, Study, Custom, respectively). In addition, the input data for
T1_1 and T1_2 are a subset of a larger dataframe, and thus T1_1 and T1_2
also test whether the AE_Assess function performs appropriately when
provided a subset of the input data, which satisfies spec S1_6.

An simple example test case is shown below. For this test case the file
would be called `test_qual_T21_1.R` and would correspond to T21_1 in the
specifications:

## Qualification Report

The Qualification Report is generated to document and display the
qualification that the code has been through. The report lives as a
Qualification vignette in [gsm](https://github.com/Gilead-BioStats/gsm)
and is rendered during other workflows. The Qualification Report is also
attached to each release and included in the
[pkgdown](https://pkgdown.r-lib.org/) site to display the qualification
status of [gsm](https://github.com/Gilead-BioStats/gsm). The sections of
the Qualification Report are outlined below.

#### Qualification Testing Results

Using the specifications, test cases, and test code outlined above the
qualification status of all assessments currently qualified within
[gsm](https://github.com/Gilead-BioStats/gsm) is rendered, consisting of
smaller sections for each assessment. These smaller sections will
include the procedure that is being qualified, which should correspond
to the function that is used for that procedure. An overview of the
specifications is also included that has the ID, Description, Risk
Level, Risk Impact, and associated test cases corresponding to each
specification. This information is pulled from the Specification
Spreadsheet file (`qualification_specs.csv`) outlined above.

##### Test Results: Overview

An overview of the qualification test results is presented as a table,
with one row for each function that has been tested. The results are
presented as a series of columns for the number of tests, number of
passing tests, number of failing tests, and number of skipped tests.

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

##### Test Results: Detailed

A detailed summary of the qualification test results is also provided in
table format in the Qualification Report. In this section, two tables
are presented, where the first presents each row as corresponding to a
single specification and the second presents each row as corresponding
to a single test.

- **One Row Per Specification** - Each row corresponds to a
  specification, and each specification is presented with a general
  description of the functionality tested for each specification, along
  with risk level, risk impact, and associated test IDs. In most cases,
  there are multiple test IDs associated with each specification.

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

- **One Row Per Test** - Each row corresponds to a single test (Test
  ID), and each test is presented with the function which is tested, the
  specification IDs the test satisfies, the detailed test description
  (including grouping variables and other function arguments that are
  tested), and the result of the test (Pass/Fail/Skip).

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

#### Unit Tests

A summary of the unit test coverage is included in the Qualification
Report to show how well the package functions are unit tested. This is
created by using
[`covr::package_coverage()`](http://covr.r-lib.org/reference/package_coverage.md)
and then listed out by function. Unit testing is performed in addition
to qualification testing to help ensure that individual pieces of code
within the R package function correctly and produce the expected
results. By testing individual units of code in isolation, developers
can identify and fix issues early in the development process before more
significant and scaled problems arise.

#### Qualification Testing Environment

The [`sessionInfo()`](https://rdrr.io/r/utils/sessionInfo.html) of the
qualification environment is included to show what R version, platform,
and packages were used when running the Qualification Report. This is
called after all necessary packages have been loaded and all setup is
done. The environment should not change after this part of the report is
created. In addition, a package list is provided, which includes the
package version and package score from `riskmetric`, which quantifies
the robustness of an R package. The `pkg_score` column captures the risk
involved with using a package. The risk level ranges from 0 (low risk)
to 1 (high risk).

#### Pull Requests

The final section of the Qualification Report is an overview of all Pull
Requests since the last release. This includes the title, compare and
base branches, a link to the GitHub page, requester, reviewers, date
requested, and the status of the Pull Request. While this is meant to be
a comprehensive overview of the Pull Requests the release documentation
should also include links to all Pull Requests included in the release.
