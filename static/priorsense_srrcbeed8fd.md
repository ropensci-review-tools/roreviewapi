# srr report for [priorsense](https://github.com/n-kall/priorsense,)



[Click here for full text of all standards](https://stats-devguide.ropensci.org/standards.html)







## Standards with `srrstats` tag



**Numbers of standards:**

-  EA :  31  /  34

-  G :  50  /  68

- Total : 81 / 102





### R directory



Standards on line#10 of file [R/additional_divergence_measures.R](https://github.com/n-kall/priorsense,/blob/main/R/additional_divergence_measures.R#L10):

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

Standards on line#28 of file [R/additional_divergence_measures.R](https://github.com/n-kall/priorsense,/blob/main/R/additional_divergence_measures.R#L28):

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

Standards on line#96 of file [R/additional_divergence_measures.R](https://github.com/n-kall/priorsense,/blob/main/R/additional_divergence_measures.R#L96):

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

Standards on line#165 of file [R/additional_divergence_measures.R](https://github.com/n-kall/priorsense,/blob/main/R/additional_divergence_measures.R#L165):

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

Standards on line#214 of file [R/additional_divergence_measures.R](https://github.com/n-kall/priorsense,/blob/main/R/additional_divergence_measures.R#L214):

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

Standards on line#286 of file [R/additional_divergence_measures.R](https://github.com/n-kall/priorsense,/blob/main/R/additional_divergence_measures.R#L286):

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

Standards on line#322 of file [R/additional_divergence_measures.R](https://github.com/n-kall/priorsense,/blob/main/R/additional_divergence_measures.R#L322):

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

Standards on line#45 of file [R/cjs.R](https://github.com/n-kall/priorsense,/blob/main/R/cjs.R#L45):

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#39 of file [R/create_priorsense_data.R](https://github.com/n-kall/priorsense,/blob/main/R/create_priorsense_data.R#L39):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.4c explicit conversion to character via `as.character()` (and not `paste` or `paste0`)

- G2.4e explicit conversion from factor via `as...()` functions

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

Standards on line#15 of file [R/example_powerscale_model.R](https://github.com/n-kall/priorsense,/blob/main/R/example_powerscale_model.R#L15):

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

Standards on line#9 of file [R/find_alpha_threshold.R](https://github.com/n-kall/priorsense,/blob/main/R/find_alpha_threshold.R#L9):

- G3.0 Statistical software should never compare floating point numbers for equality. All numeric equality comparisons should either ensure that they are made between integers, or use appropriate tolerances for approximate equality.* 

- EA4.1 EDA Software should implement parameters to enable explicit control of numeric precision

Standards on line#32 of file [R/plots.R](https://github.com/n-kall/priorsense,/blob/main/R/plots.R#L32):

- EA5.0 Graphical presentation in EDA software should be as accessible as possible or practicable. In particular, EDA software should consider accessibility in terms of:

- EA5.0a Typeface sizes, which should default to sizes which explicitly enhance accessibility

- EA5.0b Default colour schemes, which should be carefully constructed to ensure accessibility.

- EA5.4 All visualisations should ensure values are rounded sensibly (for example, via `pretty()` function).

Standards on line#40 of file [R/powerscale.R](https://github.com/n-kall/priorsense,/blob/main/R/powerscale.R#L40):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

Standards on line#91 of file [R/powerscale.R](https://github.com/n-kall/priorsense,/blob/main/R/powerscale.R#L91):

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.4c explicit conversion to character via `as.character()` (and not `paste` or `paste0`)

- G2.4e explicit conversion from factor via `as...()` functions

- EA2.6 Routines should appropriately process vector data regardless of additional attributes* 

Standards on line#34 of file [R/powerscale_sensitivity.R](https://github.com/n-kall/priorsense,/blob/main/R/powerscale_sensitivity.R#L34):

- EA3.0 The algorithmic components of EDA Software should enable automated extraction and/or reporting of statistics as some sufficiently "meta" level (such as variable or model selection), for which previous or reference implementations require manual intervention.

Standards on line#4 of file [R/print.R](https://github.com/n-kall/priorsense,/blob/main/R/print.R#L4):

- EA4.2 The primary routines of EDA Software should return objects for which default `print` and `plot` methods give sensible results. Default `summary` methods may also be implemented.* 

- EA5.2 Screen-based output should never rely on default print formatting of `numeric` types, rather should also use some version of `round(., digits)`, `formatC`, `sprintf`, or similar functions for numeric formatting according the parameter described in* **EA4.1**.

Standards on line#70 of file [R/priorsense-package.R](https://github.com/n-kall/priorsense,/blob/main/R/priorsense-package.R#L70):

- G1.0 Statistical Software should list at least one primary reference from published academic literature.* 

- G1.1 Statistical Software should document whether the algorithm(s) it implements are:* - *The first implementation of a novel algorithm*; or - *The first implementation within **R** of an algorithm which has previously been implemented in other languages or contexts*; or - *An improvement on other implementations of similar algorithms in **R***. 

- G1.2 Statistical Software should include a* Life Cycle Statement *describing current and anticipated future states of development.* 

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- EA1.0 Identify one or more target audiences for whom the software is intended

- EA1.1 Identify the kinds of data the software is capable of analysing (see *Kinds of Data* below).

- EA1.2 Identify the kinds of questions the software is intended to help explore.* 

- EA1.3 Identify the kinds of data each function is intended to accept as input* 

- EA2.0 EDA Software which accepts standard tabular data and implements or relies upon extensive table filter and join operations should utilise an **index column** system

- EA2.1 All values in an index column must be unique, and this uniqueness should be affirmed as a pre-processing step for all input data.

- EA2.2 Index columns should be explicitly identified, either:

- EA2.2a by using an appropriate class system, or

- EA2.2b through setting an `attribute` on a table, `x`, of `attr(x, "index") <- <index_col_name>`.* 

- EA2.3 Table join operations should not be based on any assumed variable or column names* 

- EA2.4 Use and demand an explicit class system for such input (for example, via the [`DM` package](https://github.com/krlmlr/dm)).

- EA2.5 Ensure all individual tables follow the above standards for Index Columns* 

- EA3.1 EDA software should enable standardised comparison of inputs, processes, models, or outputs which previous or reference implementations otherwise only enable in some comparably unstandardised form.* 

- EA5.3 Column-based summary statistics should always indicate the `storage.mode`, `class`, or equivalent defining attribute of each column.* 

Standards on line#111 of file [R/summarise_draws.R](https://github.com/n-kall/priorsense,/blob/main/R/summarise_draws.R#L111):

- EA4.2 The primary routines of EDA Software should return objects for which default `print` and `plot` methods give sensible results. Default `summary` methods may also be implemented.* 

Standards on line#19 of file [R/weighted_quantities.R](https://github.com/n-kall/priorsense,/blob/main/R/weighted_quantities.R#L19):

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.14a error on missing data

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#8 of file [R/whiten_draws.R](https://github.com/n-kall/priorsense,/blob/main/R/whiten_draws.R#L8):

- G3.1 Statistical software which relies on covariance calculations should enable users to choose between different algorithms for calculating covariances, and should not rely solely on covariances from the `stats::cov` function.

- G3.1a The ability to use arbitrarily specified covariance methods should be documented (typically in examples or vignettes).* 



### tests directory



Standards on line#14 of file [tests/testthat/test_cjs.R](https://github.com/n-kall/priorsense,/blob/main/tests/testthat/test_cjs.R#L14):

- EA6.0e Values of single-valued objects; for `numeric` values either using `testthat::expect_equal()` or equivalent with a defined value for the `tolerance` parameter, or using `round(..., digits = x)` with some defined value of `x` prior to testing equality.* 

Standards on line#34 of file [tests/testthat/test_cjs.R](https://github.com/n-kall/priorsense,/blob/main/tests/testthat/test_cjs.R#L34):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8b Data of unsupported types (e.g., character or complex numbers in for functions designed only for numeric data)

Standards on line#25 of file [tests/testthat/test_conjugate.R](https://github.com/n-kall/priorsense,/blob/main/tests/testthat/test_conjugate.R#L25):

- G5.4a For new methods, it can be difficult to separate out correctness of the method from the correctness of the implementation, as there may not be reference for comparison. In this case, testing may be implemented against simple, trivial cases or against multiple implementations such as an initial R implementation compared with results from a C/C++ implementation.

- G5.5 Correctness tests should be run with a fixed random seed

- G5.6 *Parameter recovery tests** *to test that the implementation produce expected results given data with known properties. For instance, a linear regression algorithm should return expected coefficient values for a simulated data set generated from a linear model.

- G5.6a Parameter recovery tests should generally be expected to succeed within a defined tolerance rather than recovering exact values.

- G5.7 *Algorithm performance tests** *to test that implementation performs as expected as properties of data change. For instance, a test may show that parameters approach correct estimates within tolerance as data size increases, or that convergence times decrease for higher convergence thresholds.

Standards on line#82 of file [tests/testthat/test_conjugate.R](https://github.com/n-kall/priorsense,/blob/main/tests/testthat/test_conjugate.R#L82):

- G5.6b Parameter recovery tests should be run with multiple random seeds when either data simulation or the algorithm contains a random component. (When long-running, such tests may be part of an extended, rather than regular, test suite; see G5.10-4.12, below).* 

- G5.9 *Noise susceptibility tests** *Packages should test for expected stochastic behaviour, such as through the following conditions:

- G5.9b Running under different random seeds or initial conditions does not meaningfully change results* 

Standards on line#38 of file [tests/testthat/test_deriv.R](https://github.com/n-kall/priorsense,/blob/main/tests/testthat/test_deriv.R#L38):

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

Standards on line#114 of file [tests/testthat/test_plots.R](https://github.com/n-kall/priorsense,/blob/main/tests/testthat/test_plots.R#L114):

- EA6.1 The properties of graphical output from EDA software should be explicitly tested, for example via the [`vdiffr` package](https://github.com/r-lib/vdiffr) or equivalent.* 

Standards on line#3 of file [tests/testthat/test_powerscale.R](https://github.com/n-kall/priorsense,/blob/main/tests/testthat/test_powerscale.R#L3):

- EA6.0 Return values from all functions should be tested, including tests for the following characteristics:

Standards on line#6 of file [tests/testthat/test_powerscale.R](https://github.com/n-kall/priorsense,/blob/main/tests/testthat/test_powerscale.R#L6):

- EA4.0 EDA Software should ensure all return results have types which are consistent with input types.* 

Standards on line#18 of file [tests/testthat/test_powerscale.R](https://github.com/n-kall/priorsense,/blob/main/tests/testthat/test_powerscale.R#L18):

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

- EA4.0 EDA Software should ensure all return results have types which are consistent with input types.* 

Standards on line#46 of file [tests/testthat/test_powerscale.R](https://github.com/n-kall/priorsense,/blob/main/tests/testthat/test_powerscale.R#L46):

- EA4.0 EDA Software should ensure all return results have types which are consistent with input types.* 

Standards on line#60 of file [tests/testthat/test_powerscale.R](https://github.com/n-kall/priorsense,/blob/main/tests/testthat/test_powerscale.R#L60):

- EA6.0a Classes and types of objects

- EA6.0b Dimensions of tabular objects

- EA6.0c Column names (or equivalent) of tabular objects

- EA6.0d Classes or types of all columns contained within `data.frame`-type tabular objects 

Standards on line#205 of file [tests/testthat/test_powerscale.R](https://github.com/n-kall/priorsense,/blob/main/tests/testthat/test_powerscale.R#L205):

- G5.9a Adding trivial noise (for example, at the scale of `.Machine$double.eps`) to data does not meaningfully change results

Standards on line#219 of file [tests/testthat/test_powerscale.R](https://github.com/n-kall/priorsense,/blob/main/tests/testthat/test_powerscale.R#L219):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8d Data outside the scope of the algorithm (for example, data with more fields (columns) than observations (rows) for some regression algorithms)

Standards on line#227 of file [tests/testthat/test_powerscale.R](https://github.com/n-kall/priorsense,/blob/main/tests/testthat/test_powerscale.R#L227):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8a Zero-length data

Standards on line#239 of file [tests/testthat/test_powerscale.R](https://github.com/n-kall/priorsense,/blob/main/tests/testthat/test_powerscale.R#L239):

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.8b Data of unsupported types (e.g., character or complex numbers in for functions designed only for numeric data)

Standards on line#269 of file [tests/testthat/test_powerscale.R](https://github.com/n-kall/priorsense,/blob/main/tests/testthat/test_powerscale.R#L269):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8c Data with all-`NA` fields or columns or all identical fields or columns

Standards on line#3 of file [tests/testthat/test_rstan.R](https://github.com/n-kall/priorsense,/blob/main/tests/testthat/test_rstan.R#L3):

- G5.0 Where applicable or practicable, tests should use standard data sets with known properties (for example, the [NIST Standard Reference Datasets](https://www.itl.nist.gov/div898/strd/), or data sets provided by other widely-used R packages).



---



## Standards with `srrstatsNA` tag



**Numbers of standards:**

-  EA :  3  /  34

-  G :  18  /  68

- Total : 21 / 102





### R directory



Standards on line#57 of file [R/srr-stats-standards.R](https://github.com/n-kall/priorsense,/blob/main/R/srr-stats-standards.R#L57):

- G1.5 Software should include all code necessary to reproduce results which form the basis of performance claims made in associated publications.* 

- G1.6 Software should include code necessary to compare performance claims with alternative implementations in other R packages.* 

- G2.11 Software should ensure that `data.frame`-like tabular objects which have columns which do not themselves have standard class attributes (typically, `vector`) are appropriately processed, and do not error without reason. This behaviour should be tested. Again, columns created by the [`units` package](https://github.com/r-quantities/units/) provide a good test case.

- G2.12 Software should ensure that `data.frame`-like tabular objects which have list columns should ensure that those columns are appropriately pre-processed either through being removed, converted to equivalent vector columns where appropriate, or some other appropriate treatment such as an informative error. This behaviour should be tested.* 

- G2.14b ignore missing data with default warnings or messages issued

- G2.14c replace missing data with appropriately imputed values

- G2.4a explicit conversion to `integer` via `as.integer()`

- G2.4d explicit conversion to factor via `as.factor()`

- G2.5 Where inputs are expected to be of `factor` type, secondary documentation should explicitly state whether these should be `ordered` or not, and those inputs should provide appropriate error or other routines to ensure inputs follow these expectations.* 

- G2.9 Software should issue diagnostic messages for type conversion in which information is lost (such as conversion of variables from factor to character; standardisation of variable names; or removal of meta-data such as those associated with [`sf`-format](https://r-spatial.github.io/sf/) data) or added (such as insertion of variable or column names where none were provided).* 

- G4.0 Statistical Software which enables outputs to be written to local files should parse parameters specifying file names to ensure appropriate file suffices are automatically generated where not provided.* 

- G5.10 Extended tests should included and run under a common framework with other tests but be switched on by flags such as as a `<MYPKG>_EXTENDED_TESTS="true"` environment variable.* - The extended tests can be then run automatically by GitHub Actions for example by adding the following to the `env` section of the workflow: 

- G5.11 Where extended tests require large data sets or other assets, these should be provided for downloading and fetched as part of the testing workflow.

- G5.11a When any downloads of additional data necessary for extended tests fail, the tests themselves should not fail, rather be skipped and implicitly succeed with an appropriate diagnostic message.

- G5.12 Any conditions necessary to run extended tests such as platform requirements, memory, expected runtime, and artefacts produced that may need manual inspection, should be described in developer documentation such as a `CONTRIBUTING.md` or `tests/README.md` file.

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

- G5.4c Where applicable, stored values may be drawn from published paper outputs when applicable and where code from original implementations is not available

- EA5.1 Any explicit specifications of typefaces which override default values provided through other packages (including the `graphics` package) should consider accessibility* 

- EA5.5 All visualisations should include units on all axes where such are specified or otherwise obtainable from input data or other routines.* 

- EA5.6 Any packages which internally bundle libraries used for dynamic visualization and which are also bundled in other, pre-existing R packages, should explain the necessity and advantage of re-bundling that library.* 

- EA5.6 Any packages which internally bundle libraries used for dynamic visualization and which are also bundled in other, pre-existing R packages, should explain the necessity and advantage of re-bundling that library.* 



---



