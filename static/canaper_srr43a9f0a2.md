# srr report for [canaper](https://github.com/joelnitta/canaper)



[Click here for full text of all standards](https://stats-devguide.ropensci.org/standards.html



## Standards with `srrstats` tag





### R directory



Standards in function 'calc_biodiv_random()' on line#37 of file [R/calc_biodiv_random.R](https://github.com/joelnitta/canaper/blob/main/R/calc_biodiv_random.R#L37):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards in function 'cpr_classify_endem()' on line#36 of file [R/cpr_classify_endem.R](https://github.com/joelnitta/canaper/blob/main/R/cpr_classify_endem.R#L36):

- G1.0 Statistical Software should list at least one primary reference from published academic literature.* 

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- G3.0 Statistical software should never compare floating point numbers for equality. All numeric equality comparisons should either ensure that they are made between integers, or use appropriate tolerances for approximate equality.* 

Standards in function 'cpr_classify_signif()' on line#50 of file [R/cpr_classify_signif.R](https://github.com/joelnitta/canaper/blob/main/R/cpr_classify_signif.R#L50):

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- G3.0 Statistical software should never compare floating point numbers for equality. All numeric equality comparisons should either ensure that they are made between integers, or use appropriate tolerances for approximate equality.* 

Standards in function 'cpr_rand_comm()' on line#54 of file [R/cpr_rand_comm.R](https://github.com/joelnitta/canaper/blob/main/R/cpr_rand_comm.R#L54):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards in function 'cpr_rand_test()' on line#133 of file [R/cpr_rand_test.R](https://github.com/joelnitta/canaper/blob/main/R/cpr_rand_test.R#L133):

- G1.0 Statistical Software should list at least one primary reference from published academic literature.* 

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.11 Software should ensure that `data.frame`-like tabular objects which have columns which do not themselves have standard class attributes (typically, `vector`) are appropriately processed, and do not error without reason. This behaviour should be tested. Again, columns created by the [`units` package](https://github.com/r-quantities/units/) provide a good test case.

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.14a error on missing data

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G2.4a explicit conversion to `integer` via `as.integer()`

- G2.4a explicit conversion to `integer` via `as.integer()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- UL1.0 Unsupervised Learning Software should explicitly document expected format (types or classes) for input data, including descriptions of types or classes which are not accepted; for example, specification that software accepts only numeric inputs in `vector` or `matrix` form, or that all inputs must be in `data.frame` form with both column and row names.

- UL1.1 Unsupervised Learning Software should provide distinct sub-routines to assert that all input data is of the expected form, and issue informative error messages when incompatible data are submitted.* 

- UL1.1 Unsupervised Learning Software should provide distinct sub-routines to assert that all input data is of the expected form, and issue informative error messages when incompatible data are submitted.* 

- UL1.1 Unsupervised Learning Software should provide distinct sub-routines to assert that all input data is of the expected form, and issue informative error messages when incompatible data are submitted.* 

- UL1.1 Unsupervised Learning Software should provide distinct sub-routines to assert that all input data is of the expected form, and issue informative error messages when incompatible data are submitted.* 

- UL1.2 Unsupervised learning which uses row or column names to label output objects should assert that input data have non-default row or column names, and issue an informative message when these are not provided.* 

- UL1.2 Unsupervised learning which uses row or column names to label output objects should assert that input data have non-default row or column names, and issue an informative message when these are not provided.* 

- UL1.4 Unsupervised Learning Software should document any assumptions made with regard to input data; for example assumptions about distributional forms or locations (such as that data are centred or on approximately equivalent distributional scales). Implications of violations of these assumptions should be both documented and tested, in particular:

- UL1.4 Unsupervised Learning Software should document any assumptions made with regard to input data; for example assumptions about distributional forms or locations (such as that data are centred or on approximately equivalent distributional scales). Implications of violations of these assumptions should be both documented and tested, in particular:

- UL1.4 Unsupervised Learning Software should document any assumptions made with regard to input data; for example assumptions about distributional forms or locations (such as that data are centred or on approximately equivalent distributional scales). Implications of violations of these assumptions should be both documented and tested, in particular:

- UL1.4 Unsupervised Learning Software should document any assumptions made with regard to input data; for example assumptions about distributional forms or locations (such as that data are centred or on approximately equivalent distributional scales). Implications of violations of these assumptions should be both documented and tested, in particular:

- UL2.0 Routines likely to give unreliable or irreproducible results in response to violations of assumptions regarding input data (see UL1.6) should implement pre-processing steps to diagnose potential violations, and issue appropriately informative messages, and/or include parameters to enable suitable transformations to be applied.* 

- UL3.4 Objects returned from Unsupervised Learning Software which labels, categorise, or partitions data into discrete groups should include, or provide immediate access to, quantitative information on intra-group variances or equivalent, as well as on inter-group relationships where applicable.* 

- UL4.3a The default `print` method should always ensure only a restricted number of rows of any result matrices or equivalent are printed to the screen.* 

Standards in function 'acacia()' on line#28 of file [R/data.R](https://github.com/joelnitta/canaper/blob/main/R/data.R#L28):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

Standards in function 'biod_example()' on line#52 of file [R/data.R](https://github.com/joelnitta/canaper/blob/main/R/data.R#L52):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

Standards in function 'phylocom()' on line#79 of file [R/data.R](https://github.com/joelnitta/canaper/blob/main/R/data.R#L79):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

Standards in function 'biod_results()' on line#107 of file [R/data.R](https://github.com/joelnitta/canaper/blob/main/R/data.R#L107):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

Standards in function 'cpr_signif_cols()' on line#121 of file [R/data.R](https://github.com/joelnitta/canaper/blob/main/R/data.R#L121):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

Standards in function 'cpr_signif_cols_2()' on line#135 of file [R/data.R](https://github.com/joelnitta/canaper/blob/main/R/data.R#L135):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

Standards in function 'cpr_endem_cols()' on line#149 of file [R/data.R](https://github.com/joelnitta/canaper/blob/main/R/data.R#L149):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

Standards in function 'cpr_endem_cols_2()' on line#163 of file [R/data.R](https://github.com/joelnitta/canaper/blob/main/R/data.R#L163):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

Standards in function 'get_ses()' on line#40 of file [R/get_ses.R](https://github.com/joelnitta/canaper/blob/main/R/get_ses.R#L40):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards in  on line#188 of file [R/srr-stats-standards.R](https://github.com/joelnitta/canaper/blob/main/R/srr-stats-standards.R#L188):

- G1.2 Statistical Software should include a* Life Cycle Statement *describing current and anticipated future states of development.* 

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

- G5.7 *Algorithm performance tests** *to test that implementation performs as expected as properties of data change. For instance, a test may show that parameters approach correct estimates within tolerance as data size increases, or that convergence times decrease for higher convergence thresholds.

- UL7.1 Tests should demonstrate that violations of assumed input properties yield unreliable or invalid outputs, and should clarify how such unreliability or invalidity is manifest through the properties of returned objects.* 

Standards in function 'count_higher()' on line#18 of file [R/utils.R](https://github.com/joelnitta/canaper/blob/main/R/utils.R#L18):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards in function 'count_lower()' on line#52 of file [R/utils.R](https://github.com/joelnitta/canaper/blob/main/R/utils.R#L52):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards in function 'lesser_than_single()' on line#78 of file [R/utils.R](https://github.com/joelnitta/canaper/blob/main/R/utils.R#L78):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- G3.0 Statistical software should never compare floating point numbers for equality. All numeric equality comparisons should either ensure that they are made between integers, or use appropriate tolerances for approximate equality.* 

Standards in function '%lesser%()' on line#97 of file [R/utils.R](https://github.com/joelnitta/canaper/blob/main/R/utils.R#L97):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- G3.0 Statistical software should never compare floating point numbers for equality. All numeric equality comparisons should either ensure that they are made between integers, or use appropriate tolerances for approximate equality.* 

Standards in function 'lesser_than_or_equal_single()' on line#113 of file [R/utils.R](https://github.com/joelnitta/canaper/blob/main/R/utils.R#L113):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- G3.0 Statistical software should never compare floating point numbers for equality. All numeric equality comparisons should either ensure that they are made between integers, or use appropriate tolerances for approximate equality.* 

Standards in function '%<=%()' on line#130 of file [R/utils.R](https://github.com/joelnitta/canaper/blob/main/R/utils.R#L130):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- G3.0 Statistical software should never compare floating point numbers for equality. All numeric equality comparisons should either ensure that they are made between integers, or use appropriate tolerances for approximate equality.* 

Standards in function 'greater_than_single()' on line#146 of file [R/utils.R](https://github.com/joelnitta/canaper/blob/main/R/utils.R#L146):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- G3.0 Statistical software should never compare floating point numbers for equality. All numeric equality comparisons should either ensure that they are made between integers, or use appropriate tolerances for approximate equality.* 

Standards in function '%greater%()' on line#165 of file [R/utils.R](https://github.com/joelnitta/canaper/blob/main/R/utils.R#L165):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- G3.0 Statistical software should never compare floating point numbers for equality. All numeric equality comparisons should either ensure that they are made between integers, or use appropriate tolerances for approximate equality.* 

Standards in function 'greater_than_or_equal_single()' on line#181 of file [R/utils.R](https://github.com/joelnitta/canaper/blob/main/R/utils.R#L181):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- G3.0 Statistical software should never compare floating point numbers for equality. All numeric equality comparisons should either ensure that they are made between integers, or use appropriate tolerances for approximate equality.* 

Standards in function '%>=%()' on line#198 of file [R/utils.R](https://github.com/joelnitta/canaper/blob/main/R/utils.R#L198):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- G3.0 Statistical software should never compare floating point numbers for equality. All numeric equality comparisons should either ensure that they are made between integers, or use appropriate tolerances for approximate equality.* 



### tests directory



Standards in  on line#13 of file [tests/testthat/test-calc_biodiv_random.R](https://github.com/joelnitta/canaper/blob/main/tests/testthat/test-calc_biodiv_random.R#L13):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- UL7.0 Inappropriate types of input data are rejected with expected error messages.* 

Standards in  on line#108 of file [tests/testthat/test-calc_biodiv_random.R](https://github.com/joelnitta/canaper/blob/main/tests/testthat/test-calc_biodiv_random.R#L108):

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

Standards in  on line#17 of file [tests/testthat/test-cpr_classify_endem.R](https://github.com/joelnitta/canaper/blob/main/tests/testthat/test-cpr_classify_endem.R#L17):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- UL7.0 Inappropriate types of input data are rejected with expected error messages.* 

Standards in  on line#54 of file [tests/testthat/test-cpr_classify_endem.R](https://github.com/joelnitta/canaper/blob/main/tests/testthat/test-cpr_classify_endem.R#L54):

- G5.4a For new methods, it can be difficult to separate out correctness of the method from the correctness of the implementation, as there may not be reference for comparison. In this case, testing may be implemented against simple, trivial cases or against multiple implementations such as an initial R implementation compared with results from a C/C++ implementation.

- G5.5 Correctness tests should be run with a fixed random seed

Standards in  on line#2 of file [tests/testthat/test-cpr_classify_signif.R](https://github.com/joelnitta/canaper/blob/main/tests/testthat/test-cpr_classify_signif.R#L2):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- UL7.0 Inappropriate types of input data are rejected with expected error messages.* 

Standards in  on line#30 of file [tests/testthat/test-cpr_classify_signif.R](https://github.com/joelnitta/canaper/blob/main/tests/testthat/test-cpr_classify_signif.R#L30):

- G5.4a For new methods, it can be difficult to separate out correctness of the method from the correctness of the implementation, as there may not be reference for comparison. In this case, testing may be implemented against simple, trivial cases or against multiple implementations such as an initial R implementation compared with results from a C/C++ implementation.

- G5.5 Correctness tests should be run with a fixed random seed

Standards in  on line#2 of file [tests/testthat/test-cpr_rand_comm.R](https://github.com/joelnitta/canaper/blob/main/tests/testthat/test-cpr_rand_comm.R#L2):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- UL7.0 Inappropriate types of input data are rejected with expected error messages.* 

Standards in  on line#37 of file [tests/testthat/test-cpr_rand_test.R](https://github.com/joelnitta/canaper/blob/main/tests/testthat/test-cpr_rand_test.R#L37):

- G2.11 Software should ensure that `data.frame`-like tabular objects which have columns which do not themselves have standard class attributes (typically, `vector`) are appropriately processed, and do not error without reason. This behaviour should be tested. Again, columns created by the [`units` package](https://github.com/r-quantities/units/) provide a good test case.

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G5.0 Where applicable or practicable, tests should use standard data sets with known properties (for example, the [NIST Standard Reference Datasets](https://www.itl.nist.gov/div898/strd/), or data sets provided by other widely-used R packages).

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- UL1.4 Unsupervised Learning Software should document any assumptions made with regard to input data; for example assumptions about distributional forms or locations (such as that data are centred or on approximately equivalent distributional scales). Implications of violations of these assumptions should be both documented and tested, in particular:

- UL7.0 Inappropriate types of input data are rejected with expected error messages.* 

Standards in  on line#255 of file [tests/testthat/test-cpr_rand_test.R](https://github.com/joelnitta/canaper/blob/main/tests/testthat/test-cpr_rand_test.R#L255):

- UL1.2 Unsupervised learning which uses row or column names to label output objects should assert that input data have non-default row or column names, and issue an informative message when these are not provided.* 

Standards in  on line#278 of file [tests/testthat/test-cpr_rand_test.R](https://github.com/joelnitta/canaper/blob/main/tests/testthat/test-cpr_rand_test.R#L278):

- UL7.5 Batch processing routines should be explicitly tested, commonly via extended tests (see **G4.10**--**G4.12**).

- UL7.5a Tests of batch processing routines should demonstrate that equivalent results are obtained from direct (non-batch) processing.

Standards in  on line#312 of file [tests/testthat/test-cpr_rand_test.R](https://github.com/joelnitta/canaper/blob/main/tests/testthat/test-cpr_rand_test.R#L312):

- UL7.5 Batch processing routines should be explicitly tested, commonly via extended tests (see **G4.10**--**G4.12**).

- UL7.5a Tests of batch processing routines should demonstrate that equivalent results are obtained from direct (non-batch) processing.

Standards in  on line#352 of file [tests/testthat/test-cpr_rand_test.R](https://github.com/joelnitta/canaper/blob/main/tests/testthat/test-cpr_rand_test.R#L352):

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

- G5.5 Correctness tests should be run with a fixed random seed

Standards in  on line#382 of file [tests/testthat/test-cpr_rand_test.R](https://github.com/joelnitta/canaper/blob/main/tests/testthat/test-cpr_rand_test.R#L382):

- UL1.3 Unsupervised Learning Software should transfer all relevant aspects of input data, notably including row and column names, and potentially information from other `attributes()`, to corresponding aspects of return objects.

- UL7.3 Demonstrate that labels on input data are propagated to, or may be recovered from, output data. 



### root directory



Standards in  on line#29 of file [./README.Rmd](https://github.com/joelnitta/canaper/blob/main/./README.Rmd#L29):

- G1.1 Statistical Software should document whether the algorithm(s) it implements are:* - *The first implementation of a novel algorithm*; or - *The first implementation within **R** of an algorithm which has previously been implemented in other languages or contexts*; or - *An improvement on other implementations of similar algorithms in **R***. 



---



## Standards with `srrstatsNA` tag





### R directory



Standards in  on line#175 of file [R/srr-stats-standards.R](https://github.com/joelnitta/canaper/blob/main/R/srr-stats-standards.R#L175):

- G1.5 Software should include all code necessary to reproduce results which form the basis of performance claims made in associated publications.* 

- G1.6 Software should include code necessary to compare performance claims with alternative implementations in other R packages.* 

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- G2.12 Software should ensure that `data.frame`-like tabular objects which have list columns should ensure that those columns are appropriately pre-processed either through being removed, converted to equivalent vector columns where appropriate, or some other appropriate treatment such as an informative error. This behaviour should be tested.* 

- G2.14b ignore missing data with default warnings or messages issued

- G2.14c replace missing data with appropriately imputed values

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.4c explicit conversion to character via `as.character()` (and not `paste` or `paste0`)

- G2.4d explicit conversion to factor via `as.factor()`

- G2.4e explicit conversion from factor via `as...()` functions

- G2.5 Where inputs are expected to be of `factor` type, secondary documentation should explicitly state whether these should be `ordered` or not, and those inputs should provide appropriate error or other routines to ensure inputs follow these expectations.* 

- G2.9 Software should issue diagnostic messages for type conversion in which information is lost (such as conversion of variables from factor to character; standardisation of variable names; or removal of meta-data such as those associated with [`sf`-format](https://r-spatial.github.io/sf/) data) or added (such as insertion of variable or column names where none were provided).* 

- G3.1 Statistical software which relies on covariance calculations should enable users to choose between different algorithms for calculating covariances, and should not rely solely on covariances from the `stats::cov` function.

- G3.1a The ability to use arbitrarily specified covariance methods should be documented (typically in examples or vignettes).* 

- G4.0 Statistical Software which enables outputs to be written to local files should parse parameters specifying file names to ensure appropriate file suffices are automatically generated where not provided.* 

- G5.10 Extended tests should included and run under a common framework with other tests but be switched on by flags such as as a `<MYPKG>_EXTENDED_TESTS=1` environment variable.

- G5.11 Where extended tests require large data sets or other assets, these should be provided for downloading and fetched as part of the testing workflow.

- G5.11a When any downloads of additional data necessary for extended tests fail, the tests themselves should not fail, rather be skipped and implicitly succeed with an appropriate diagnostic message.

- G5.12 Any conditions necessary to run extended tests such as platform requirements, memory, expected runtime, and artefacts produced that may need manual inspection, should be described in developer documentation such as a `CONTRIBUTING.md` or `tests/README.md` file.

- G5.4c Where applicable, stored values may be drawn from published paper outputs when applicable and where code from original implementations is not available

- G5.6 *Parameter recovery tests** *to test that the implementation produce expected results given data with known properties. For instance, a linear regression algorithm should return expected coefficient values for a simulated data set generated from a linear model.

- G5.6a Parameter recovery tests should generally be expected to succeed within a defined tolerance rather than recovering exact values.

- G5.6b Parameter recovery tests should be run with multiple random seeds when either data simulation or the algorithm contains a random component. (When long-running, such tests may be part of an extended, rather than regular, test suite; see G4.10-4.12, below).

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8a Zero-length data

- G5.8b Data of unsupported types (e.g., character or complex numbers in for functions designed only for numeric data)

- G5.8c Data with all-`NA` fields or columns or all identical fields or columns

- G5.8d Data outside the scope of the algorithm (for example, data with more fields (columns) than observations (rows) for some regression algorithms)

- G5.9 *Noise susceptibility tests** *Packages should test for expected stochastic behaviour, such as through the following conditions:

- G5.9a Adding trivial noise (for example, at the scale of `.Machine$double.eps`) to data does not meaningfully change results

- G5.9b Running under different random seeds or initial conditions does not meaningfully change results* 

- UL1.3a Where otherwise relevant information is not transferred, this should be explicitly documented.* 

- UL1.4a Software which responds qualitatively differently to input data which has components on markedly different scales should explicitly document such differences, and implications of submitting such data.

- UL1.4b Examples or other documentation should not use `scale()` or equivalent transformations without explaining why scale is applied, and explicitly illustrating and contrasting the consequences of not applying such transformations.* 

- UL2.1 Unsupervised Learning Software should document any transformations applied to input data, for example conversion of label-values to `factor`, and should provide ways to explicitly avoid any default transformations (with error or warning conditions where appropriate).

- UL2.2 Unsupervised Learning Software which accepts missing values in input data should implement explicit parameters controlling the processing of missing values, ideally distinguishing `NA` or `NaN` values from `Inf` values.* 

- UL2.3 Unsupervised Learning Software should implement pre-processing routines to identify whether aspects of input data are perfectly collinear.* 

- UL3.0 Algorithms which apply sequential labels to input data (such as clustering or partitioning algorithms) should ensure that the sequence follows decreasing group sizes (so labels of "1", "a", or "A" describe the largest group, "2", "b", or "B" the second largest, and so on.)* 

- UL3.1 Dimensionality reduction or equivalent algorithms which label dimensions should ensure that that sequences of labels follows decreasing "importance" (for example, eigenvalues or variance contributions).* 

- UL3.2 Unsupervised Learning Software for which input data does not generally include labels (such as `array`-like data with no row names) should provide an additional parameter to enable cases to be labelled.* 

- UL3.3 Where applicable, Unsupervised Learning Software should implement routines to predict the properties (such as numerical ordinates, or cluster memberships) of additional new data without re-running the entire algorithm.* 

- UL4.0 Unsupervised Learning Software should return some form of "model" object, generally through using or modifying existing class structures for model objects, or creating a new class of model objects.

- UL4.1 Unsupervised Learning Software may enable an ability to generate a model object without actually fitting values. This may be useful for controlling batch processing of computationally intensive fitting algorithms.

- UL4.2 The return object from Unsupervised Learning Software should include, or otherwise enable immediate extraction of, all parameters used to control the algorithm used.* 

- UL4.3 Model objects returned by Unsupervised Learning Software should implement or appropriately extend a default `print` method which provides an on-screen summary of model (input) parameters and methods used to generate results. The `print` method may also summarise statistical aspects of the output data or results.

- UL4.4 Unsupervised Learning Software should also implement `summary` methods for model objects which should summarise the primary statistics used in generating the model (such as numbers of observations, parameters of methods applied). The `summary` method may also provide summary statistics from the resultant model.* 

- UL6.0 Objects returned by Unsupervised Learning Software should have default `plot` methods, either through explicit implementation, extension of methods for existing model objects, through ensuring default methods work appropriately, or through explicit reference to helper packages such as [`factoextra`](https://github.com/kassambara/factoextra) and associated functions.

- UL6.1 Where the default `plot` method is **NOT** a generic `plot` method dispatched on the class of return objects (that is, through an S3-type `plot.<myclass>` function or equivalent), that method dispatch (or equivalent) should nevertheless exist in order to explicitly direct users to the appropriate function.

- UL6.2 Where default plot methods include labelling components of return objects (such as cluster labels), routines should ensure that labels are automatically placed to ensure readability, and/or that appropriate diagnostic messages are issued where readability is likely to be compromised (for example, through attempting to place too many labels).* 

- UL7.2 Demonstrate that labels placed on output data follow decreasing group sizes (**UL3.0**)

- UL7.4 Demonstrate that submission of new data to a previously fitted model can generate results more efficiently than initial model fitting.* 



---





## Missing Standards



The following standards are missing:



General standards:



G1.4a, G2.0a, G2.1a, G2.3a, G2.3b, G2.4a, G2.4b, G2.4c, G2.4d, G2.4e, G2.14a, G2.14b, G2.14c, G3.1a, G5.2a, G5.2b, G5.4a, G5.4b, G5.4c, G5.6a, G5.6b, G5.8a, G5.8b, G5.8c, G5.8d, G5.9a, G5.9b, G5.11a





Unsupervised standards:



UL1.3a, UL1.4a, UL1.4b, UL4.3a, UL7.5a


