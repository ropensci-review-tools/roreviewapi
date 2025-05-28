# srr report for [reviser](https://github.com/p-wegmueller/reviser)



[Click here for full text of all standards](https://stats-devguide.ropensci.org/standards.html)







## Standards with `srrstats` tag



**Numbers of standards:**

-  G :  43  /  68

-  TS :  27  /  55

- Total : 70 / 123





### R directory



Standards on line#45 of file [R/data-vintages.R](https://github.com/p-wegmueller/reviser/blob/main/R/data-vintages.R#L45):

- G1.0 Statistical Software should list at least one primary reference from published academic literature.* 

Standards on line#121 of file [R/graphs.R](https://github.com/p-wegmueller/reviser/blob/main/R/graphs.R#L121):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- G2.9 Software should issue diagnostic messages for type conversion in which information is lost (such as conversion of variables from factor to character; standardisation of variable names; or removal of meta-data such as those associated with [`sf`-format](https://r-spatial.github.io/sf/) data) or added (such as insertion of variable or column names where none were provided).* 

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- TS1.2 Time Series Software should implement validation routines to confirm that inputs are of acceptable classes (or represented in otherwise appropriate ways for software which does not use class systems).

- TS1.3 Time Series Software should implement a single pre-processing routine to validate input data, and to appropriately transform it to a single uniform type to be passed to all subsequent data-processing functions (the [`tsbox` package](https://www.tsbox.help/) provides one convenient approach for this).

- TS5.0 Implement default `plot` methods for any implemented class system.

- TS5.1 When representing results in temporal domain(s), ensure that one axis is clearly labelled "time" (or equivalent), with continuous units.

- TS5.2 Default to placing the "time" (or equivalent) variable on the horizontal axis.

- TS5.3 Ensure that units of the time, frequency, or index variable are printed by default on the axis.

- TS5.5 Provide options to determine whether plots of data with missing values should generate continuous or broken lines.* 

Standards on line#10 of file [R/reviser-package.R](https://github.com/p-wegmueller/reviser/blob/main/R/reviser-package.R#L10):

- G1.2 Statistical Software should include a* Life Cycle Statement *describing current and anticipated future states of development.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

Standards on line#36 of file [R/reviser-package.R](https://github.com/p-wegmueller/reviser/blob/main/R/reviser-package.R#L36):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

Standards on line#90 of file [R/revisions.R](https://github.com/p-wegmueller/reviser/blob/main/R/revisions.R#L90):

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4a explicit conversion to `integer` via `as.integer()`

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- TS1.0 Time Series Software should use and rely on explicit class systems developed for representing time series data, and should not permit generic, non-time-series input* 

- TS1.1 Time Series Software should explicitly document the types and classes of input data able to be passed to each function.* 

- TS1.2 Time Series Software should implement validation routines to confirm that inputs are of acceptable classes (or represented in otherwise appropriate ways for software which does not use class systems).

- TS1.3 Time Series Software should implement a single pre-processing routine to validate input data, and to appropriately transform it to a single uniform type to be passed to all subsequent data-processing functions (the [`tsbox` package](https://www.tsbox.help/) provides one convenient approach for this).

- TS1.4 The pre-processing function described above should maintain all time- or date-based components or attributes of input data.* 

- TS1.5 The software should ensure strict ordering of the time, frequency, or equivalent ordering index variable.

- TS4.0a Be in same class as input data, for example by using the [`tsbox` package](https://www.tsbox.help/) to re-convert from standard internal format (see 1.4, above); or

- TS4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#352 of file [R/revisions.R](https://github.com/p-wegmueller/reviser/blob/main/R/revisions.R#L352):

- G1.0 Statistical Software should list at least one primary reference from published academic literature.* 

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- G3.1 Statistical software which relies on covariance calculations should enable users to choose between different algorithms for calculating covariances, and should not rely solely on covariances from the `stats::cov` function.

- G3.1a The ability to use arbitrarily specified covariance methods should be documented (typically in examples or vignettes).* 

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

- G5.8d Data outside the scope of the algorithm (for example, data with more fields (columns) than observations (rows) for some regression algorithms)

- TS1.1 Time Series Software should explicitly document the types and classes of input data able to be passed to each function.* 

- TS1.2 Time Series Software should implement validation routines to confirm that inputs are of acceptable classes (or represented in otherwise appropriate ways for software which does not use class systems).

- TS1.3 Time Series Software should implement a single pre-processing routine to validate input data, and to appropriately transform it to a single uniform type to be passed to all subsequent data-processing functions (the [`tsbox` package](https://www.tsbox.help/) provides one convenient approach for this).

- TS1.4 The pre-processing function described above should maintain all time- or date-based components or attributes of input data.* 

- TS1.5 The software should ensure strict ordering of the time, frequency, or equivalent ordering index variable.

- TS2.1 Where possible, all functions should provide options for users to specify how to handle missing data, with options minimally including:

- TS2.1a error on missing data; or.

- TS2.1b warn or ignore missing data, and proceed to analyse irregular data, ensuring that results from function calls with regular yet missing data return identical values to submitting equivalent irregular data with no missing values; or

- TS4.0 Return values should either:

- TS4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#872 of file [R/revisions.R](https://github.com/p-wegmueller/reviser/blob/main/R/revisions.R#L872):

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G2.14a error on missing data

- G2.14b ignore missing data with default warnings or messages issued

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- TS1.6 Any violations of ordering should be caught in the pre-processing stages of all functions.* 

- TS2.1 Where possible, all functions should provide options for users to specify how to handle missing data, with options minimally including:

- TS2.1a error on missing data; or.

- TS2.1b warn or ignore missing data, and proceed to analyse irregular data, ensuring that results from function calls with regular yet missing data return identical values to submitting equivalent irregular data with no missing values; or

Standards on line#1110 of file [R/revisions.R](https://github.com/p-wegmueller/reviser/blob/main/R/revisions.R#L1110):

- TS1.8 Where time intervals or periods may be days or months, be explicit about the system used to represent such, particularly regarding whether a calendar system is used, or whether a year is presumed to have 365 days, 365.2422 days, or some other value.* 

Standards on line#1532 of file [R/revisions.R](https://github.com/p-wegmueller/reviser/blob/main/R/revisions.R#L1532):

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#111 of file [R/smoother.R](https://github.com/p-wegmueller/reviser/blob/main/R/smoother.R#L111):

- G1.0 Statistical Software should list at least one primary reference from published academic literature.* 

- G1.1 Statistical Software should document whether the algorithm(s) it implements are:* - *The first implementation of a novel algorithm*; or - *The first implementation within **R** of an algorithm which has previously been implemented in other languages or contexts*; or - *An improvement on other implementations of similar algorithms in **R***. 

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G5.9a Adding trivial noise (for example, at the scale of `.Machine$double.eps`) to data does not meaningfully change results

- TS4.3 Return values should explicitly include all appropriate units and/or time scales* 

- TS4.6 Time Series Software which implements or otherwise enables forecasting should return either:

- TS4.6b For each variable to be forecast, predicted values equivalent to first- and second-order moments (for example, mean and standard error values).

- TS4.7 Ensure that forecast (modelled) values are clearly distinguished from observed (model or input) values, either (in this case in no order of preference) by

- TS4.7a Returning forecast values alone

- TS4.7b Returning distinct list items for model and forecast values

Standards on line#797 of file [R/smoother.R](https://github.com/p-wegmueller/reviser/blob/main/R/smoother.R#L797):

- G2.4b explicit conversion to continuous via `as.numeric()`

Standards on line#1063 of file [R/smoother.R](https://github.com/p-wegmueller/reviser/blob/main/R/smoother.R#L1063):

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.4c explicit conversion to character via `as.character()` (and not `paste` or `paste0`)

Standards on line#50 of file [R/utils.R](https://github.com/p-wegmueller/reviser/blob/main/R/utils.R#L50):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- G2.9 Software should issue diagnostic messages for type conversion in which information is lost (such as conversion of variables from factor to character; standardisation of variable names; or removal of meta-data such as those associated with [`sf`-format](https://r-spatial.github.io/sf/) data) or added (such as insertion of variable or column names where none were provided).* 

- TS1.1 Time Series Software should explicitly document the types and classes of input data able to be passed to each function.* 

- TS1.2 Time Series Software should implement validation routines to confirm that inputs are of acceptable classes (or represented in otherwise appropriate ways for software which does not use class systems).

- TS4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#179 of file [R/utils.R](https://github.com/p-wegmueller/reviser/blob/main/R/utils.R#L179):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- G2.9 Software should issue diagnostic messages for type conversion in which information is lost (such as conversion of variables from factor to character; standardisation of variable names; or removal of meta-data such as those associated with [`sf`-format](https://r-spatial.github.io/sf/) data) or added (such as insertion of variable or column names where none were provided).* 

- TS1.1 Time Series Software should explicitly document the types and classes of input data able to be passed to each function.* 

- TS1.2 Time Series Software should implement validation routines to confirm that inputs are of acceptable classes (or represented in otherwise appropriate ways for software which does not use class systems).

- TS4.0b Be in a unique, preferably class-defined, format.

- TS4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#339 of file [R/utils.R](https://github.com/p-wegmueller/reviser/blob/main/R/utils.R#L339):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- G2.11 Software should ensure that `data.frame`-like tabular objects which have columns which do not themselves have standard class attributes (typically, `vector`) are appropriately processed, and do not error without reason. This behaviour should be tested. Again, columns created by the [`units` package](https://github.com/r-quantities/units/) provide a good test case.

- G2.12 Software should ensure that `data.frame`-like tabular objects which have list columns should ensure that those columns are appropriately pre-processed either through being removed, converted to equivalent vector columns where appropriate, or some other appropriate treatment such as an informative error. This behaviour should be tested.* 

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- G2.9 Software should issue diagnostic messages for type conversion in which information is lost (such as conversion of variables from factor to character; standardisation of variable names; or removal of meta-data such as those associated with [`sf`-format](https://r-spatial.github.io/sf/) data) or added (such as insertion of variable or column names where none were provided).* 

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- TS1.1 Time Series Software should explicitly document the types and classes of input data able to be passed to each function.* 

- TS1.2 Time Series Software should implement validation routines to confirm that inputs are of acceptable classes (or represented in otherwise appropriate ways for software which does not use class systems).

- TS1.3 Time Series Software should implement a single pre-processing routine to validate input data, and to appropriately transform it to a single uniform type to be passed to all subsequent data-processing functions (the [`tsbox` package](https://www.tsbox.help/) provides one convenient approach for this).

- TS1.4 The pre-processing function described above should maintain all time- or date-based components or attributes of input data.* 

- TS2.0 Time Series Software which presumes or requires regular data should only allow **explicit** missing values, and should issue appropriate diagnostic messages, potentially including errors, in response to any **implicit** missing values.

- TS4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#452 of file [R/utils.R](https://github.com/p-wegmueller/reviser/blob/main/R/utils.R#L452):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- TS1.0 Time Series Software should use and rely on explicit class systems developed for representing time series data, and should not permit generic, non-time-series input* 

- TS1.2 Time Series Software should implement validation routines to confirm that inputs are of acceptable classes (or represented in otherwise appropriate ways for software which does not use class systems).

- TS1.3 Time Series Software should implement a single pre-processing routine to validate input data, and to appropriately transform it to a single uniform type to be passed to all subsequent data-processing functions (the [`tsbox` package](https://www.tsbox.help/) provides one convenient approach for this).

- TS4.0b Be in a unique, preferably class-defined, format.

- TS4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#495 of file [R/utils.R](https://github.com/p-wegmueller/reviser/blob/main/R/utils.R#L495):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- G2.9 Software should issue diagnostic messages for type conversion in which information is lost (such as conversion of variables from factor to character; standardisation of variable names; or removal of meta-data such as those associated with [`sf`-format](https://r-spatial.github.io/sf/) data) or added (such as insertion of variable or column names where none were provided).* 

- TS1.3 Time Series Software should implement a single pre-processing routine to validate input data, and to appropriately transform it to a single uniform type to be passed to all subsequent data-processing functions (the [`tsbox` package](https://www.tsbox.help/) provides one convenient approach for this).

- TS1.4 The pre-processing function described above should maintain all time- or date-based components or attributes of input data.* 

- TS4.0 Return values should either:

Standards on line#510 of file [R/utils.R](https://github.com/p-wegmueller/reviser/blob/main/R/utils.R#L510):

- TS2.0 Time Series Software which presumes or requires regular data should only allow **explicit** missing values, and should issue appropriate diagnostic messages, potentially including errors, in response to any **implicit** missing values.

Standards on line#593 of file [R/utils.R](https://github.com/p-wegmueller/reviser/blob/main/R/utils.R#L593):

- TS2.0 Time Series Software which presumes or requires regular data should only allow **explicit** missing values, and should issue appropriate diagnostic messages, potentially including errors, in response to any **implicit** missing values.



### tests directory



Standards on line#12 of file [tests/testthat/test-revision.R](https://github.com/p-wegmueller/reviser/blob/main/tests/testthat/test-revision.R#L12):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8a Zero-length data

- G5.8b Data of unsupported types (e.g., character or complex numbers in for functions designed only for numeric data)

- G5.8c Data with all-`NA` fields or columns or all identical fields or columns

Standards on line#6 of file [tests/testthat/test-smoother.R](https://github.com/p-wegmueller/reviser/blob/main/tests/testthat/test-smoother.R#L6):

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4a For new methods, it can be difficult to separate out correctness of the method from the correctness of the implementation, as there may not be reference for comparison. In this case, testing may be implemented against simple, trivial cases or against multiple implementations such as an initial R implementation compared with results from a C/C++ implementation.



---



## Standards with `srrstatsNA` tag



**Numbers of standards:**

-  G :  25  /  68

-  TS :  28  /  55

- Total : 53 / 123





### R directory



Standards on line#74 of file [R/srr-stats-standards.R](https://github.com/p-wegmueller/reviser/blob/main/R/srr-stats-standards.R#L74):

- G1.5 Software should include all code necessary to reproduce results which form the basis of performance claims made in associated publications.* 

- G1.6 Software should include code necessary to compare performance claims with alternative implementations in other R packages.* 

- G2.14c replace missing data with appropriately imputed values

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.4d explicit conversion to factor via `as.factor()`

- G2.4e explicit conversion from factor via `as...()` functions

- G2.5 Where inputs are expected to be of `factor` type, secondary documentation should explicitly state whether these should be `ordered` or not, and those inputs should provide appropriate error or other routines to ensure inputs follow these expectations.* 

- G3.0 Statistical software should never compare floating point numbers for equality. All numeric equality comparisons should either ensure that they are made between integers, or use appropriate tolerances for approximate equality.* 

- G4.0 Statistical Software which enables outputs to be written to local files should parse parameters specifying file names to ensure appropriate file suffices are automatically generated where not provided.* 

- G5.0 Where applicable or practicable, tests should use standard data sets with known properties (for example, the [NIST Standard Reference Datasets](https://www.itl.nist.gov/div898/strd/), or data sets provided by other widely-used R packages).

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

- G5.10 Extended tests should included and run under a common framework with other tests but be switched on by flags such as as a `<MYPKG>_EXTENDED_TESTS="true"` environment variable.* - The extended tests can be then run automatically by GitHub Actions for example by adding the following to the `env` section of the workflow: 

- G5.11 Where extended tests require large data sets or other assets, these should be provided for downloading and fetched as part of the testing workflow.

- G5.11a When any downloads of additional data necessary for extended tests fail, the tests themselves should not fail, rather be skipped and implicitly succeed with an appropriate diagnostic message.

- G5.12 Any conditions necessary to run extended tests such as platform requirements, memory, expected runtime, and artefacts produced that may need manual inspection, should be described in developer documentation such as a `CONTRIBUTING.md` or `tests/README.md` file.

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

- G5.4c Where applicable, stored values may be drawn from published paper outputs when applicable and where code from original implementations is not available

- G5.5 Correctness tests should be run with a fixed random seed

- G5.6 *Parameter recovery tests** *to test that the implementation produce expected results given data with known properties. For instance, a linear regression algorithm should return expected coefficient values for a simulated data set generated from a linear model.

- G5.6a Parameter recovery tests should generally be expected to succeed within a defined tolerance rather than recovering exact values.

- G5.6b Parameter recovery tests should be run with multiple random seeds when either data simulation or the algorithm contains a random component. (When long-running, such tests may be part of an extended, rather than regular, test suite; see G5.10-4.12, below).* 

- G5.7 *Algorithm performance tests** *to test that implementation performs as expected as properties of data change. For instance, a test may show that parameters approach correct estimates within tolerance as data size increases, or that convergence times decrease for higher convergence thresholds.

- G5.9 *Noise susceptibility tests** *Packages should test for expected stochastic behaviour, such as through the following conditions:

- G5.9b Running under different random seeds or initial conditions does not meaningfully change results* 

- TS1.7 Accept inputs defined via the [`units` package](https://github.com/r-quantities/units/) for attributing SI units to R vectors.

- TS2.1c replace missing data with appropriately imputed values.* 

- TS2.2 Consider stationarity of all relevant moments - typically first (mean) and second (variance) order, or otherwise document why such consideration may be restricted to lower orders only.

- TS2.3 Explicitly document all assumptions and/or requirements of stationarity

- TS2.4 Implement appropriate checks for all relevant forms of stationarity, and either:

- TS2.4a issue diagnostic messages or warnings; or

- TS2.4b enable or advise on appropriate transformations to ensure stationarity.* 

- TS2.5 Incorporate a system to ensure that both row and column orders follow the same ordering as the underlying time series data. This may, for example, be done by including the `index` attribute of the time series data as an attribute of the auto-covariance matrix.

- TS2.6 Where applicable, auto-covariance matrices should also include specification of appropriate units.* 

- TS3.0 Provide tests to demonstrate at least one case in which errors widen appropriately with forecast horizon.

- TS3.1 If possible, provide at least one test which violates TS3.0

- TS3.2 Document the general drivers of forecast errors or horizons, as demonstrated via the particular cases of TS3.0 and TS3.1

- TS3.3 Either:

- TS3.3a Document, preferable via an example, how to trim forecast values based on a specified error margin or equivalent; or

- TS3.3b Provide an explicit mechanism to trim forecast values to a specified error margin, either via an explicit post-processing function, or via an input parameter to a primary analytic function.* 

- TS4.1 Any units included as attributes of input data should also be included within return values.

- TS4.4 Document the effect of any such transformations on forecast data, including potential effects on both first- and second-order estimates.

- TS4.5 In decreasing order of preference, either:

- TS4.5a Provide explicit routines or options to back-transform data commensurate with original, non-stationary input data

- TS4.5b Demonstrate how data may be back-transformed to a form commensurate with original, non-stationary input data.

- TS4.5c Document associated limitations on forecast values* 

- TS4.6a A distribution object, for example via one of the many packages described in the CRAN Task View on [Probability Distributions](https://cran.r-project.org/web/views/Distributions.html) (or the new [`distributional` package](https://pkg.mitchelloharawild.com/distributional/) as used in the [`fable` package](https://fable.tidyverts.org) for time-series forecasting).

- TS4.6c Some more general indication of error associated with forecast estimates.* 

- TS4.7c Combining model and forecast values into a single return object with an appropriate additional column clearly distinguishing the two kinds of data.* 

- TS5.4 For frequency visualization, abscissa spanning $[-\pi, \pi]$ should be avoided in favour of positive units of $[0, 2\pi]$ or $[0, 0.5]$, in all cases with appropriate additional explanation of units.

- TS5.6 By default indicate distributional limits of forecast on plot

- TS5.7 By default include model (input) values in plot, as well as forecast (output) values

- TS5.8 By default provide clear visual distinction between model (input) values and forecast (output) values.



---



