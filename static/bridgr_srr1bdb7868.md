# srr report for [bridgr](https://github.com/marcburri/bridgr)



[Click here for full text of all standards](https://stats-devguide.ropensci.org/standards.html)







## Standards with `srrstats` tag



**Numbers of standards:**

-  G :  50  /  68

-  RE :  37  /  48

-  TS :  37  /  55

- Total : 124 / 171





### R directory



Standards on line#30 of file [R/pkgcheck/bridgr/R/accessors.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/accessors.R#L30):

- RE4.2 Model coefficients (via `coef()` / `coefficients()`)

Standards on line#40 of file [R/pkgcheck/bridgr/R/accessors.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/accessors.R#L40):

- RE4.3 Confidence intervals on those coefficients (via `confint()`)

Standards on line#80 of file [R/pkgcheck/bridgr/R/accessors.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/accessors.R#L80):

- RE4.4 The specification of the model, generally as a formula (via `formula()`)

Standards on line#88 of file [R/pkgcheck/bridgr/R/accessors.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/accessors.R#L88):

- RE4.5 Numbers of observations submitted to model (via `nobs()`)

Standards on line#96 of file [R/pkgcheck/bridgr/R/accessors.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/accessors.R#L96):

- RE4.6 The variance-covariance matrix of the model parameters (via `vcov()`)

Standards on line#110 of file [R/pkgcheck/bridgr/R/accessors.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/accessors.R#L110):

- RE4.9 Modelled values of response variables.

Standards on line#121 of file [R/pkgcheck/bridgr/R/accessors.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/accessors.R#L121):

- RE4.10 Model Residuals, including sufficient documentation to enable interpretation of residuals, and to enable users to submit residuals to their own tests.

Standards on line#130 of file [R/pkgcheck/bridgr/R/accessors.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/accessors.R#L130):

- RE4.17 Model objects returned by Regression Software should implement or appropriately extend a default `print` method which provides an on-screen summary of model (input) parameters and (output) coefficients.

Standards on line#259 of file [R/pkgcheck/bridgr/R/bridge.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/bridge.R#L259):

- G1.0 Statistical Software should list at least one primary reference from published academic literature.* 

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G3.1 Statistical software which relies on covariance calculations should enable users to choose between different algorithms for calculating covariances, and should not rely solely on covariances from the `stats::cov` function.

- RE1.0 Regression Software should enable models to be specified via a formula interface, unless reasons for not doing so are explicitly documented.

- RE1.2 Regression Software should document expected format (types or classes) for inputting predictor variables, including descriptions of types or classes which are not accepted.* 

- RE1.3a Where otherwise relevant information is not transferred, this should be explicitly documented.* 

- RE1.4 Regression Software should document any assumptions made with regard to input data; for example distributional assumptions, or assumptions that predictor data have mean values of zero. Implications of violations of these assumptions should be both documented and tested.* 

- RE2.0 Regression Software should document any transformations applied to input data, for example conversion of label-values to `factor`, and should provide ways to explicitly avoid any default transformations (with error or warning conditions where appropriate).

- RE2.1 Regression Software should implement explicit parameters controlling the processing of missing values, ideally distinguishing `NA` or `NaN` values from `Inf` values (for example, through use of `na.omit()` and related functions from the `stats` package).* 

- RE3.1 Enable such messages to be optionally suppressed, yet should ensure that the resultant model object nevertheless includes sufficient data to identify lack of convergence.

- RE3.2 Ensure that convergence thresholds have sensible default values, demonstrated through explicit documentation.

- RE3.3 Allow explicit setting of convergence thresholds, unless reasons against doing so are explicitly documented.* 

- RE4.0 Regression Software should return some form of "model" object, generally through using or modifying existing class structures for model objects (such as `lm`, `glm`, or model objects from other packages), or creating a new class of model objects.

- TS1.1 Time Series Software should explicitly document the types and classes of input data able to be passed to each function.* 

- TS1.8 Where time intervals or periods may be days or months, be explicit about the system used to represent such, particularly regarding whether a calendar system is used, or whether a year is presumed to have 365 days, 365.2422 days, or some other value.* 

- TS2.1 Where possible, all functions should provide options for users to specify how to handle missing data, with options minimally including:

- TS2.2 Consider stationarity of all relevant moments - typically first (mean) and second (variance) order, or otherwise document why such consideration may be restricted to lower orders only.

- TS2.3 Explicitly document all assumptions and/or requirements of stationarity

- TS2.4b enable or advise on appropriate transformations to ensure stationarity.* 

- TS4.0 Return values should either:

- TS4.0b Be in a unique, preferably class-defined, format.

- TS4.2 The type and class of all return values should be explicitly documented.* 

- TS4.3 Return values should explicitly include all appropriate units and/or time scales* 

- TS4.7b Returning distinct list items for model and forecast values

Standards on line#351 of file [R/pkgcheck/bridgr/R/bridge.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/bridge.R#L351):

- RE4.13 Predictor variables, and associated "metadata" where applicable.* 

- RE4.7 Where appropriate, convergence statistics* 

- RE4.8 Response variables, and associated "metadata" where applicable.

Standards on line#650 of file [R/pkgcheck/bridgr/R/bridge.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/bridge.R#L650):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

Standards on line#17 of file [R/pkgcheck/bridgr/R/bridgr-package.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/bridgr-package.R#L17):

- G1.1 Statistical Software should document whether the algorithm(s) it implements are:* - *The first implementation of a novel algorithm*; or - *The first implementation within **R** of an algorithm which has previously been implemented in other languages or contexts*; or - *An improvement on other implementations of similar algorithms in **R***. 

- G1.2 Statistical Software should include a* Life Cycle Statement *describing current and anticipated future states of development.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

Standards on line#52 of file [R/pkgcheck/bridgr/R/data-indicators.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/data-indicators.R#L52):

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

Standards on line#54 of file [R/pkgcheck/bridgr/R/forecast.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/forecast.R#L54):

- RE4.14 Where possible, values should also be provided for extrapolation or forecast *errors*.

- TS3.2 Document the general drivers of forecast errors or horizons, as demonstrated via the particular cases of TS3.0 and TS3.1

- TS3.3 Either:

- TS3.3a Document, preferable via an example, how to trim forecast values based on a specified error margin or equivalent; or

- TS4.2 The type and class of all return values should be explicitly documented.* 

- TS4.6 Time Series Software which implements or otherwise enables forecasting should return either:

- TS4.6b For each variable to be forecast, predicted values equivalent to first- and second-order moments (for example, mean and standard error values).

- TS4.6c Some more general indication of error associated with forecast estimates.* 

- TS4.7 Ensure that forecast (modelled) values are clearly distinguished from observed (model or input) values, either (in this case in no order of preference) by

- TS4.7a Returning forecast values alone

Standards on line#204 of file [R/pkgcheck/bridgr/R/plot.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/plot.R#L204):

- RE6.0 Model objects returned by Regression Software (see* **RE4***) should have default `plot` methods, either through explicit implementation, extension of methods for existing model objects, or through ensuring default methods work appropriately.

- RE6.1 Where the default `plot` method is **NOT** a generic `plot` method dispatched on the class of return objects (that is, through an S3-type `plot.<myclass>` function or equivalent), that method dispatch (or equivalent) should nevertheless exist in order to explicitly direct users to the appropriate function.

- RE6.2 The default `plot` method should produce a plot of the `fitted` values of the model, with optional visualisation of confidence intervals or equivalent.* 

- RE6.3 Where a model object is used to generate a forecast (for example, through a `predict()` method), the default `plot` method should provide clear visual distinction between modelled (interpolated) and forecast (extrapolated) values.* 

- TS5.0 Implement default `plot` methods for any implemented class system.

- TS5.1 When representing results in temporal domain(s), ensure that one axis is clearly labelled "time" (or equivalent), with continuous units.

- TS5.2 Default to placing the "time" (or equivalent) variable on the horizontal axis.

- TS5.3 Ensure that units of the time, frequency, or index variable are printed by default on the axis.

- TS5.6 By default indicate distributional limits of forecast on plot

- TS5.7 By default include model (input) values in plot, as well as forecast (output) values

- TS5.8 By default provide clear visual distinction between model (input) values and forecast (output) values.

Standards on line#25 of file [R/pkgcheck/bridgr/R/summary.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/summary.R#L25):

- RE4.11 Goodness-of-fit and other statistics associated such as effect sizes with model coefficients.

- RE4.18 Regression Software may also implement `summary` methods for model objects, and in particular should implement distinct `summary` methods for any cases in which calculation of summary statistics is computationally non-trivial (for example, for bootstrapped estimates of confidence intervals).* 

Standards on line#203 of file [R/pkgcheck/bridgr/R/utils.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/utils.R#L203):

- G2.14b ignore missing data with default warnings or messages issued

- G2.14c replace missing data with appropriately imputed values

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- TS2.1b warn or ignore missing data, and proceed to analyse irregular data, ensuring that results from function calls with regular yet missing data return identical values to submitting equivalent irregular data with no missing values; or

- TS2.1c replace missing data with appropriately imputed values.* 

Standards on line#321 of file [R/pkgcheck/bridgr/R/utils.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/utils.R#L321):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- G2.12 Software should ensure that `data.frame`-like tabular objects which have list columns should ensure that those columns are appropriately pre-processed either through being removed, converted to equivalent vector columns where appropriate, or some other appropriate treatment such as an informative error. This behaviour should be tested.* 

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.4c explicit conversion to character via `as.character()` (and not `paste` or `paste0`)

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- TS1.0 Time Series Software should use and rely on explicit class systems developed for representing time series data, and should not permit generic, non-time-series input* 

- TS1.2 Time Series Software should implement validation routines to confirm that inputs are of acceptable classes (or represented in otherwise appropriate ways for software which does not use class systems).

- TS1.3 Time Series Software should implement a single pre-processing routine to validate input data, and to appropriately transform it to a single uniform type to be passed to all subsequent data-processing functions (the [`tsbox` package](https://www.tsbox.help/) provides one convenient approach for this).

- TS1.5 The software should ensure strict ordering of the time, frequency, or equivalent ordering index variable.

- TS1.6 Any violations of ordering should be caught in the pre-processing stages of all functions.* 

Standards on line#490 of file [R/pkgcheck/bridgr/R/utils.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/utils.R#L490):

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.14a error on missing data

- TS2.1a error on missing data; or.

Standards on line#577 of file [R/pkgcheck/bridgr/R/utils.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/utils.R#L577):

- TS2.4 Implement appropriate checks for all relevant forms of stationarity, and either:

- TS2.4a issue diagnostic messages or warnings; or

Standards on line#751 of file [R/pkgcheck/bridgr/R/utils.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/utils.R#L751):

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

Standards on line#796 of file [R/pkgcheck/bridgr/R/utils.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/utils.R#L796):

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

Standards on line#912 of file [R/pkgcheck/bridgr/R/utils.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/utils.R#L912):

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.4a explicit conversion to `integer` via `as.integer()`

Standards on line#1243 of file [R/pkgcheck/bridgr/R/utils.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/utils.R#L1243):

- RE2.4 Regression Software should implement pre-processing routines to identify whether aspects of input data are perfectly collinear, notably including:

Standards on line#1283 of file [R/pkgcheck/bridgr/R/utils.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/utils.R#L1283):

- RE2.4a Perfect collinearity among predictor variables

Standards on line#1328 of file [R/pkgcheck/bridgr/R/utils.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/utils.R#L1328):

- RE2.4b Perfect collinearity between independent and dependent variables* 

Standards on line#2750 of file [R/pkgcheck/bridgr/R/utils.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/utils.R#L2750):

- RE3.0 Issue appropriate warnings or other diagnostic messages for models which fail to converge.



### tests directory



Standards on line#4 of file [tests/testthat/test-accessors.R](https://github.com/marcburri/bridgr/blob/main/tests/testthat/test-accessors.R#L4):

- RE7.3 Demonstrate and test expected behaviour when objects returned from regression software are submitted to the accessor methods of **RE4.2**--**RE4.7**.

Standards on line#24 of file [tests/testthat/test-bridge.R](https://github.com/marcburri/bridgr/blob/main/tests/testthat/test-bridge.R#L24):

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.5 Correctness tests should be run with a fixed random seed

- G5.6b Parameter recovery tests should be run with multiple random seeds when either data simulation or the algorithm contains a random component. (When long-running, such tests may be part of an extended, rather than regular, test suite; see G5.10-4.12, below).* 

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8a Zero-length data

- G5.8b Data of unsupported types (e.g., character or complex numbers in for functions designed only for numeric data)

- G5.8c Data with all-`NA` fields or columns or all identical fields or columns

- G5.8d Data outside the scope of the algorithm (for example, data with more fields (columns) than observations (rows) for some regression algorithms)

- G5.9b Running under different random seeds or initial conditions does not meaningfully change results* 

Standards on line#6 of file [tests/testthat/test-extended-bootstrap.R](https://github.com/marcburri/bridgr/blob/main/tests/testthat/test-extended-bootstrap.R#L6):

- G5.10 Extended tests should included and run under a common framework with other tests but be switched on by flags such as as a `<MYPKG>_EXTENDED_TESTS="true"` environment variable.* - The extended tests can be then run automatically by GitHub Actions for example by adding the following to the `env` section of the workflow: 

- G5.12 Any conditions necessary to run extended tests such as platform requirements, memory, expected runtime, and artefacts produced that may need manual inspection, should be described in developer documentation such as a `CONTRIBUTING.md` or `tests/README.md` file.

Standards on line#8 of file [tests/testthat/test-forecast-horizon-uncertainty.R](https://github.com/marcburri/bridgr/blob/main/tests/testthat/test-forecast-horizon-uncertainty.R#L8):

- RE4.15 Sufficient documentation and/or testing should be provided to demonstrate that forecast errors, confidence intervals, or equivalent values increase with forecast horizons.* 

- RE7.4 Extending directly from **RE4.15**, where appropriate, tests should demonstrate and confirm that forecast errors, confidence intervals, or equivalent values increase with forecast horizons.

- TS3.0 Provide tests to demonstrate at least one case in which errors widen appropriately with forecast horizon.

Standards on line#19 of file [tests/testthat/test-method-behaviors.R](https://github.com/marcburri/bridgr/blob/main/tests/testthat/test-method-behaviors.R#L19):

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4a For new methods, it can be difficult to separate out correctness of the method from the correctness of the implementation, as there may not be reference for comparison. In this case, testing may be implemented against simple, trivial cases or against multiple implementations such as an initial R implementation compared with results from a C/C++ implementation.

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

- G5.6 *Parameter recovery tests** *to test that the implementation produce expected results given data with known properties. For instance, a linear regression algorithm should return expected coefficient values for a simulated data set generated from a linear model.

- G5.6a Parameter recovery tests should generally be expected to succeed within a defined tolerance rather than recovering exact values.

- RE7.0 Tests with noiseless, exact relationships between predictor (independent) data.

- RE7.1 Tests with noiseless, exact relationships between predictor (independent) and response (dependent) data.

Standards on line#4 of file [tests/testthat/test-return-values.R](https://github.com/marcburri/bridgr/blob/main/tests/testthat/test-return-values.R#L4):

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 



---



## Standards with `srrstatsNA` tag



**Numbers of standards:**

-  G :  18  /  68

-  RE :  11  /  48

-  TS :  18  /  55

- Total : 47 / 171





### R directory



Standards on line#70 of file [R/pkgcheck/bridgr/R/srr-stats-standards.R](https://github.com/marcburri/bridgr/blob/main/R/pkgcheck/bridgr/R/srr-stats-standards.R#L70):

- G1.5 Software should include all code necessary to reproduce results which form the basis of performance claims made in associated publications.* 

- G1.6 Software should include code necessary to compare performance claims with alternative implementations in other R packages.* 

- G2.11 Software should ensure that `data.frame`-like tabular objects which have columns which do not themselves have standard class attributes (typically, `vector`) are appropriately processed, and do not error without reason. This behaviour should be tested. Again, columns created by the [`units` package](https://github.com/r-quantities/units/) provide a good test case.

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.4d explicit conversion to factor via `as.factor()`

- G2.4e explicit conversion from factor via `as...()` functions

- G2.5 Where inputs are expected to be of `factor` type, secondary documentation should explicitly state whether these should be `ordered` or not, and those inputs should provide appropriate error or other routines to ensure inputs follow these expectations.* 

- G2.9 Software should issue diagnostic messages for type conversion in which information is lost (such as conversion of variables from factor to character; standardisation of variable names; or removal of meta-data such as those associated with [`sf`-format](https://r-spatial.github.io/sf/) data) or added (such as insertion of variable or column names where none were provided).* 

- G3.0 Statistical software should never compare floating point numbers for equality. All numeric equality comparisons should either ensure that they are made between integers, or use appropriate tolerances for approximate equality.* 

- G3.1a The ability to use arbitrarily specified covariance methods should be documented (typically in examples or vignettes).* 

- G4.0 Statistical Software which enables outputs to be written to local files should parse parameters specifying file names to ensure appropriate file suffixes are automatically generated where not provided.* 

- G5.0 Where applicable or practicable, tests should use standard data sets with known properties (for example, the [NIST Standard Reference Datasets](https://www.itl.nist.gov/div898/strd/), or data sets provided by other widely-used R packages).

- G5.11 Where extended tests require large data sets or other assets, these should be provided for downloading and fetched as part of the testing workflow.

- G5.11a When any downloads of additional data necessary for extended tests fail, the tests themselves should not fail, rather be skipped and implicitly succeed with an appropriate diagnostic message.

- G5.4c Where applicable, stored values may be drawn from published paper outputs when applicable and where code from original implementations is not available

- G5.7 *Algorithm performance tests** *to test that implementation performs as expected as properties of data change. For instance, a test may show that parameters approach correct estimates within tolerance as data size increases, or that convergence times decrease for higher convergence thresholds.

- G5.9 *Noise susceptibility tests** *Packages should test for expected stochastic behaviour, such as through the following conditions:

- G5.9a Adding trivial noise (for example, at the scale of `.Machine$double.eps`) to data does not meaningfully change results

- RE1.1 Regression Software should document how formula interfaces are converted to matrix representations of input data.* 

- RE1.3 Regression Software which passes or otherwise transforms aspects of input data onto output structures should ensure that those output structures retain all relevant aspects of input data, notably including row and column names, and potentially information from other `attributes()`.

- RE2.2 Regression Software should provide different options for processing missing values in predictor and response data. For example, it should be possible to fit a model with no missing predictor data in order to generate values for all associated response points, even where submitted response values may be missing.

- RE2.3 Where applicable, Regression Software should enable data to be centred (for example, through converting to zero-mean equivalent values; or to z-scores) or offset (for example, to zero-intercept equivalent values) via additional parameters, with the effects of any such parameters clearly documented and tested.

- RE4.1 Regression Software may enable an ability to generate a model object without actually fitting values. This may be useful for controlling batch processing of computationally intensive fitting algorithms.* 

- RE4.12 Where appropriate, functions used to transform input data, and associated inverse transform functions.* 

- RE4.16 Regression Software which models distinct responses for different categorical groups should include the ability to submit new groups to `predict()` methods.* 

- RE5.0 Scaling relationships between sizes of input data (numbers of observations, with potential extension to numbers of variables/columns) and speed of algorithm.* 

- RE7.0a In particular, these tests should confirm ability to reject perfectly noiseless input data.

- RE7.1a In particular, these tests should confirm that model fitting is at least as fast or (preferably) faster than testing with equivalent noisy data (see RE2.4b).* 

- RE7.2 Demonstrate that output objects retain aspects of input data such as row or case names (see **RE1.3**).

- TS1.4 The pre-processing function described above should maintain all time- or date-based components or attributes of input data.* 

- TS1.7 Accept inputs defined via the [`units` package](https://github.com/r-quantities/units/) for attributing SI units to R vectors.

- TS2.0 Time Series Software which presumes or requires regular data should only allow **explicit** missing values, and should issue appropriate diagnostic messages, potentially including errors, in response to any **implicit** missing values.

- TS2.5 Incorporate a system to ensure that both row and column orders follow the same ordering as the underlying time series data. This may, for example, be done by including the `index` attribute of the time series data as an attribute of the auto-covariance matrix.

- TS2.6 Where applicable, auto-covariance matrices should also include specification of appropriate units.* 

- TS3.1 If possible, provide at least one test which violates TS3.0

- TS3.3b Provide an explicit mechanism to trim forecast values to a specified error margin, either via an explicit post-processing function, or via an input parameter to a primary analytic function.* 

- TS4.0a Be in same class as input data, for example by using the [`tsbox` package](https://www.tsbox.help/) to re-convert from standard internal format (see 1.4, above); or

- TS4.1 Any units included as attributes of input data should also be included within return values.

- TS4.4 Document the effect of any such transformations on forecast data, including potential effects on both first- and second-order estimates.

- TS4.5 In decreasing order of preference, either:

- TS4.5a Provide explicit routines or options to back-transform data commensurate with original, non-stationary input data

- TS4.5b Demonstrate how data may be back-transformed to a form commensurate with original, non-stationary input data.

- TS4.5c Document associated limitations on forecast values* 

- TS4.6a A distribution object, for example via one of the many packages described in the CRAN Task View on [Probability Distributions](https://cran.r-project.org/web/views/Distributions.html) (or the new [`distributional` package](https://pkg.mitchelloharawild.com/distributional/) as used in the [`fable` package](https://fable.tidyverts.org) for time-series forecasting).

- TS4.7c Combining model and forecast values into a single return object with an appropriate additional column clearly distinguishing the two kinds of data.* 

- TS5.4 For frequency visualization, abscissa spanning $[-\pi, \pi]$ should be avoided in favour of positive units of $[0, 2\pi]$ or $[0, 0.5]$, in all cases with appropriate additional explanation of units.

- TS5.5 Provide options to determine whether plots of data with missing values should generate continuous or broken lines.* 



---



