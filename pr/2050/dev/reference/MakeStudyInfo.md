# Generate a study information data.frame for use in reports

**\[stable\]**

Generate a study info table summarizing study metadata.

## Usage

``` r
MakeStudyInfo(dfGroups, lStudyLabels = NULL, lStudy = deprecated())
```

## Arguments

- dfGroups:

  `data.frame` Group-level metadata dictionary. Created by passing CTMS
  site and study data to
  [`MakeLongMeta()`](https://gilead-public.github.io/gsm/dev/reference/MakeLongMeta.md).
  Expected columns: `GroupID`, `GroupLevel`, `Param`, `Value`.

- lStudyLabels:

  `list` A list containing study labels. Default is NULL.

- lStudy:

  `deprecated` Study information as a named list.

## Value

A data.frame containing study metadata.

## Examples

``` r
MakeStudyInfo(gsm::reportingGroups)
#>                      Param                  Value             Description
#> 1          protocol_row_id               1-1G9113         Protocol Row Id
#> 2                  studyid         AA-AA-000-0000                 Studyid
#> 3           protocol_title         Protocol Title          Protocol Title
#> 4                 nickname      Protocol Nickname                Nickname
#> 5            protocol_type Investigator Sponsored           Protocol Type
#> 6                    phase                     P3                   Phase
#> 7            num_plan_site                    190           Num Plan Site
#> 8            num_site_actl                    176           Num Site Actl
#> 9                 est_fpfv             2003-01-01                Est Fpfv
#> 10                act_fpfv             2003-01-01                Act Fpfv
#> 11                est_lplv             2021-06-01                Est Lplv
#> 12                act_lplv             2021-06-01                Act Lplv
#> 13                est_lpfv             2020-06-01                Est Lpfv
#> 14                act_lpfv             2020-06-01                Act Lpfv
#> 15                  Status                 Active            Study Status
#> 16           num_plan_subj                   1300           Num Plan Subj
#> 17     num_enrolled_subj_m                   1301     Num Enrolled Subj M
#> 18     protocol_indication    Protocol Indication     Protocol Indication
#> 19                 product                Product                 Product
#> 20        therapeutic_area       Therapeutic Area        Therapeutic Area
#> 21 protocol_product_number                    123 Protocol Product Number
#> 22               x_rbm_flg                      Y               X Rbm Flg
#> 23        ParticipantCount                     50   Participants Enrolled
#> 24               SiteCount                    154          Sites Enrolled
MakeStudyInfo(gsm::reportingGroups, list(SiteCount = "# Sites"))
#>                      Param                  Value             Description
#> 1          protocol_row_id               1-1G9113         Protocol Row Id
#> 2                  studyid         AA-AA-000-0000                 Studyid
#> 3           protocol_title         Protocol Title          Protocol Title
#> 4                 nickname      Protocol Nickname                Nickname
#> 5            protocol_type Investigator Sponsored           Protocol Type
#> 6                    phase                     P3                   Phase
#> 7            num_plan_site                    190           Num Plan Site
#> 8            num_site_actl                    176           Num Site Actl
#> 9                 est_fpfv             2003-01-01                Est Fpfv
#> 10                act_fpfv             2003-01-01                Act Fpfv
#> 11                est_lplv             2021-06-01                Est Lplv
#> 12                act_lplv             2021-06-01                Act Lplv
#> 13                est_lpfv             2020-06-01                Est Lpfv
#> 14                act_lpfv             2020-06-01                Act Lpfv
#> 15                  Status                 Active                  Status
#> 16           num_plan_subj                   1300           Num Plan Subj
#> 17     num_enrolled_subj_m                   1301     Num Enrolled Subj M
#> 18     protocol_indication    Protocol Indication     Protocol Indication
#> 19                 product                Product                 Product
#> 20        therapeutic_area       Therapeutic Area        Therapeutic Area
#> 21 protocol_product_number                    123 Protocol Product Number
#> 22               x_rbm_flg                      Y               X Rbm Flg
#> 23        ParticipantCount                     50       Participant Count
#> 24               SiteCount                    154                 # Sites
```
