# srr report for [coevolve](https://github.com/ScottClaessens/coevolve)



[Click here for full text of all standards](https://stats-devguide.ropensci.org/standards.html)







## Standards with `srrstats` tag



**Numbers of standards:**

-  BS :  42  /  55

-  G :  58  /  69

- Total : 100 / 124





### R directory



Standards in function ' coev_calculate_delta_theta() 'on line#79 of file [R/coev_calculate_delta_theta.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_calculate_delta_theta.R#L79):

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.3 For univariate character input:

- G2.3 For univariate character input:

- G2.3 For univariate character input:

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

Standards in function ' coev_calculate_theta() 'on line#101 of file [R/coev_calculate_theta.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_calculate_theta.R#L101):

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

Standards in function ' coev_fit() 'on line#257 of file [R/coev_fit.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_fit.R#L257):

- G1.1 Statistical Software should document whether the algorithm(s) it implements are:* - *The first implementation of a novel algorithm*; or - *The first implementation within **R** of an algorithm which has previously been implemented in other languages or contexts*; or - *An improvement on other implementations of similar algorithms in **R***. 

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.3 For univariate character input:

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G2.5 Where inputs are expected to be of `factor` type, secondary documentation should explicitly state whether these should be `ordered` or not, and those inputs should provide appropriate error or other routines to ensure inputs follow these expectations.* 

- G3.1 Statistical software which relies on covariance calculations should enable users to choose between different algorithms for calculating covariances, and should not rely solely on covariances from the `stats::cov` function.

- G3.1a The ability to use arbitrarily specified covariance methods should be documented (typically in examples or vignettes).* 

- BS1.1 Descriptions of how to enter data, both in textual form and via code examples. Both of these should consider the simplest cases of single objects representing independent and dependent data, and potentially more complicated cases of multiple independent data inputs.

- BS1.2 Description of how to specify prior distributions, both in textual form describing the general principles of specifying prior distributions, along with more applied descriptions and examples, within:

- BS1.2c Function-level documentation, preferably with code included in examples* 

- BS1.3 Description of all parameters which control the computational process (typically those determining aspects such as numbers and lengths of sampling processes, seeds used to start them, thinning parameters determining post-hoc sampling from simulated values, and convergence criteria). In particular:

- BS1.3b Where applicable, Bayesian software should document, both in text and examples, how to use different sampling algorithms for a given model.

- BS2.1 Bayesian Software should implement pre-processing routines to ensure all input data is dimensionally commensurate, for example by ensuring commensurate lengths of vectors or numbers of rows of tabular inputs.

- BS2.12 Bayesian Software should implement at least one parameter controlling the verbosity of output, defaulting to verbose output of all appropriate messages, warnings, errors, and progress indicators.

- BS2.13 Bayesian Software should enable suppression of messages and progress indicators, while retaining verbosity of warnings and errors. This should be tested.

- BS2.14 Bayesian Software should enable suppression of warnings where appropriate. This should be tested.

- BS2.15 Bayesian Software should explicitly enable errors to be caught, and appropriately processed either through conversion to warnings, or otherwise captured in return values. This should be tested.* 

- BS2.6 Check that values for computational parameters lie within plausible ranges.* 

- BS2.7 Enable starting values to be explicitly controlled via one or more input parameters, including multiple values for software which implements or enables multiple computational "chains."

- BS2.9 Ensure each chain is started with a different seed by default.

- BS3.0 Explicitly document assumptions made in regard to missing values; for example that data is assumed to contain no missing (`NA`, `Inf`) values, and that such values, or entire rows including any such values, will be automatically removed from input data.* 

- BS4.0 Packages should document sampling algorithms (generally via literary citation, or reference to other software)

- BS5.0 Return values should include starting value(s) or seed(s), including values for each sequence where multiple sequences are included

- BS5.1 Return values should include appropriate metadata on types (or classes) and dimensions of input data* 

- BS5.2 Bayesian Software should either return the input function or prior distributional specification in the return object; or enable direct access to such via additional functions which accept the return object as single argument.* 

Standards in function ' run_checks_data() 'on line#12 of file [R/coev_helpers.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_helpers.R#L12):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8a Zero-length data

Standards in function ' run_checks_variables() 'on line#38 of file [R/coev_helpers.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_helpers.R#L38):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.11 Software should ensure that `data.frame`-like tabular objects which have columns which do not themselves have standard class attributes (typically, `vector`) are appropriately processed, and do not error without reason. This behaviour should be tested. Again, columns created by the [`units` package](https://github.com/r-quantities/units/) provide a good test case.

- G2.12 Software should ensure that `data.frame`-like tabular objects which have list columns should ensure that those columns are appropriately pre-processed either through being removed, converted to equivalent vector columns where appropriate, or some other appropriate treatment such as an informative error. This behaviour should be tested.* 

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.5 Where inputs are expected to be of `factor` type, secondary documentation should explicitly state whether these should be `ordered` or not, and those inputs should provide appropriate error or other routines to ensure inputs follow these expectations.* 

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

Standards in function ' run_checks_id() 'on line#190 of file [R/coev_helpers.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_helpers.R#L190):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

Standards in function ' run_checks_tree() 'on line#221 of file [R/coev_helpers.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_helpers.R#L221):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

Standards in function ' run_checks_effects_mat() 'on line#284 of file [R/coev_helpers.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_helpers.R#L284):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

Standards in function ' run_checks_dist_mat() 'on line#338 of file [R/coev_helpers.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_helpers.R#L338):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

Standards in function ' run_checks_dist_cov() 'on line#391 of file [R/coev_helpers.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_helpers.R#L391):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

Standards in function ' run_checks_measurement_error() 'on line#425 of file [R/coev_helpers.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_helpers.R#L425):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

Standards in function ' run_checks_prior() 'on line#502 of file [R/coev_helpers.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_helpers.R#L502):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

Standards in function ' run_checks() 'on line#546 of file [R/coev_helpers.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_helpers.R#L546):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

Standards in function ' stop2() 'on line#595 of file [R/coev_helpers.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_helpers.R#L595):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

Standards in function ' warning2() 'on line#609 of file [R/coev_helpers.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_helpers.R#L609):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

Standards in function ' coev_make_stancode() 'on line#218 of file [R/coev_make_stancode.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_make_stancode.R#L218):

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.3 For univariate character input:

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4c explicit conversion to character via `as.character()` (and not `paste` or `paste0`)

- G2.5 Where inputs are expected to be of `factor` type, secondary documentation should explicitly state whether these should be `ordered` or not, and those inputs should provide appropriate error or other routines to ensure inputs follow these expectations.* 

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- G3.1 Statistical software which relies on covariance calculations should enable users to choose between different algorithms for calculating covariances, and should not rely solely on covariances from the `stats::cov` function.

- G3.1a The ability to use arbitrarily specified covariance methods should be documented (typically in examples or vignettes).* 

- BS1.1 Descriptions of how to enter data, both in textual form and via code examples. Both of these should consider the simplest cases of single objects representing independent and dependent data, and potentially more complicated cases of multiple independent data inputs.

- BS1.2 Description of how to specify prior distributions, both in textual form describing the general principles of specifying prior distributions, along with more applied descriptions and examples, within:

- BS1.2c Function-level documentation, preferably with code included in examples* 

- BS2.1 Bayesian Software should implement pre-processing routines to ensure all input data is dimensionally commensurate, for example by ensuring commensurate lengths of vectors or numbers of rows of tabular inputs.

- BS2.2 Ensure that all appropriate validation and pre-processing of distributional parameters are implemented as distinct pre-processing steps prior to submitting to analytic routines, and especially prior to submitting to multiple parallel computational chains.

- BS2.3 Ensure that lengths of vectors of distributional parameters are checked, with no excess values silently discarded (unless such output is explicitly suppressed, as detailed below).

- BS2.4 Ensure that lengths of vectors of distributional parameters are commensurate with expected model input (see example immediately below)

- BS2.5 Where possible, implement pre-processing checks to validate appropriateness of numeric values submitted for distributional parameters; for example, by ensuring that distributional parameters defining second-order moments such as distributional variance or shape parameters, or any parameters which are logarithmically transformed, are non-negative.* 

- BS3.0 Explicitly document assumptions made in regard to missing values; for example that data is assumed to contain no missing (`NA`, `Inf`) values, and that such values, or entire rows including any such values, will be automatically removed from input data.* 

Standards in function ' write_functions_block() 'on line#342 of file [R/coev_make_stancode.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_make_stancode.R#L342):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

Standards in function ' write_data_block() 'on line#450 of file [R/coev_make_stancode.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_make_stancode.R#L450):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

Standards in function ' write_transformed_data_block() 'on line#497 of file [R/coev_make_stancode.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_make_stancode.R#L497):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

Standards in function ' write_parameters_block() 'on line#546 of file [R/coev_make_stancode.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_make_stancode.R#L546):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

Standards in function ' write_transformed_pars_block() 'on line#633 of file [R/coev_make_stancode.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_make_stancode.R#L633):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

Standards in function ' write_model_block() 'on line#790 of file [R/coev_make_stancode.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_make_stancode.R#L790):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

Standards in function ' write_gen_quantities_block() 'on line#1142 of file [R/coev_make_stancode.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_make_stancode.R#L1142):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

Standards in function ' coev_make_standata() 'on line#217 of file [R/coev_make_standata.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_make_standata.R#L217):

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.14b ignore missing data with default warnings or messages issued

- G2.14c replace missing data with appropriately imputed values

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.3 For univariate character input:

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.4e explicit conversion from factor via `as...()` functions

- G2.5 Where inputs are expected to be of `factor` type, secondary documentation should explicitly state whether these should be `ordered` or not, and those inputs should provide appropriate error or other routines to ensure inputs follow these expectations.* 

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- G3.1 Statistical software which relies on covariance calculations should enable users to choose between different algorithms for calculating covariances, and should not rely solely on covariances from the `stats::cov` function.

- G3.1a The ability to use arbitrarily specified covariance methods should be documented (typically in examples or vignettes).* 

- BS1.1 Descriptions of how to enter data, both in textual form and via code examples. Both of these should consider the simplest cases of single objects representing independent and dependent data, and potentially more complicated cases of multiple independent data inputs.

- BS1.2 Description of how to specify prior distributions, both in textual form describing the general principles of specifying prior distributions, along with more applied descriptions and examples, within:

- BS1.2c Function-level documentation, preferably with code included in examples* 

- BS2.1 Bayesian Software should implement pre-processing routines to ensure all input data is dimensionally commensurate, for example by ensuring commensurate lengths of vectors or numbers of rows of tabular inputs.

- BS3.0 Explicitly document assumptions made in regard to missing values; for example that data is assumed to contain no missing (`NA`, `Inf`) values, and that such values, or entire rows including any such values, will be automatically removed from input data.* 

Standards in function ' coev_plot_delta_theta() 'on line#73 of file [R/coev_plot_delta_theta.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_plot_delta_theta.R#L73):

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

Standards in function ' coev_plot_flowfield() 'on line#82 of file [R/coev_plot_flowfield.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_plot_flowfield.R#L82):

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.3 For univariate character input:

- G2.3 For univariate character input:

- G2.3 For univariate character input:

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

Standards in function ' coev_plot_pred_series() 'on line#59 of file [R/coev_plot_pred_series.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_plot_pred_series.R#L59):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

Standards in function ' coev_plot_predictive_check() 'on line#46 of file [R/coev_plot_predictive_check.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_plot_predictive_check.R#L46):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4a explicit conversion to `integer` via `as.integer()`

- G2.4a explicit conversion to `integer` via `as.integer()`

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

Standards in function ' coev_plot_selection_gradient() 'on line#82 of file [R/coev_plot_selection_gradient.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_plot_selection_gradient.R#L82):

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.3 For univariate character input:

- G2.3 For univariate character input:

- G2.3 For univariate character input:

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

Standards in function ' coev_plot_trait_values() 'on line#64 of file [R/coev_plot_trait_values.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_plot_trait_values.R#L64):

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

Standards in function ' run_checks_plot_trait_values() 'on line#287 of file [R/coev_plot_trait_values.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_plot_trait_values.R#L287):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4a explicit conversion to `integer` via `as.integer()`

- G2.4a explicit conversion to `integer` via `as.integer()`

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

Standards in function ' coev_pred_series() 'on line#87 of file [R/coev_pred_series.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_pred_series.R#L87):

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

Standards in function ' run_checks_pred_series() 'on line#261 of file [R/coev_pred_series.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_pred_series.R#L261):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4a explicit conversion to `integer` via `as.integer()`

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

Standards in function ' coev_simulate_coevolution() 'on line#96 of file [R/coev_simulate_coevolution.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_simulate_coevolution.R#L96):

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4a explicit conversion to `integer` via `as.integer()`

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.4b explicit conversion to continuous via `as.numeric()`

Standards in function ' run_checks_sim() 'on line#242 of file [R/coev_simulate_coevolution.R](https://github.com/ScottClaessens/coevolve/blob/main/R/coev_simulate_coevolution.R#L242):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

Standards on line#59 of file [R/data.R](https://github.com/ScottClaessens/coevolve/blob/main/R/data.R#L59):

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

Standards on line#122 of file [R/data.R](https://github.com/ScottClaessens/coevolve/blob/main/R/data.R#L122):

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

Standards on line#168 of file [R/data.R](https://github.com/ScottClaessens/coevolve/blob/main/R/data.R#L168):

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

Standards in function ' extract_samples() 'on line#31 of file [R/extract_samples.R](https://github.com/ScottClaessens/coevolve/blob/main/R/extract_samples.R#L31):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

Standards in function ' plot.coevfit() 'on line#51 of file [R/plot.R](https://github.com/ScottClaessens/coevolve/blob/main/R/plot.R#L51):

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.3 For univariate character input:

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- BS6.1 Software should implement a default `plot` method for return objects

- BS6.2 Software should provide and document straightforward abilities to plot sequences of posterior samples, with burn-in periods clearly distinguished

- BS6.3 Software should provide and document straightforward abilities to plot posterior distributional estimates* 

- BS6.5 Software may provide abilities to plot both sequences of posterior samples and distributional estimates together in single graphic* 

Standards in function ' save_coevfit() 'on line#38 of file [R/save_coevfit.R](https://github.com/ScottClaessens/coevolve/blob/main/R/save_coevfit.R#L38):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G4.0 Statistical Software which enables outputs to be written to local files should parse parameters specifying file names to ensure appropriate file suffices are automatically generated where not provided.* 

Standards in function ' stancode() 'on line#31 of file [R/stancode.R](https://github.com/ScottClaessens/coevolve/blob/main/R/stancode.R#L31):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

Standards in function ' standata() 'on line#32 of file [R/standata.R](https://github.com/ScottClaessens/coevolve/blob/main/R/standata.R#L32):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

Standards in function ' summary.coevfit() 'on line#51 of file [R/summary.R](https://github.com/ScottClaessens/coevolve/blob/main/R/summary.R#L51):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- BS4.3 Implement or otherwise offer at least one type of convergence checker, and provide a documented reference for that implementation.

- BS5.3 Bayesian Software should return convergence statistics or equivalent

- BS5.5 Appropriate diagnostic statistics to indicate absence of convergence should either be returned or immediately able to be accessed.* 

- BS6.4 Software may provide `summary` methods for return objects

Standards in function ' print.coevfit() 'on line#314 of file [R/summary.R](https://github.com/ScottClaessens/coevolve/blob/main/R/summary.R#L314):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- BS6.0 Software should implement a default `print` method for return objects

Standards in function ' print.coevsummary() 'on line#319 of file [R/summary.R](https://github.com/ScottClaessens/coevolve/blob/main/R/summary.R#L319):

- BS4.5 Ensure that appropriate mechanisms are provided for models which do not converge.* 

Standards in function ' print_format() 'on line#424 of file [R/summary.R](https://github.com/ScottClaessens/coevolve/blob/main/R/summary.R#L424):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.



### tests directory



Standards on line#1 of file [tests/testthat/test-coev_calculate_delta_theta.R](https://github.com/ScottClaessens/coevolve/blob/main/tests/testthat/test-coev_calculate_delta_theta.R#L1):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

Standards on line#1 of file [tests/testthat/test-coev_calculate_theta.R](https://github.com/ScottClaessens/coevolve/blob/main/tests/testthat/test-coev_calculate_theta.R#L1):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

Standards on line#1 of file [tests/testthat/test-coev_fit.R](https://github.com/ScottClaessens/coevolve/blob/main/tests/testthat/test-coev_fit.R#L1):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8a Zero-length data

- G5.8b Data of unsupported types (e.g., character or complex numbers in for functions designed only for numeric data)

- G5.8c Data with all-`NA` fields or columns or all identical fields or columns

- G5.8d Data outside the scope of the algorithm (for example, data with more fields (columns) than observations (rows) for some regression algorithms)

Standards on line#1 of file [tests/testthat/test-coev_make_stancode.R](https://github.com/ScottClaessens/coevolve/blob/main/tests/testthat/test-coev_make_stancode.R#L1):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8a Zero-length data

- G5.8b Data of unsupported types (e.g., character or complex numbers in for functions designed only for numeric data)

- G5.8c Data with all-`NA` fields or columns or all identical fields or columns

- G5.8d Data outside the scope of the algorithm (for example, data with more fields (columns) than observations (rows) for some regression algorithms)

Standards on line#1 of file [tests/testthat/test-coev_make_standata.R](https://github.com/ScottClaessens/coevolve/blob/main/tests/testthat/test-coev_make_standata.R#L1):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8a Zero-length data

- G5.8b Data of unsupported types (e.g., character or complex numbers in for functions designed only for numeric data)

- G5.8c Data with all-`NA` fields or columns or all identical fields or columns

- G5.8d Data outside the scope of the algorithm (for example, data with more fields (columns) than observations (rows) for some regression algorithms)

Standards on line#858 of file [tests/testthat/test-coev_make_standata.R](https://github.com/ScottClaessens/coevolve/blob/main/tests/testthat/test-coev_make_standata.R#L858):

- BS2.1a The effects of such routines should be tested.* 

Standards on line#1 of file [tests/testthat/test-coev_plot_delta_theta.R](https://github.com/ScottClaessens/coevolve/blob/main/tests/testthat/test-coev_plot_delta_theta.R#L1):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

Standards on line#1 of file [tests/testthat/test-coev_plot_flowfield.R](https://github.com/ScottClaessens/coevolve/blob/main/tests/testthat/test-coev_plot_flowfield.R#L1):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

Standards on line#1 of file [tests/testthat/test-coev_plot_pred_series.R](https://github.com/ScottClaessens/coevolve/blob/main/tests/testthat/test-coev_plot_pred_series.R#L1):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

Standards on line#1 of file [tests/testthat/test-coev_plot_predictive_check.R](https://github.com/ScottClaessens/coevolve/blob/main/tests/testthat/test-coev_plot_predictive_check.R#L1):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

Standards on line#1 of file [tests/testthat/test-coev_plot_selection_gradient.R](https://github.com/ScottClaessens/coevolve/blob/main/tests/testthat/test-coev_plot_selection_gradient.R#L1):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

Standards on line#1 of file [tests/testthat/test-coev_plot_trait_values.R](https://github.com/ScottClaessens/coevolve/blob/main/tests/testthat/test-coev_plot_trait_values.R#L1):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

Standards on line#1 of file [tests/testthat/test-coev_pred_series.R](https://github.com/ScottClaessens/coevolve/blob/main/tests/testthat/test-coev_pred_series.R#L1):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

Standards on line#1 of file [tests/testthat/test-coev_simulate_coevolution.R](https://github.com/ScottClaessens/coevolve/blob/main/tests/testthat/test-coev_simulate_coevolution.R#L1):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

Standards on line#182 of file [tests/testthat/test-coev_simulate_coevolution.R](https://github.com/ScottClaessens/coevolve/blob/main/tests/testthat/test-coev_simulate_coevolution.R#L182):

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

Standards on line#2 of file [tests/testthat/test-extended.R](https://github.com/ScottClaessens/coevolve/blob/main/tests/testthat/test-extended.R#L2):

- G5.10 Extended tests should included and run under a common framework with other tests but be switched on by flags such as as a `<MYPKG>_EXTENDED_TESTS="true"` environment variable.* - The extended tests can be then run automatically by GitHub Actions for example by adding the following to the `env` section of the workflow: 

Standards on line#5 of file [tests/testthat/test-extended.R](https://github.com/ScottClaessens/coevolve/blob/main/tests/testthat/test-extended.R#L5):

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4a For new methods, it can be difficult to separate out correctness of the method from the correctness of the implementation, as there may not be reference for comparison. In this case, testing may be implemented against simple, trivial cases or against multiple implementations such as an initial R implementation compared with results from a C/C++ implementation.

- G5.5 Correctness tests should be run with a fixed random seed

Standards on line#69 of file [tests/testthat/test-extended.R](https://github.com/ScottClaessens/coevolve/blob/main/tests/testthat/test-extended.R#L69):

- G5.6 *Parameter recovery tests** *to test that the implementation produce expected results given data with known properties. For instance, a linear regression algorithm should return expected coefficient values for a simulated data set generated from a linear model.

- G5.6a Parameter recovery tests should generally be expected to succeed within a defined tolerance rather than recovering exact values.

- G5.6b Parameter recovery tests should be run with multiple random seeds when either data simulation or the algorithm contains a random component. (When long-running, such tests may be part of an extended, rather than regular, test suite; see G5.10-4.12, below).* 

- G5.9 *Noise susceptibility tests** *Packages should test for expected stochastic behaviour, such as through the following conditions:

- G5.9a Adding trivial noise (for example, at the scale of `.Machine$double.eps`) to data does not meaningfully change results

- G5.9b Running under different random seeds or initial conditions does not meaningfully change results* 

- BS7.2 Software should demonstrate and confirm recovery of a expected posterior distribution given a specified prior and some input data* 

- BS7.4 Bayesian software should implement tests which confirm that predicted or fitted values are on (approximately) the same scale as input values.

- BS7.4a The implications of any assumptions on scales on input objects should be explicitly tested in this context; for example that the scales of inputs which do not have means of zero will not be able to be recovered.

Standards on line#176 of file [tests/testthat/test-extended.R](https://github.com/ScottClaessens/coevolve/blob/main/tests/testthat/test-extended.R#L176):

- G5.7 *Algorithm performance tests** *to test that implementation performs as expected as properties of data change. For instance, a test may show that parameters approach correct estimates within tolerance as data size increases, or that convergence times decrease for higher convergence thresholds.

- BS7.3 Bayesian software should include tests which demonstrate and confirm the scaling of algorithmic efficiency with sizes of input data.* 

Standards on line#252 of file [tests/testthat/test-extended.R](https://github.com/ScottClaessens/coevolve/blob/main/tests/testthat/test-extended.R#L252):

- BS7.0 Software should demonstrate and confirm recovery of parametric estimates of a prior distribution

- BS7.1 Software should demonstrate and confirm recovery of a prior distribution in the absence of any additional data or information

Standards on line#7 of file [tests/testthat.R](https://github.com/ScottClaessens/coevolve/blob/main/tests/testthat.R#L7):

- G3.0 Statistical software should never compare floating point numbers for equality. All numeric equality comparisons should either ensure that they are made between integers, or use appropriate tolerances for approximate equality.* 

- G5.12 Any conditions necessary to run extended tests such as platform requirements, memory, expected runtime, and artefacts produced that may need manual inspection, should be described in developer documentation such as a `CONTRIBUTING.md` or `tests/README.md` file.

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

- G5.5 Correctness tests should be run with a fixed random seed

- G5.6b Parameter recovery tests should be run with multiple random seeds when either data simulation or the algorithm contains a random component. (When long-running, such tests may be part of an extended, rather than regular, test suite; see G5.10-4.12, below).* 



### root directory



Standards on line#44 of file [./README.Rmd](https://github.com/ScottClaessens/coevolve/blob/main/./README.Rmd#L44):

- G1.0 Statistical Software should list at least one primary reference from published academic literature.* 

- G1.2 Statistical Software should include a* Life Cycle Statement *describing current and anticipated future states of development.* 

- BS1.2 Description of how to specify prior distributions, both in textual form describing the general principles of specifying prior distributions, along with more applied descriptions and examples, within:

- BS1.2a The main package `README`, either as textual description or example code* 

- BS1.4 For Bayesian Software which implements or otherwise enables convergence checkers, documentation should explicitly describe and provide examples of use with and without convergence checkers.

- BS4.3 Implement or otherwise offer at least one type of convergence checker, and provide a documented reference for that implementation.



### vignettes directory



Standards on line#23 of file [vignettes/coevolve.Rmd](https://github.com/ScottClaessens/coevolve/blob/main/vignettes/coevolve.Rmd#L23):

- BS1.2 Description of how to specify prior distributions, both in textual form describing the general principles of specifying prior distributions, along with more applied descriptions and examples, within:

- BS1.2b At least one package vignette, both as general and applied textual descriptions, and example code* 

- BS1.4 For Bayesian Software which implements or otherwise enables convergence checkers, documentation should explicitly describe and provide examples of use with and without convergence checkers.

- BS4.3 Implement or otherwise offer at least one type of convergence checker, and provide a documented reference for that implementation.



---



## Standards with `srrstatsNA` tag



**Numbers of standards:**

-  BS :  13  /  55

-  G :  11  /  69

- Total : 24 / 124





### R directory



Standards on line#46 of file [R/srr-stats-standards.R](https://github.com/ScottClaessens/coevolve/blob/main/R/srr-stats-standards.R#L46):

- G1.5 Software should include all code necessary to reproduce results which form the basis of performance claims made in associated publications.* 

- G1.6 Software should include code necessary to compare performance claims with alternative implementations in other R packages.* 

- G2.14a error on missing data

- G2.4d explicit conversion to factor via `as.factor()`

- G2.9 Software should issue diagnostic messages for type conversion in which information is lost (such as conversion of variables from factor to character; standardisation of variable names; or removal of meta-data such as those associated with [`sf`-format](https://r-spatial.github.io/sf/) data) or added (such as insertion of variable or column names where none were provided).* 

- G3.0 Statistical software should never compare floating point numbers for equality. All numeric equality comparisons should either ensure that they are made between integers, or use appropriate tolerances for approximate equality.* 

- G5.0 Where applicable or practicable, tests should use standard data sets with known properties (for example, the [NIST Standard Reference Datasets](https://www.itl.nist.gov/div898/strd/), or data sets provided by other widely-used R packages).

- G5.11 Where extended tests require large data sets or other assets, these should be provided for downloading and fetched as part of the testing workflow.

- G5.11a When any downloads of additional data necessary for extended tests fail, the tests themselves should not fail, rather be skipped and implicitly succeed with an appropriate diagnostic message.

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

- G5.4c Where applicable, stored values may be drawn from published paper outputs when applicable and where code from original implementations is not available

- BS1.0 Bayesian software which uses the term "hyperparameter" should explicitly clarify the meaning of that term in the context of that software.* 

- BS1.3a Bayesian Software should document, both in text and examples, how to use the output of previous simulations as starting points of subsequent simulations.* 

- BS1.5 For Bayesian Software which implements or otherwise enables multiple convergence checkers, differences between these should be explicitly tested.* 

- BS2.10 Issue diagnostic messages when identical seeds are passed to distinct computational chains.

- BS2.11 Software which accepts starting values as a vector should provide the parameter with a plural name: for example, "starting_values" and not "starting_value".* 

- BS2.8 Enable results of previous runs to be used as starting points for subsequent runs.* 

- BS3.1 Implement pre-processing routines to diagnose perfect collinearity, and provide appropriate diagnostic messages or warnings

- BS3.2 Provide distinct routines for processing perfectly collinear data, potentially bypassing sampling algorithms* 

- BS4.1 Packages should provide explicit comparisons with external samplers which demonstrate intended advantage of implementation (generally via tests, vignettes, or both).* 

- BS4.4 Enable computations to be stopped on convergence (although not necessarily by default).

- BS4.6 Implement tests to confirm that results with convergence checker are statistically equivalent to results from equivalent fixed number of samples without convergence checking.

- BS4.7 Where convergence checkers are themselves parametrised, the effects of such parameters should also be tested. For threshold parameters, for example, lower values should result in longer sequence lengths.* 

- BS5.4 Where multiple checkers are enabled, Bayesian Software should return details of convergence checker used



---



