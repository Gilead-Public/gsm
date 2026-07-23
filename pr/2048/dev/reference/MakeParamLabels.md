# Create Labels for Parameters

**\[stable\]**

Convert a vector of parameters to labels in Title Case.
`MakeParamLabels` adds a `Labels` column to a `data.frame` that has a
`Params` column (such as `dfGroups`), while `MakeParamLabelsList`
returns just the list of named parameters.

## Usage

``` r
MakeParamLabels(dfGroups, lParamLabels = NULL)

MakeParamLabelsList(chrParams, lParamLabels = NULL)
```

## Arguments

- dfGroups:

  `data.frame` Group-level metadata dictionary. Created by passing CTMS
  site and study data to
  [`MakeLongMeta()`](https://gilead-public.github.io/gsm/dev/reference/MakeLongMeta.md).
  Expected columns: `GroupID`, `GroupLevel`, `Param`, `Value`.

- lParamLabels:

  `list` Labels for parameters, with the parameters as names, and the
  label as value.

- chrParams:

  A character vector of parameters, or a list that can be coerced to a
  character vector.

## Value

`dfGroups` with an added `Label` column, or a list of labeled
parameters.

## Examples

``` r
head(gsm::reportingGroups)
#>          GroupID           Param                  Value GroupLevel
#> 1 AA-AA-000-0000 protocol_row_id               1-1G9113      Study
#> 2 AA-AA-000-0000         studyid         AA-AA-000-0000      Study
#> 3 AA-AA-000-0000  protocol_title         Protocol Title      Study
#> 4 AA-AA-000-0000        nickname      Protocol Nickname      Study
#> 5 AA-AA-000-0000   protocol_type Investigator Sponsored      Study
#> 6 AA-AA-000-0000           phase                     P3      Study
MakeParamLabels(head(gsm::reportingGroups))
#>          GroupID           Param                  Value GroupLevel
#> 1 AA-AA-000-0000 protocol_row_id               1-1G9113      Study
#> 2 AA-AA-000-0000         studyid         AA-AA-000-0000      Study
#> 3 AA-AA-000-0000  protocol_title         Protocol Title      Study
#> 4 AA-AA-000-0000        nickname      Protocol Nickname      Study
#> 5 AA-AA-000-0000   protocol_type Investigator Sponsored      Study
#> 6 AA-AA-000-0000           phase                     P3      Study
#>             Label
#> 1 Protocol Row Id
#> 2         Studyid
#> 3  Protocol Title
#> 4        Nickname
#> 5   Protocol Type
#> 6           Phase
MakeParamLabels(
  head(gsm::reportingGroups),
  list(ParticipantCount = "Number of Participants")
)
#>          GroupID           Param                  Value GroupLevel
#> 1 AA-AA-000-0000 protocol_row_id               1-1G9113      Study
#> 2 AA-AA-000-0000         studyid         AA-AA-000-0000      Study
#> 3 AA-AA-000-0000  protocol_title         Protocol Title      Study
#> 4 AA-AA-000-0000        nickname      Protocol Nickname      Study
#> 5 AA-AA-000-0000   protocol_type Investigator Sponsored      Study
#> 6 AA-AA-000-0000           phase                     P3      Study
#>             Label
#> 1 Protocol Row Id
#> 2         Studyid
#> 3  Protocol Title
#> 4        Nickname
#> 5   Protocol Type
#> 6           Phase
MakeParamLabelsList(head(gsm::reportingGroups$Param))
#> $protocol_row_id
#> [1] "Protocol Row Id"
#> 
#> $studyid
#> [1] "Studyid"
#> 
#> $protocol_title
#> [1] "Protocol Title"
#> 
#> $nickname
#> [1] "Nickname"
#> 
#> $protocol_type
#> [1] "Protocol Type"
#> 
#> $phase
#> [1] "Phase"
#> 
```
