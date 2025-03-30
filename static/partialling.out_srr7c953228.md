# srr report for [partialling.out](https://marcboschmatas.github.io/partialling.out/)



[Click here for full text of all standards](https://stats-devguide.ropensci.org/standards.html)







## Missing Standards



The following standards are missing:



General standards:



G2.2, G2.3, G2.3a, G2.3b, G2.4, G2.4a, G2.4b, G2.4c, G2.4d, G2.4e, G2.5, G2.6, G2.7, G2.8, G2.9, G2.10, G2.11, G2.12, G2.13, G2.14b, G2.14c, G3.1, G3.1a, G4.0, G5.4a, G5.4b, G5.4c, G5.10, G5.11, G5.11a, G5.12





Eda standards:



EA2.0, EA2.1, EA2.2, EA2.2a, EA2.2b, EA2.3, EA2.4, EA2.5, EA5.3, EA5.4, EA5.5, EA5.6, EA6.0e, EA6.1



## Standards with `srrstats` tag



**Numbers of standards:**

-  EA :  20  /  20

-  G :  37  /  37

- Total : 57 / 57





### R directory



Standards on line#70 of file [R/srr-stats-standards.R](https://marcboschmatas.github.io/partialling.out//blob/main/R/srr-stats-standards.R#L70):

- G1.0 Statistical Software should list at least one primary reference from published academic literature.* 

- G1.1 Statistical Software should document whether the algorithm(s) it implements are:* - *The first implementation of a novel algorithm*; or - *The first implementation within **R** of an algorithm which has previously been implemented in other languages or contexts*; or - *An improvement on other implementations of similar algorithms in **R***. 

- G1.2 Statistical Software should include a* Life Cycle Statement *describing current and anticipated future states of development.* 

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

- G1.5 Software should include all code necessary to reproduce results which form the basis of performance claims made in associated publications.* 

- G1.6 Software should include code necessary to compare performance claims with alternative implementations in other R packages.* 

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.14a error on missing data

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G3.0 Statistical software should never compare floating point numbers for equality. All numeric equality comparisons should either ensure that they are made between integers, or use appropriate tolerances for approximate equality.* 

- G5.0 Where applicable or practicable, tests should use standard data sets with known properties (for example, the [NIST Standard Reference Datasets](https://www.itl.nist.gov/div898/strd/), or data sets provided by other widely-used R packages).

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.5 Correctness tests should be run with a fixed random seed

- G5.6 *Parameter recovery tests** *to test that the implementation produce expected results given data with known properties. For instance, a linear regression algorithm should return expected coefficient values for a simulated data set generated from a linear model.

- G5.6a Parameter recovery tests should generally be expected to succeed within a defined tolerance rather than recovering exact values.

- G5.6b Parameter recovery tests should be run with multiple random seeds when either data simulation or the algorithm contains a random component. (When long-running, such tests may be part of an extended, rather than regular, test suite; see G5.10-4.12, below).* 

- G5.7 *Algorithm performance tests** *to test that implementation performs as expected as properties of data change. For instance, a test may show that parameters approach correct estimates within tolerance as data size increases, or that convergence times decrease for higher convergence thresholds.

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8a Zero-length data

- G5.8b Data of unsupported types (e.g., character or complex numbers in for functions designed only for numeric data)

- G5.8c Data with all-`NA` fields or columns or all identical fields or columns

- G5.8d Data outside the scope of the algorithm (for example, data with more fields (columns) than observations (rows) for some regression algorithms)

- G5.9 *Noise susceptibility tests** *Packages should test for expected stochastic behaviour, such as through the following conditions:

- G5.9a Adding trivial noise (for example, at the scale of `.Machine$double.eps`) to data does not meaningfully change results

- G5.9b Running under different random seeds or initial conditions does not meaningfully change results* 

- EA1.0 Identify one or more target audiences for whom the software is intended

- EA1.1 Identify the kinds of data the software is capable of analysing (see *Kinds of Data* below).

- EA1.2 Identify the kinds of questions the software is intended to help explore.* 

- EA1.3 Identify the kinds of data each function is intended to accept as input* 

- EA2.6 Routines should appropriately process vector data regardless of additional attributes* 

- EA3.0 The algorithmic components of EDA Software should enable automated extraction and/or reporting of statistics as some sufficiently "meta" level (such as variable or model selection), for which previous or reference implementations require manual intervention.

- EA3.1 EDA software should enable standardised comparison of inputs, processes, models, or outputs which previous or reference implementations otherwise only enable in some comparably unstandardised form.* 

- EA4.0 EDA Software should ensure all return results have types which are consistent with input types.* 

- EA4.1 EDA Software should implement parameters to enable explicit control of numeric precision

- EA4.2 The primary routines of EDA Software should return objects for which default `print` and `plot` methods give sensible results. Default `summary` methods may also be implemented.* 

- EA5.0 Graphical presentation in EDA software should be as accessible as possible or practicable. In particular, EDA software should consider accessibility in terms of:

- EA5.0a Typeface sizes, which should default to sizes which explicitly enhance accessibility

- EA5.0b Default colour schemes, which should be carefully constructed to ensure accessibility.

- EA5.1 Any explicit specifications of typefaces which override default values provided through other packages (including the `graphics` package) should consider accessibility* 

- EA5.2 Screen-based output should never rely on default print formatting of `numeric` types, rather should also use some version of `round(., digits)`, `formatC`, `sprintf`, or similar functions for numeric formatting according the parameter described in* **EA4.1**.

- EA6.0 Return values from all functions should be tested, including tests for the following characteristics:

- EA6.0a Classes and types of objects

- EA6.0b Dimensions of tabular objects

- EA6.0c Column names (or equivalent) of tabular objects

- EA6.0d Classes or types of all columns contained within `data.frame`-type tabular objects 



---



