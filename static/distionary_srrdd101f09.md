# srr report for [distionary](https://github.com/probaverse/distionary)



[Click here for full text of all standards](https://stats-devguide.ropensci.org/standards.html)







## Standards with `srrstats` tag



**Numbers of standards:**

-  G :  45  /  68

-  PD :  11  /  14

- Total : 56 / 82





### R directory



Standards on line#8 of file [R/distionary-package.R](https://github.com/probaverse/distionary/blob/main/R/distionary-package.R#L8):

- G1.2 Statistical Software should include a* Life Cycle Statement *describing current and anticipated future states of development.* 

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

Standards on line#101 of file [R/distribution.R](https://github.com/probaverse/distionary/blob/main/R/distribution.R#L101):

- G1.0 Statistical Software should list at least one primary reference from published academic literature.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

- G2.3 For univariate character input:

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G2.4c explicit conversion to character via `as.character()` (and not `paste` or `paste0`)

- PD1.0 Software should provide references justifying choice and usage of particular probability distributions.* 

- PD2.0 Where possible, software should represent probability distributions using a package for general representation.* 

Standards on line#43 of file [R/dst_bern.R](https://github.com/probaverse/distionary/blob/main/R/dst_bern.R#L43):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#42 of file [R/dst_beta.R](https://github.com/probaverse/distionary/blob/main/R/dst_beta.R#L42):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#48 of file [R/dst_binom.R](https://github.com/probaverse/distionary/blob/main/R/dst_binom.R#L48):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4a explicit conversion to `integer` via `as.integer()`

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#47 of file [R/dst_cauchy.R](https://github.com/probaverse/distionary/blob/main/R/dst_cauchy.R#L47):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#42 of file [R/dst_chisq.R](https://github.com/probaverse/distionary/blob/main/R/dst_chisq.R#L42):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#43 of file [R/dst_degenerate.R](https://github.com/probaverse/distionary/blob/main/R/dst_degenerate.R#L43):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#42 of file [R/dst_exp.R](https://github.com/probaverse/distionary/blob/main/R/dst_exp.R#L42):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#43 of file [R/dst_f.R](https://github.com/probaverse/distionary/blob/main/R/dst_f.R#L43):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#43 of file [R/dst_gamma.R](https://github.com/probaverse/distionary/blob/main/R/dst_gamma.R#L43):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#47 of file [R/dst_geom.R](https://github.com/probaverse/distionary/blob/main/R/dst_geom.R#L47):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#60 of file [R/dst_gev.R](https://github.com/probaverse/distionary/blob/main/R/dst_gev.R#L60):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#58 of file [R/dst_gpd.R](https://github.com/probaverse/distionary/blob/main/R/dst_gpd.R#L58):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#47 of file [R/dst_hyper.R](https://github.com/probaverse/distionary/blob/main/R/dst_hyper.R#L47):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#45 of file [R/dst_lnorm.R](https://github.com/probaverse/distionary/blob/main/R/dst_lnorm.R#L45):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#55 of file [R/dst_lp3.R](https://github.com/probaverse/distionary/blob/main/R/dst_lp3.R#L55):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- PD3.0 Manipulation of probability distributions should very generally be analytic, with numeric manipulations only implemented with clear justification (ideally including references).* 

Standards on line#50 of file [R/dst_nbinom.R](https://github.com/probaverse/distionary/blob/main/R/dst_nbinom.R#L50):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#44 of file [R/dst_norm.R](https://github.com/probaverse/distionary/blob/main/R/dst_norm.R#L44):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#47 of file [R/dst_null.R](https://github.com/probaverse/distionary/blob/main/R/dst_null.R#L47):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#55 of file [R/dst_pearson3.R](https://github.com/probaverse/distionary/blob/main/R/dst_pearson3.R#L55):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- PD3.0 Manipulation of probability distributions should very generally be analytic, with numeric manipulations only implemented with clear justification (ideally including references).* 

Standards on line#41 of file [R/dst_pois.R](https://github.com/probaverse/distionary/blob/main/R/dst_pois.R#L41):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#42 of file [R/dst_t.R](https://github.com/probaverse/distionary/blob/main/R/dst_t.R#L42):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#43 of file [R/dst_unif.R](https://github.com/probaverse/distionary/blob/main/R/dst_unif.R#L43):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#43 of file [R/dst_weibull.R](https://github.com/probaverse/distionary/blob/main/R/dst_weibull.R#L43):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#43 of file [R/enframe.R](https://github.com/probaverse/distionary/blob/main/R/enframe.R#L43):

- G2.3 For univariate character input:

- G2.4c explicit conversion to character via `as.character()` (and not `paste` or `paste0`)

- PD3.1 Operations on probability distributions should generally be contained within separate functions which themselves accept the names of the distributions as one input parameter.* 

Standards on line#64 of file [R/eval_cdf.R](https://github.com/probaverse/distionary/blob/main/R/eval_cdf.R#L64):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.14a error on missing data

- G2.14b ignore missing data with default warnings or messages issued

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- PD3.1 Operations on probability distributions should generally be contained within separate functions which themselves accept the names of the distributions as one input parameter.* 

Standards on line#38 of file [R/eval_chf.R](https://github.com/probaverse/distionary/blob/main/R/eval_chf.R#L38):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.14a error on missing data

- G2.14b ignore missing data with default warnings or messages issued

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- PD3.1 Operations on probability distributions should generally be contained within separate functions which themselves accept the names of the distributions as one input parameter.* 

Standards on line#38 of file [R/eval_density.R](https://github.com/probaverse/distionary/blob/main/R/eval_density.R#L38):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.14a error on missing data

- G2.14b ignore missing data with default warnings or messages issued

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- PD3.1 Operations on probability distributions should generally be contained within separate functions which themselves accept the names of the distributions as one input parameter.* 

Standards on line#19 of file [R/eval_from_network-quantile.R](https://github.com/probaverse/distionary/blob/main/R/eval_from_network-quantile.R#L19):

- PD3.4 Use of routines to integrate probability distributions should explicitly document conditions under which integrals are expected to remain stable, and ideally include pre-processing checks for potentially unstable behaviour.

Standards on line#38 of file [R/eval_hazard.R](https://github.com/probaverse/distionary/blob/main/R/eval_hazard.R#L38):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.14a error on missing data

- G2.14b ignore missing data with default warnings or messages issued

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- PD3.1 Operations on probability distributions should generally be contained within separate functions which themselves accept the names of the distributions as one input parameter.* 

Standards on line#40 of file [R/eval_odds.R](https://github.com/probaverse/distionary/blob/main/R/eval_odds.R#L40):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.14a error on missing data

- G2.14b ignore missing data with default warnings or messages issued

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- PD3.1 Operations on probability distributions should generally be contained within separate functions which themselves accept the names of the distributions as one input parameter.* 

Standards on line#39 of file [R/eval_pmf.R](https://github.com/probaverse/distionary/blob/main/R/eval_pmf.R#L39):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.14a error on missing data

- G2.14b ignore missing data with default warnings or messages issued

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- PD3.1 Operations on probability distributions should generally be contained within separate functions which themselves accept the names of the distributions as one input parameter.* 

Standards on line#53 of file [R/eval_property.R](https://github.com/probaverse/distionary/blob/main/R/eval_property.R#L53):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.14a error on missing data

- G2.14b ignore missing data with default warnings or messages issued

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- PD3.1 Operations on probability distributions should generally be contained within separate functions which themselves accept the names of the distributions as one input parameter.* 

Standards on line#62 of file [R/eval_quantile.R](https://github.com/probaverse/distionary/blob/main/R/eval_quantile.R#L62):

- G1.1 Statistical Software should document whether the algorithm(s) it implements are:* - *The first implementation of a novel algorithm*; or - *The first implementation within **R** of an algorithm which has previously been implemented in other languages or contexts*; or - *An improvement on other implementations of similar algorithms in **R***. 

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.14a error on missing data

- G2.14b ignore missing data with default warnings or messages issued

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- PD3.1 Operations on probability distributions should generally be contained within separate functions which themselves accept the names of the distributions as one input parameter.* 

- PD3.3 Return objects which include values generated from optimisation algorithms should include information on optimisation algorithm and performance, minimally including the name of the algorithm used, the convergence tolerance, and the number of iterations.* 

Standards on line#42 of file [R/eval_return.R](https://github.com/probaverse/distionary/blob/main/R/eval_return.R#L42):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.14a error on missing data

- G2.14b ignore missing data with default warnings or messages issued

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- PD3.1 Operations on probability distributions should generally be contained within separate functions which themselves accept the names of the distributions as one input parameter.* 

Standards on line#38 of file [R/eval_survival.R](https://github.com/probaverse/distionary/blob/main/R/eval_survival.R#L38):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.14a error on missing data

- G2.14b ignore missing data with default warnings or messages issued

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- PD3.1 Operations on probability distributions should generally be contained within separate functions which themselves accept the names of the distributions as one input parameter.* 

Standards on line#20 of file [R/intrinsics.R](https://github.com/probaverse/distionary/blob/main/R/intrinsics.R#L20):

- G2.3 For univariate character input:

Standards on line#5 of file [R/kurtosis.R](https://github.com/probaverse/distionary/blob/main/R/kurtosis.R#L5):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

Standards on line#33 of file [R/mean.R](https://github.com/probaverse/distionary/blob/main/R/mean.R#L33):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

Standards on line#20 of file [R/median.R](https://github.com/probaverse/distionary/blob/main/R/median.R#L20):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

Standards on line#19 of file [R/new_distribution.R](https://github.com/probaverse/distionary/blob/main/R/new_distribution.R#L19):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

Standards on line#34 of file [R/parameters.R](https://github.com/probaverse/distionary/blob/main/R/parameters.R#L34):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

Standards on line#26 of file [R/pdq_gev.R](https://github.com/probaverse/distionary/blob/main/R/pdq_gev.R#L26):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.14b ignore missing data with default warnings or messages issued

Standards on line#24 of file [R/pdq_gpd.R](https://github.com/probaverse/distionary/blob/main/R/pdq_gpd.R#L24):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.14b ignore missing data with default warnings or messages issued

Standards on line#26 of file [R/plot.R](https://github.com/probaverse/distionary/blob/main/R/plot.R#L26):

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

Standards on line#20 of file [R/pretty_name.R](https://github.com/probaverse/distionary/blob/main/R/pretty_name.R#L20):

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

Standards on line#45 of file [R/prob_left_right.R](https://github.com/probaverse/distionary/blob/main/R/prob_left_right.R#L45):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.14a error on missing data

- G2.14b ignore missing data with default warnings or messages issued

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- PD3.1 Operations on probability distributions should generally be contained within separate functions which themselves accept the names of the distributions as one input parameter.* 

Standards on line#24 of file [R/range.r](https://github.com/probaverse/distionary/blob/main/R/range.r#L24):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

Standards on line#20 of file [R/realise.R](https://github.com/probaverse/distionary/blob/main/R/realise.R#L20):

- G2.4a explicit conversion to `integer` via `as.integer()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards on line#10 of file [R/representation_as_function.R](https://github.com/probaverse/distionary/blob/main/R/representation_as_function.R#L10):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

Standards on line#5 of file [R/skewness.R](https://github.com/probaverse/distionary/blob/main/R/skewness.R#L5):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

Standards on line#5 of file [R/stdev.R](https://github.com/probaverse/distionary/blob/main/R/stdev.R#L5):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

Standards on line#10 of file [R/utils.R](https://github.com/probaverse/distionary/blob/main/R/utils.R#L10):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

Standards on line#5 of file [R/variance.R](https://github.com/probaverse/distionary/blob/main/R/variance.R#L5):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

Standards on line#15 of file [R/vtype.R](https://github.com/probaverse/distionary/blob/main/R/vtype.R#L15):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).



### tests directory



Standards on line#5 of file [tests/testthat/test-distribution.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-distribution.R#L5):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

Standards on line#6 of file [tests/testthat/test-dst_degenerate.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-dst_degenerate.R#L6):

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

Standards on line#6 of file [tests/testthat/test-dst_null.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-dst_null.R#L6):

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

Standards on line#13 of file [tests/testthat/test-edge_cases-builtin_dists.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-edge_cases-builtin_dists.R#L13):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

Standards on line#6 of file [tests/testthat/test-edge_cases-eval_functions.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-edge_cases-eval_functions.R#L6):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

Standards on line#15 of file [tests/testthat/test-enframe_eval.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-enframe_eval.R#L15):

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8a Zero-length data

- G5.8b Data of unsupported types (e.g., character or complex numbers in for functions designed only for numeric data)

- G5.8c Data with all-`NA` fields or columns or all identical fields or columns

Standards on line#6 of file [tests/testthat/test-intrinsic.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-intrinsic.R#L6):

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

Standards on line#6 of file [tests/testthat/test-machine_tolerance.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-machine_tolerance.R#L6):

- G5.9 *Noise susceptibility tests** *Packages should test for expected stochastic behaviour, such as through the following conditions:

- G5.9a Adding trivial noise (for example, at the scale of `.Machine$double.eps`) to data does not meaningfully change results

Standards on line#3 of file [tests/testthat/test-parameters.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-parameters.R#L3):

- PD4.2 All functions constructed in accordance with **PD2.1** - that is, which use a fixed distribution, and which name that distribution as an input parameter - should be tested using at least two different distributions.* 

Standards on line#13 of file [tests/testthat/test-pdq_gev.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-pdq_gev.R#L13):

- G3.0 Statistical software should never compare floating point numbers for equality. All numeric equality comparisons should either ensure that they are made between integers, or use appropriate tolerances for approximate equality.* 

- PD4.0 The numeric outputs of probability distribution functions should be tested, not just output structures. These tests should generally be tests for numeric equality.* 

- PD4.1 Tests for numeric equality should compare the output of of probability distribution functions with the output of code which explicitly demonstrates how such values are derived (generally defined in the same location in test files).* 

Standards on line#13 of file [tests/testthat/test-pdq_gpd.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-pdq_gpd.R#L13):

- G3.0 Statistical software should never compare floating point numbers for equality. All numeric equality comparisons should either ensure that they are made between integers, or use appropriate tolerances for approximate equality.* 

- PD4.0 The numeric outputs of probability distribution functions should be tested, not just output structures. These tests should generally be tests for numeric equality.* 

- PD4.1 Tests for numeric equality should compare the output of of probability distribution functions with the output of code which explicitly demonstrates how such values are derived (generally defined in the same location in test files).* 

Standards on line#3 of file [tests/testthat/test-pretty_name.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-pretty_name.R#L3):

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

Standards on line#5 of file [tests/testthat/test-property-kurtosis.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-property-kurtosis.R#L5):

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

Standards on line#5 of file [tests/testthat/test-property-kurtosis_exc.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-property-kurtosis_exc.R#L5):

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

Standards on line#5 of file [tests/testthat/test-property-mean.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-property-mean.R#L5):

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

Standards on line#5 of file [tests/testthat/test-property-skewness.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-property-skewness.R#L5):

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

Standards on line#6 of file [tests/testthat/test-property-stdev.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-property-stdev.R#L6):

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

Standards on line#6 of file [tests/testthat/test-property-variance.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-property-variance.R#L6):

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

Standards on line#10 of file [tests/testthat/test-realise.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-realise.R#L10):

- G5.5 Correctness tests should be run with a fixed random seed

- G5.6b Parameter recovery tests should be run with multiple random seeds when either data simulation or the algorithm contains a random component. (When long-running, such tests may be part of an extended, rather than regular, test suite; see G5.10-4.12, below).* 

- G5.9b Running under different random seeds or initial conditions does not meaningfully change results* 

Standards on line#23 of file [tests/testthat/test-representation-chf.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-representation-chf.R#L23):

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

- G5.6 *Parameter recovery tests** *to test that the implementation produce expected results given data with known properties. For instance, a linear regression algorithm should return expected coefficient values for a simulated data set generated from a linear model.

- G5.6a Parameter recovery tests should generally be expected to succeed within a defined tolerance rather than recovering exact values.

Standards on line#16 of file [tests/testthat/test-representation-density.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-representation-density.R#L16):

- G3.0 Statistical software should never compare floating point numbers for equality. All numeric equality comparisons should either ensure that they are made between integers, or use appropriate tolerances for approximate equality.* 

- G5.6 *Parameter recovery tests** *to test that the implementation produce expected results given data with known properties. For instance, a linear regression algorithm should return expected coefficient values for a simulated data set generated from a linear model.

- G5.6a Parameter recovery tests should generally be expected to succeed within a defined tolerance rather than recovering exact values.

Standards on line#23 of file [tests/testthat/test-representation-hazard.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-representation-hazard.R#L23):

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

- G5.6 *Parameter recovery tests** *to test that the implementation produce expected results given data with known properties. For instance, a linear regression algorithm should return expected coefficient values for a simulated data set generated from a linear model.

- G5.6a Parameter recovery tests should generally be expected to succeed within a defined tolerance rather than recovering exact values.

Standards on line#19 of file [tests/testthat/test-representation-odds.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-representation-odds.R#L19):

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

- G5.6 *Parameter recovery tests** *to test that the implementation produce expected results given data with known properties. For instance, a linear regression algorithm should return expected coefficient values for a simulated data set generated from a linear model.

- G5.6a Parameter recovery tests should generally be expected to succeed within a defined tolerance rather than recovering exact values.

Standards on line#19 of file [tests/testthat/test-representation-pmf.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-representation-pmf.R#L19):

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

- G5.6 *Parameter recovery tests** *to test that the implementation produce expected results given data with known properties. For instance, a linear regression algorithm should return expected coefficient values for a simulated data set generated from a linear model.

- G5.6a Parameter recovery tests should generally be expected to succeed within a defined tolerance rather than recovering exact values.

Standards on line#32 of file [tests/testthat/test-representation-quantile.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-representation-quantile.R#L32):

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

- G5.6 *Parameter recovery tests** *to test that the implementation produce expected results given data with known properties. For instance, a linear regression algorithm should return expected coefficient values for a simulated data set generated from a linear model.

- G5.6a Parameter recovery tests should generally be expected to succeed within a defined tolerance rather than recovering exact values.

- G5.7 *Algorithm performance tests** *to test that implementation performs as expected as properties of data change. For instance, a test may show that parameters approach correct estimates within tolerance as data size increases, or that convergence times decrease for higher convergence thresholds.

- G5.8d Data outside the scope of the algorithm (for example, data with more fields (columns) than observations (rows) for some regression algorithms)

- PD4.3 Tests of optimisation or integration algorithms should compare default results with results generated with alternative values for every parameter, including all parameters for the chosen algorithm (whether exposed as function inputs or not).* 

- PD4.4 Tests of optimisation or integration algorithms should compare equivalent results generated with at least one alternative algorithm.* 

Standards on line#69 of file [tests/testthat/test-representation-quantile.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-representation-quantile.R#L69):

- G5.7 *Algorithm performance tests** *to test that implementation performs as expected as properties of data change. For instance, a test may show that parameters approach correct estimates within tolerance as data size increases, or that convergence times decrease for higher convergence thresholds.

Standards on line#19 of file [tests/testthat/test-representation-return.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-representation-return.R#L19):

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

- G5.6 *Parameter recovery tests** *to test that the implementation produce expected results given data with known properties. For instance, a linear regression algorithm should return expected coefficient values for a simulated data set generated from a linear model.

- G5.6a Parameter recovery tests should generally be expected to succeed within a defined tolerance rather than recovering exact values.

Standards on line#19 of file [tests/testthat/test-representation-survival.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-representation-survival.R#L19):

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

- G5.6 *Parameter recovery tests** *to test that the implementation produce expected results given data with known properties. For instance, a linear regression algorithm should return expected coefficient values for a simulated data set generated from a linear model.

- G5.6a Parameter recovery tests should generally be expected to succeed within a defined tolerance rather than recovering exact values.

Standards on line#10 of file [tests/testthat/test-representations_satisfied.R](https://github.com/probaverse/distionary/blob/main/tests/testthat/test-representations_satisfied.R#L10):

- G3.0 Statistical software should never compare floating point numbers for equality. All numeric equality comparisons should either ensure that they are made between integers, or use appropriate tolerances for approximate equality.* 



---



## Standards with `srrstatsNA` tag



**Numbers of standards:**

-  G :  23  /  68

-  PD :  3  /  14

- Total : 26 / 82





### R directory



Standards on line#52 of file [R/srr-stats-standards.R](https://github.com/probaverse/distionary/blob/main/R/srr-stats-standards.R#L52):

- G1.5 Software should include all code necessary to reproduce results which form the basis of performance claims made in associated publications.* 

- G1.6 Software should include code necessary to compare performance claims with alternative implementations in other R packages.* 

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- G2.11 Software should ensure that `data.frame`-like tabular objects which have columns which do not themselves have standard class attributes (typically, `vector`) are appropriately processed, and do not error without reason. This behaviour should be tested. Again, columns created by the [`units` package](https://github.com/r-quantities/units/) provide a good test case.

- G2.12 Software should ensure that `data.frame`-like tabular objects which have list columns should ensure that those columns are appropriately pre-processed either through being removed, converted to equivalent vector columns where appropriate, or some other appropriate treatment such as an informative error. This behaviour should be tested.* 

- G2.14c replace missing data with appropriately imputed values

- G2.4d explicit conversion to factor via `as.factor()`

- G2.4e explicit conversion from factor via `as...()` functions

- G2.5 Where inputs are expected to be of `factor` type, secondary documentation should explicitly state whether these should be `ordered` or not, and those inputs should provide appropriate error or other routines to ensure inputs follow these expectations.* 

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- G2.9 Software should issue diagnostic messages for type conversion in which information is lost (such as conversion of variables from factor to character; standardisation of variable names; or removal of meta-data such as those associated with [`sf`-format](https://r-spatial.github.io/sf/) data) or added (such as insertion of variable or column names where none were provided).* 

- G3.1 Statistical software which relies on covariance calculations should enable users to choose between different algorithms for calculating covariances, and should not rely solely on covariances from the `stats::cov` function.

- G3.1a The ability to use arbitrarily specified covariance methods should be documented (typically in examples or vignettes).* 

- G4.0 Statistical Software which enables outputs to be written to local files should parse parameters specifying file names to ensure appropriate file suffices are automatically generated where not provided.* 

- G5.0 Where applicable or practicable, tests should use standard data sets with known properties (for example, the [NIST Standard Reference Datasets](https://www.itl.nist.gov/div898/strd/), or data sets provided by other widely-used R packages).

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

- G5.10 Extended tests should included and run under a common framework with other tests but be switched on by flags such as as a `<MYPKG>_EXTENDED_TESTS="true"` environment variable.* - The extended tests can be then run automatically by GitHub Actions for example by adding the following to the `env` section of the workflow: 

- G5.11 Where extended tests require large data sets or other assets, these should be provided for downloading and fetched as part of the testing workflow.

- G5.11a When any downloads of additional data necessary for extended tests fail, the tests themselves should not fail, rather be skipped and implicitly succeed with an appropriate diagnostic message.

- G5.12 Any conditions necessary to run extended tests such as platform requirements, memory, expected runtime, and artefacts produced that may need manual inspection, should be described in developer documentation such as a `CONTRIBUTING.md` or `tests/README.md` file.

- G5.4a For new methods, it can be difficult to separate out correctness of the method from the correctness of the implementation, as there may not be reference for comparison. In this case, testing may be implemented against simple, trivial cases or against multiple implementations such as an initial R implementation compared with results from a C/C++ implementation.

- G5.4c Where applicable, stored values may be drawn from published paper outputs when applicable and where code from original implementations is not available

- PD3.2 Use of optimisation routines to estimate parameters from probability distributions should explicitly specify and explain values of all parameters, including all uses of default parameters.

- PD3.5 Integration routines should only rely on discrete summation where such use can be justified (for example, through providing a literature reference), in which case the following applies:

- PD3.5a Use of discrete summation to approximate integrals must demonstrate that the Reimann sum has a finite limit (or, equivalently, must explicitly describe the conditions under which the sum may be expected to be finite).* 



---



