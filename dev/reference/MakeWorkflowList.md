# Load workflows from a package/directory.

**\[stable\]**

`MakeWorkflowList()` is a utility function that creates a list of
workflows for use in KRI pipelines.

## Usage

``` r
MakeWorkflowList(
  strNames = NULL,
  strPath = "workflow",
  strPackage = "gsm",
  bExact = FALSE,
  bRecursive = TRUE
)
```

## Arguments

- strNames:

  `array of character` List of workflows to include. NULL (the default)
  includes all workflows in the specified locations.

- strPath:

  `character` The location of workflow YAML files. If NULL (the
  default), function will look in `/inst/workflow` folder.

- strPackage:

  `character` The package name where the workflow YAML files are
  located. If NULL, the package will use an absolute path.

- bExact:

  `logical` Should strName matches be exact? If false, partial matches
  will be included. Default FALSE.

- bRecursive:

  `logical` Find files in nested folders? Default TRUE

## Value

`list` A list of workflows with workflow and parameter metadata.

## Examples

``` r
# use default
workflow <- MakeWorkflowList()

# get specific workflow files
workflow <- MakeWorkflowList(strNames = c("kri0001", "kri0005", "cou0003"))
```
