# 📄 `inst` Summary


This README summarizes the contents found in the `gsm/inst` directory.

---

# 📁 `examples`

#### Description

R files that walk through `{gsm}` analysis pipeline and reporting pipeline, with and without the use of `yaml` files that specify the workflow.


#### Contents

```
├── _setup.R
├── LongitudinalReport.R
├── workflow_basic.R
├── workflow_pipes.R
├── workflow_report.R
├── workflow_yaml_basic.R
├── workflow_yaml_charts.R
├── workflow_yaml_country.R
├── workflow_yaml_report.R

```

---

# 📁 `gismo-tables` 

#### Description

JSON files used to test data pipeline functionality, and used as a reference for expected outputs from certain `{gsm}` workflows.

#### Contents

```
├── country-dropdown-list.json
├── kri-details-sites.json
├── kri-graph-details.json
├── kri-headers-details.json
├── kri-list-details.json
├── kri-sites-dropdown.json
├── pretty-print.py
├── site-custom-columns.json
├── site-details-graph.json
├── site-details-kris.json
├── site-header-details.json
├── site-summary-details.json
├── site-summary-sparklines.json
├── snapshot-dates.json
├── study-details.json
└── study-headers-details.json
```

---

# 📁 `htmlwidgets`

#### Description

`.js` and `.yaml` files that are used to configure [`htmlwidgets`](https://www.htmlwidgets.org/) that use a custom JavaScript charting library.


#### Contents

```
├── Widget_BarChart.js
├── Widget_BarChart.yaml
├── Widget_ScatterPlot.js
├── Widget_ScatterPlot.yaml
├── Widget_TimeSeries.js
├── Widget_TimeSeries.yaml
```

---

# 📁 `qualification`

#### Description

R scripts and a specification file that are used as part of the automated qualification framework.

#### Contents

```
├── qualification_map.R
├── qualification_specs.csv
├── specs.R
└── test_cases.R
```

---

# 📁 `rbm-viz-*`

#### Description

Bundled/minified JavaScript charting library that is used as part of the `htmlwidget` configuration.

#### Contents

```
└── rbm-viz.js
```

---

# 📁 `report`

#### Description

R Markdown files that are used as templates underlying the [`gsm::Study_Report()`](https://gilead-public.github.io/gsm/reference/Study_Report.html) function. Also includes a `.css` file for HTML styling.

#### Contents

```
├── KRIReportByCountry.Rmd
├── KRIReportBySite.Rmd
└── styles.css
```

---

# 📁 `utils-0.0.1`

#### Description

JavaScript utility functions used to configure `htmlwidgets` and for custom reporting functions.

#### Contents

```
├── addSiteSelect.js
├── clickCallback.js
├── dragOverallSiteDropdown.js
├── number_to_array.js
├── overallSiteDropdown.js
└── toggleTables.js
```
---

# 📄 Wordlist

#### Description

Text file that contains words that are omitted from `devtools::spell_check()`.

---

# 📁 `workflow`

#### Description

YAML files that are used to configure assessment workflows, passed into `gsm::Study_Assess()` or `gsm::Make_Snapshot()`.

#### Contents

```
├── cou0001.yaml
├── cou0002.yaml
├── cou0003.yaml
├── cou0004.yaml
├── cou0005.yaml
├── cou0006.yaml
├── cou0007.yaml
├── cou0008.yaml
├── cou0009.yaml
├── cou0010.yaml
├── cou0011.yaml
├── cou0012.yaml
├── counts.yaml
├── kri0001.yaml
├── kri0002.yaml
├── kri0003.yaml
├── kri0004.yaml
├── kri0005.yaml
├── kri0006.yaml
├── kri0007.yaml
├── kri0008.yaml
├── kri0009.yaml
├── kri0010.yaml
├── kri0011.yaml
├── kri0012.yaml
├── mapping.yaml
```

