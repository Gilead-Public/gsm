# Input_Rate

**\[stable\]**

Calculate a subject level rate from numerator and denominator data

This function takes in a list of data frames including dfSUBJ,
dfNumerator, and dfDenominator, and calculates a subject level rate
based on the specified numerator and denominator methods (either "Count"
or "Sum"). If the method is "Count", the function simply counts the
number of rows in the provided data frame. If the numerator method is
"Sum", the function takes the sum of the values in the specified column
(strNumeratorCol or strDenominatorCol). The function returns a data
frame with the calculated input rate for each subject.

The data requirements for the function are as follows:

- dfSubjects: A data frame with columns for SubjectID and any other
  relevant subject information

- dfNumerator: A data frame with a column for SubjectID and
  `strNumeratorCol` if `strNumeratorMethod` is "Sum"

- dfDenominator: A data frame with a column for SubjectID and
  `strDenominatorCol` if `strDenominatorMethod` is "Sum"

All other columns are dropped from the output data frame. Note that if
no values for a subject are found in dfNumerator/dfDenominator numerator
and denominator values are filled with 0 in the output data frame.

## Usage

``` r
Input_Rate(
  dfSubjects,
  dfNumerator,
  dfDenominator,
  strGroupCol = "GroupID",
  strGroupLevel = NULL,
  strSubjectCol = "SubjectID",
  strNumeratorMethod = c("Count", "Sum"),
  strDenominatorMethod = c("Count", "Sum"),
  strNumeratorCol = NULL,
  strDenominatorCol = NULL
)
```

## Arguments

- dfSubjects:

  `data.frame` with columns for SubjectID and any other relevant subject
  information

- dfNumerator:

  `data.frame` with a column for SubjectID and `strNumeratorCol` if
  `strNumeratorMethod` is "Sum"

- dfDenominator:

  `data.frame` with a column for SubjectID and `strDenominatorCol` if
  `strDenominatorMethod` is "Sum"

- strGroupCol:

  `character` Column name in `dfSubjects` to use for grouping. Default:
  "GroupID"

- strGroupLevel:

  `character` value for the group level. Default: NULL which is parsed
  to `strGroupCol`

- strSubjectCol:

  `character` Column name in `dfSubjects` to use for subject ID.
  Default: "SubjectID"

- strNumeratorMethod:

  `character` Method to calculate numerator. Default: "Count"

- strDenominatorMethod:

  `character` Method to calculate denominator. Default: "Count"

- strNumeratorCol:

  `character` Column name in `dfNumerator` to use for numerator
  calculation. Default: NULL

- strDenominatorCol:

  `character` Column name in `dfDenominator` to use for denominator
  calculation. Default: NULL

## Value

`data.frame` with the following specification:

|             |                                  |           |
|-------------|----------------------------------|-----------|
| Column Name | Description                      | Type      |
| SubjectID   | The subject ID                   | Character |
| GroupID     | The group ID                     | Character |
| GroupLevel  | The group type                   | Character |
| Numerator   | The calculated numerator value   | Numeric   |
| Denominator | The calculated denominator value | Numeric   |
| Metric      | The calculated input rate/metric | Numeric   |

## Examples

``` r
# Run for AE KRI
dfInput <- Input_Rate(
  dfSubjects = clindata::rawplus_dm,
  dfNumerator = clindata::rawplus_ae,
  dfDenominator = clindata::rawplus_dm,
  strSubjectCol = "subjid",
  strGroupCol = "siteid",
  strGroupLevel = "Site",
  strNumeratorMethod = "Count",
  strDenominatorMethod = "Sum",
  strDenominatorCol = "timeontreatment"
)
```
