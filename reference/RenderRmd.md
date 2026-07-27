# Custom Rmarkdown render function

Rmarkdown render function that defaults to rendering intermediate rmd
files in a temporary directory

## Usage

``` r
RenderRmd(
  strInputPath,
  strOutputFile = basename(strInputPath),
  strOutputDir = getwd(),
  lParams
)
```

## Arguments

- strInputPath:

  `string` or `fs_path` Path to the template `Rmd` file.

- strOutputFile:

  `string` Filename for the output.

- strOutputDir:

  `string` or `fs_path` Path to the directory where the output will be
  saved.

- lParams:

  `list` Parameters to pass to the template `Rmd` file.

## Value

Rendered Rmarkdown file
