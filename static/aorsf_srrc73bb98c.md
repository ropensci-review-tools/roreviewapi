# srr report for [aorsf](https://github.com/bcjaeger/aorsf)



[Click here for full text of all standards](https://stats-devguide.ropensci.org/standards.html)



## Standards with `srrstats` tag (102 / 158)





### R directory



Standards in function 'check_arg_type()' on line#19 of file [R/check.R](https://github.com/bcjaeger/aorsf/blob/master/R/check.R#L19):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

Standards in function 'check_arg_length()' on line#103 of file [R/check.R](https://github.com/bcjaeger/aorsf/blob/master/R/check.R#L103):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

Standards in function 'check_arg_is_valid()' on line#280 of file [R/check.R](https://github.com/bcjaeger/aorsf/blob/master/R/check.R#L280):

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

Standards in function 'check_arg_is_integer()' on line#319 of file [R/check.R](https://github.com/bcjaeger/aorsf/blob/master/R/check.R#L319):

- G2.4a explicit conversion to `integer` via `as.integer()`

Standards in function 'check_var_types()' on line#401 of file [R/check.R](https://github.com/bcjaeger/aorsf/blob/master/R/check.R#L401):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

Standards in function 'check_orsf_inputs()' on line#567 of file [R/check.R](https://github.com/bcjaeger/aorsf/blob/master/R/check.R#L567):

- G2.9 Software should issue diagnostic messages for type conversion in which information is lost (such as conversion of variables from factor to character; standardisation of variable names; or removal of meta-data such as those associated with [`sf`-format](https://r-spatial.github.io/sf/) data) or added (such as insertion of variable or column names where none were provided).* 

Standards in function 'check_new_data_types()' on line#1078 of file [R/check.R](https://github.com/bcjaeger/aorsf/blob/master/R/check.R#L1078):

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards in function 'check_predict()' on line#1258 of file [R/check.R](https://github.com/bcjaeger/aorsf/blob/master/R/check.R#L1258):

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards in function 'orsf_control_cph()' on line#77 of file [R/orsf_control.R](https://github.com/bcjaeger/aorsf/blob/master/R/orsf_control.R#L77):

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G3.0 Statistical software should never compare floating point numbers for equality. All numeric equality comparisons should either ensure that they are made between integers, or use appropriate tolerances for approximate equality.* 

- ML2.4 Default values of all transformations should be explicitly documented, both in documentation of parameters where appropriate (such as for numeric transformations), and in extended documentation such as vignettes.

- ML2.5 ML software should provide options to bypass or otherwise switch off all default transformations.

- ML3.5 Parameters controlling optimization algorithms should minimally include:

- ML3.5a Specification of the type of algorithm used to explore the search space (commonly, for example, some kind of gradient descent algorithm)

- ML3.6 Unless explicitly justified otherwise (for example because ML software under consideration is an implementation of one specific algorithm), ML software should:

- ML3.6a Implement or otherwise permit usage of multiple ways of exploring search space

Standards in function 'orsf_control_net()' on line#141 of file [R/orsf_control.R](https://github.com/bcjaeger/aorsf/blob/master/R/orsf_control.R#L141):

- ML3.5a Specification of the type of algorithm used to explore the search space (commonly, for example, some kind of gradient descent algorithm)

- ML3.6b Implement or otherwise permit usage of multiple loss functions.* 

Standards in function 'orsf()' on line#414 of file [R/orsf_fit.R](https://github.com/bcjaeger/aorsf/blob/master/R/orsf_fit.R#L414):

- G1.0 Statistical Software should list at least one primary reference from published academic literature.* 

- G1.1 Statistical Software should document whether the algorithm(s) it implements are:* - *The first implementation of a novel algorithm*; or - *The first implementation within **R** of an algorithm which has previously been implemented in other languages or contexts*; or - *An improvement on other implementations of similar algorithms in **R***. 

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G1.5 Software should include all code necessary to reproduce results which form the basis of performance claims made in associated publications.* 

- G1.6 Software should include code necessary to compare performance claims with alternative implementations in other R packages.* 

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- G2.11 Software should ensure that `data.frame`-like tabular objects which have columns which do not themselves have standard class attributes (typically, `vector`) are appropriately processed, and do not error without reason. This behaviour should be tested. Again, columns created by the [`units` package](https://github.com/r-quantities/units/) provide a good test case.

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.4a explicit conversion to `integer` via `as.integer()`

- G2.5 Where inputs are expected to be of `factor` type, secondary documentation should explicitly state whether these should be `ordered` or not, and those inputs should provide appropriate error or other routines to ensure inputs follow these expectations.* 

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

- ML1.0 Documentation should make a clear conceptual distinction between training and test data (even where such may ultimately be confounded as described above.)

- ML1.1 Absent clear justification for alternative design decisions, input data should be expected to be labelled "test", "training", and, where applicable, "validation" data.

- ML1.3 Input data should be clearly partitioned between training and test data (for example, through having each passed as a distinct `list` item), or should enable an additional means of categorically distinguishing training from test data (such as via an additional parameter which provides explicit labels). Where applicable, distinction of validation and any other data should also accord with this standard.* 

- ML1.6 ML software which does not admit missing values, and which expects no missing values, should implement explicit pre-processing routines to identify whether data has any missing values, and should generally error appropriately and informatively when passed data with missing values. In addition, ML software which does not admit missing values should:

- ML1.6a Explain why missing values are not admitted.

- ML1.6b Provide explicit examples (in function documentation, vignettes, or both) for how missing values may be imputed, rather than simply discarded.

- ML2.0 A dedicated function should enable pre-processing steps to be defined and parametrized.

- ML2.0b Absent explicit justification otherwise, that return object should have a defined class minimally intended to implement a default `print` method which summarizes the input data set (as per **ML1.5** above) and associated transformations (see the following standard).* 

- ML2.3 The values associated with all transformations should be recorded in the object returned by the function described in the preceding standard (**ML2.0**).

- ML3.0 Model specification should be implemented as a distinct stage subsequent to specification of pre-processing routines (see Section 2, above) and prior to actual model fitting or training (see Section 4, below). In particular,

- ML3.0a A dedicated function should enable models to be specified without actually fitting or training them, or if this (**ML3**) and the following (**ML4**) stages are controlled by a single function, that function should have a parameter enabling models to be specified yet not fitted (for example, `nofit = FALSE`).

- ML3.0c The function described above (**ML3.0a**) should return an object which can be directly trained as described in the following sub-section (**ML4**).

- ML3.3 Where ML software implements its own distinct classes of model objects, the properties and behaviours of those specific classes of objects should be explicitly compared with objects produced by other ML software. In particular, where possible, ML software should provide extended documentation (as vignettes or equivalent) comparing model objects with those from other ML software, noting both unique abilities and restrictions of any implemented classes.

- ML3.5b The kind of loss function used to assess distance between model estimates and desired output.

- ML4.0 ML software should generally implement a unified single-function interface to model training, able to receive as input a model specified according to all preceding standards. In particular, models with categorically different specifications, such as different model architectures or optimization algorithms, should be able to be submitted to the same model training function.

- ML4.1 ML software should at least optionally retain explicit information on paths taken as an optimizer advances towards minimal loss. Such information should minimally include:

- ML4.1a Specification of all model-internal parameters, or equivalent hashed representation.

- ML4.1b The value of the loss function at each point

- ML4.2 The subsequent extraction of information retained according to the preceding standard should be explicitly documented, including through example code.* 

- ML5.0 The result of applying the training processes described above should be contained within a single model object returned by the function defined according to **ML4.0**, above. Even where the output reflects application to a test data set, the resultant object need not include any information on model performance (see **ML5.3**--**ML5.4**, below).

- ML5.0a That object should either have its own class, or extend some previously-defined class.

- ML5.2 The structure and functionality of objects representing trained ML models should be thoroughly documented. In particular,

- ML5.2a Either all functionality extending from the class of model object should be explicitly documented, or a method for listing or otherwise accessing all associated functionality explicitly documented and demonstrated in example code.

- ML5.2b Documentation should include examples of how to save and re-load trained model objects for their re-use in accordance with **ML3.1**, above.

- ML5.3 Assessment of model performance should be implemented as one or more functions distinct from model training.

- ML5.4 Model performance should be able to be assessed according to a variety of metrics.

- ML5.4a All model performance metrics represented by functions internal to a package must be clearly and distinctly documented.

- ML5.4b It should be possible to submit custom metrics to a model assessment function, and the ability to do so should be clearly documented including through example code.* 

- ML6.0 Descriptions of ML software should make explicit reference to a workflow which separates training and testing stages, and which clearly indicates a need for distinct training and test data sets.* 

- ML6.1 ML software intentionally designed to address only a restricted subset of the workflow described here should clearly document how it can be embedded within a typical full ML workflow in the sense considered here.

- ML6.1a Such demonstrations should include and contrast embedding within a full workflow using at least two other packages to implement that workflow.* 

Standards in function 'orsf_train()' on line#853 of file [R/orsf_fit.R](https://github.com/bcjaeger/aorsf/blob/master/R/orsf_fit.R#L853):

- ML2.0a That function should return an object which can be directly submitted to a specified model (see section 3, below).

Standards in function 'orsf_time_to_train()' on line#897 of file [R/orsf_fit.R](https://github.com/bcjaeger/aorsf/blob/master/R/orsf_fit.R#L897):

- ML4.5 ML software may optionally include a function to estimate likely time to train a specified model, through estimating initial timings from a small sample of the full batch.

Standards in function 'orsf_pd_summary()' on line#81 of file [R/orsf_pd.R](https://github.com/bcjaeger/aorsf/blob/master/R/orsf_pd.R#L81):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

Standards in function 'predict.aorsf()' on line#59 of file [R/orsf_predict.R](https://github.com/bcjaeger/aorsf/blob/master/R/orsf_predict.R#L59):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- ML1.1 Absent clear justification for alternative design decisions, input data should be expected to be labelled "test", "training", and, where applicable, "validation" data.

Standards in function 'print.aorsf()' on line#25 of file [R/orsf_print.R](https://github.com/bcjaeger/aorsf/blob/master/R/orsf_print.R#L25):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- ML3.0d That return object should have a defined class minimally intended to implement a default `print` method which summarises the model specification, including values of all relevant parameters.

- ML5.0b That class should have a defined `print` method which summarises important aspects of the model object, including but not limited to summaries of input data and algorithmic control parameters.

Standards in function 'orsf_scale_cph()' on line#52 of file [R/orsf_scale_cph.R](https://github.com/bcjaeger/aorsf/blob/master/R/orsf_scale_cph.R#L52):

- ML2.6 Where transformations are implemented via distinct functions, these should be exported to a package's namespace so they can be applied in other contexts.

- ML2.7 Where possible, documentation should be provided for how transformations may be reversed. For example, documentation may demonstrate how the values retained via **ML2.3**, above, can be used along with transformations either exported via **ML2.6** or otherwise exemplified in demonstration code to independently transform data, and then to reverse those transformations.* 

Standards in function 'orsf_summarize_uni()' on line#30 of file [R/orsf_summary.R](https://github.com/bcjaeger/aorsf/blob/master/R/orsf_summary.R#L30):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

Standards in function 'print.aorsf_summary_uni()' on line#200 of file [R/orsf_summary.R](https://github.com/bcjaeger/aorsf/blob/master/R/orsf_summary.R#L200):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

Standards in function 'orsf_vi_()' on line#73 of file [R/orsf_vi.R](https://github.com/bcjaeger/aorsf/blob/master/R/orsf_vi.R#L73):

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

Standards in function 'select_cols.data.frame()' on line#22 of file [R/select_cols.R](https://github.com/bcjaeger/aorsf/blob/master/R/select_cols.R#L22):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 



### tests directory



Standards in  on line#6 of file [tests/testthat/test-leaf_kaplan.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-leaf_kaplan.R#L6):

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

Standards in  on line#33 of file [tests/testthat/test-leaf_kaplan.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-leaf_kaplan.R#L33):

- G5.5 Correctness tests should be run with a fixed random seed

Standards in  on line#7 of file [tests/testthat/test-lrt_multi.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-lrt_multi.R#L7):

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

- G5.5 Correctness tests should be run with a fixed random seed

Standards in  on line#13 of file [tests/testthat/test-lrt_multi.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-lrt_multi.R#L13):

- G5.6 *Parameter recovery tests** *to test that the implementation produce expected results given data with known properties. For instance, a linear regression algorithm should return expected coefficient values for a simulated data set generated from a linear model.

- ML7.8 ML software should explicitly test different loss functions, even where software is intended to implement one specific measure of loss.

Standards in  on line#15 of file [tests/testthat/test-newtraph_cph.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-newtraph_cph.R#L15):

- G5.0 Where applicable or practicable, tests should use standard data sets with known properties (for example, the [NIST Standard Reference Datasets](https://www.itl.nist.gov/div898/strd/), or data sets provided by other widely-used R packages).

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

- G5.6 *Parameter recovery tests** *to test that the implementation produce expected results given data with known properties. For instance, a linear regression algorithm should return expected coefficient values for a simulated data set generated from a linear model.

- ML7.10 The successful extraction of information on paths taken by optimizers (see **ML5.1**, above), should be tested, including testing the general properties, but not necessarily actual values of, such data.* 

- ML7.7 ML software should explicitly test different optimization algorithms, even where software is intended to implement one specific algorithm.

Standards in  on line#78 of file [tests/testthat/test-newtraph_cph.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-newtraph_cph.R#L78):

- G5.6a Parameter recovery tests should generally be expected to succeed within a defined tolerance rather than recovering exact values.

Standards in  on line#115 of file [tests/testthat/test-newtraph_cph.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-newtraph_cph.R#L115):

- G5.6a Parameter recovery tests should generally be expected to succeed within a defined tolerance rather than recovering exact values.

Standards in  on line#7 of file [tests/testthat/test-orsf_control.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-orsf_control.R#L7):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

Standards in  on line#53 of file [tests/testthat/test-orsf_fit.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-orsf_fit.R#L53):

- G5.0 Where applicable or practicable, tests should use standard data sets with known properties (for example, the [NIST Standard Reference Datasets](https://www.itl.nist.gov/div898/strd/), or data sets provided by other widely-used R packages).

Standards in  on line#75 of file [tests/testthat/test-orsf_fit.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-orsf_fit.R#L75):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

Standards in  on line#140 of file [tests/testthat/test-orsf_fit.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-orsf_fit.R#L140):

- G5.8b Data of unsupported types (e.g., character or complex numbers in for functions designed only for numeric data)

- G5.8b Data of unsupported types (e.g., character or complex numbers in for functions designed only for numeric data)

Standards in  on line#173 of file [tests/testthat/test-orsf_fit.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-orsf_fit.R#L173):

- G2.11 Software should ensure that `data.frame`-like tabular objects which have columns which do not themselves have standard class attributes (typically, `vector`) are appropriately processed, and do not error without reason. This behaviour should be tested. Again, columns created by the [`units` package](https://github.com/r-quantities/units/) provide a good test case.

Standards in  on line#235 of file [tests/testthat/test-orsf_fit.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-orsf_fit.R#L235):

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

Standards in  on line#298 of file [tests/testthat/test-orsf_fit.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-orsf_fit.R#L298):

- G5.7 *Algorithm performance tests** *to test that implementation performs as expected as properties of data change. For instance, a test may show that parameters approach correct estimates within tolerance as data size increases, or that convergence times decrease for higher convergence thresholds.

Standards in  on line#365 of file [tests/testthat/test-orsf_fit.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-orsf_fit.R#L365):

- ML7.11 All performance metrics available for a given class of trained model should be thoroughly tested and compared.

Standards in  on line#383 of file [tests/testthat/test-orsf_fit.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-orsf_fit.R#L383):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8a Zero-length data

Standards in  on line#402 of file [tests/testthat/test-orsf_fit.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-orsf_fit.R#L402):

- G5.8c Data with all-`NA` fields or columns or all identical fields or columns

- G5.8c Data with all-`NA` fields or columns or all identical fields or columns

Standards in  on line#417 of file [tests/testthat/test-orsf_fit.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-orsf_fit.R#L417):

- G5.9 *Noise susceptibility tests** *Packages should test for expected stochastic behaviour, such as through the following conditions:

- G5.9a Adding trivial noise (for example, at the scale of `.Machine$double.eps`) to data does not meaningfully change results

- G5.9b Running under different random seeds or initial conditions does not meaningfully change results* 

Standards in  on line#444 of file [tests/testthat/test-orsf_fit.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-orsf_fit.R#L444):

- ML7.1 Tests should demonstrate effects of different numeric scaling of input data (see **ML2.2**).

Standards in  on line#675 of file [tests/testthat/test-orsf_fit.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-orsf_fit.R#L675):

- ML7.9 Tests should explicitly compare all possible combinations in categorical differences in model architecture, such as different model architectures with same optimization algorithms, same model architectures with different optimization algorithms, and differences in both.

- ML7.9a Such combinations will generally be formed from multiple categorical factors, for which explicit use of functions such as [`expand.grid()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/expand.grid.html) is recommended.* 

Standards in  on line#789 of file [tests/testthat/test-orsf_fit.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-orsf_fit.R#L789):

- G2.12 Software should ensure that `data.frame`-like tabular objects which have list columns should ensure that those columns are appropriately pre-processed either through being removed, converted to equivalent vector columns where appropriate, or some other appropriate treatment such as an informative error. This behaviour should be tested.* 

Standards in  on line#39 of file [tests/testthat/test-orsf_pd.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-orsf_pd.R#L39):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

Standards in  on line#56 of file [tests/testthat/test-orsf_pd.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-orsf_pd.R#L56):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

Standards in  on line#91 of file [tests/testthat/test-orsf_pd.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-orsf_pd.R#L91):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8d Data outside the scope of the algorithm (for example, data with more fields (columns) than observations (rows) for some regression algorithms)

Standards in  on line#123 of file [tests/testthat/test-orsf_pd.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-orsf_pd.R#L123):

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

Standards in  on line#6 of file [tests/testthat/test-orsf_predict.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-orsf_predict.R#L6):

- G5.5 Correctness tests should be run with a fixed random seed

Standards in  on line#45 of file [tests/testthat/test-orsf_predict.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-orsf_predict.R#L45):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8a Zero-length data

Standards in  on line#64 of file [tests/testthat/test-orsf_predict.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-orsf_predict.R#L64):

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

Standards in  on line#89 of file [tests/testthat/test-orsf_predict.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-orsf_predict.R#L89):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

Standards in  on line#214 of file [tests/testthat/test-orsf_predict.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-orsf_predict.R#L214):

- G2.11 Software should ensure that `data.frame`-like tabular objects which have columns which do not themselves have standard class attributes (typically, `vector`) are appropriately processed, and do not error without reason. This behaviour should be tested. Again, columns created by the [`units` package](https://github.com/r-quantities/units/) provide a good test case.

- G5.5 Correctness tests should be run with a fixed random seed

Standards in  on line#38 of file [tests/testthat/test-orsf_summary.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-orsf_summary.R#L38):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

Standards in  on line#5 of file [tests/testthat/test-ostree_pred_leaf.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-ostree_pred_leaf.R#L5):

- G5.4a For new methods, it can be difficult to separate out correctness of the method from the correctness of the implementation, as there may not be reference for comparison. In this case, testing may be implemented against simple, trivial cases or against multiple implementations such as an initial R implementation compared with results from a C/C++ implementation.

- G5.5 Correctness tests should be run with a fixed random seed

Standards in  on line#22 of file [tests/testthat/test-ostree_pred_leaf.R](https://github.com/bcjaeger/aorsf/blob/master/tests/testthat/test-ostree_pred_leaf.R#L22):

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

- G5.6a Parameter recovery tests should generally be expected to succeed within a defined tolerance rather than recovering exact values.



### root directory



Standards in  on line#17 of file [./README.Rmd](https://github.com/bcjaeger/aorsf/blob/master/./README.Rmd#L17):

- G1.2 Statistical Software should include a* Life Cycle Statement *describing current and anticipated future states of development.* 



---



## Standards with `srrstatsNA` tag (56 / 158)





### R directory



Standards in  on line#122 of file [R/srr-stats-standards.R](https://github.com/bcjaeger/aorsf/blob/master/R/srr-stats-standards.R#L122):

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.14a error on missing data

- G2.14b ignore missing data with default warnings or messages issued

- G2.14c replace missing data with appropriately imputed values

- G2.4c explicit conversion to character via `as.character()` (and not `paste` or `paste0`)

- G2.4d explicit conversion to factor via `as.factor()`

- G2.4e explicit conversion from factor via `as...()` functions

- G3.1 Statistical software which relies on covariance calculations should enable users to choose between different algorithms for calculating covariances, and should not rely solely on covariances from the `stats::cov` function.

- G3.1a The ability to use arbitrarily specified covariance methods should be documented (typically in examples or vignettes).* 

- G4.0 Statistical Software which enables outputs to be written to local files should parse parameters specifying file names to ensure appropriate file suffices are automatically generated where not provided.* 

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

- G5.10 Extended tests should included and run under a common framework with other tests but be switched on by flags such as as a `<MYPKG>_EXTENDED_TESTS=1` environment variable.

- G5.11 Where extended tests require large data sets or other assets, these should be provided for downloading and fetched as part of the testing workflow.

- G5.11a When any downloads of additional data necessary for extended tests fail, the tests themselves should not fail, rather be skipped and implicitly succeed with an appropriate diagnostic message.

- G5.12 Any conditions necessary to run extended tests such as platform requirements, memory, expected runtime, and artefacts produced that may need manual inspection, should be described in developer documentation such as a `CONTRIBUTING.md` or `tests/README.md` file.

- G5.4c Where applicable, stored values may be drawn from published paper outputs when applicable and where code from original implementations is not available

- G5.6b Parameter recovery tests should be run with multiple random seeds when either data simulation or the algorithm contains a random component. (When long-running, such tests may be part of an extended, rather than regular, test suite; see G4.10-4.12, below).* 

- ML1.0a Where these terms are ultimately eschewed, these should nevertheless be used in initial documentation, along with clear explanation of, and justification for, alternative terminology.

- ML1.1a The presence and use of these labels should be explicitly confirmed via pre-processing steps (and tested in accordance with **ML7.0**, below).

- ML1.1b Matches to expected labels should be case-insensitive and based on partial matching such that, for example, "Test", "test", or "testing" should all suffice.* 

- ML1.2 Training and test data sets for ML software should be able to be input as a single, generally tabular, data object, with the training and test data distinguished either by* - *A specified variable containing, for example, `TRUE`/`FALSE` or `0`/`1` values, or which uses some other system such as missing (`NA`) values to denote test data); and/or* - *An additional parameter designating case or row numbers, or labels of test data.* 

- ML1.4 Training and test data sets, along with other necessary components such as validation data sets, should be stored in their own distinctly labelled sub-directories (for distinct files), or according to an explicit and distinct labelling scheme (for example, for database connections). Labelling should in all cases adhere to **ML1.1**, above.* 

- ML1.5 ML software should implement a single function which summarises the contents of test and training (and other) data sets, minimally including counts of numbers of cases, records, or files, and potentially extending to tables or summaries of file or data types, sizes, and other information (such as unique hashes for each component).* 

- ML1.7 ML software which admits missing values should clearly document how such values are processed.

- ML1.7a Where missing values are imputed, software should offer multiple user-defined ways to impute missing data.

- ML1.7b Where missing values are imputed, the precise imputation steps should also be explicitly documented, either in tests (see **ML7.2** below), function documentation, or vignettes.

- ML1.8 ML software should enable equal treatment of missing values for both training and test data, with optional user ability to control application to either one or both.* 

- ML2.1 ML software which uses broadcasting to reconcile dimensionally incommensurate input data should offer an ability to at least optionally record transformations applied to each input file.* 

- ML2.2 ML software which requires or relies upon numeric transformations of input data (such as change in mean values or variances) should allow optimal explicit specification of target values, rather than restricting transformations to default generic values only (such as transformations to z-scores).

- ML2.2a Where the parameters have default values, reasons for those particular defaults should be explicitly described.

- ML2.2b Any extended documentation (such as vignettes) which demonstrates the use of explicit values for numeric transformations should explicitly describe why particular values are used.* 

- ML3.0b That function should accept as input the objects produced by the previous Input Data Specification stage, and defined according to **ML2.0**, above.

- ML3.1 ML software should allow the use of both untrained models, specified through model parameters only, as well as pre-trained models. Use of the latter commonly entails an ability to submit a previously-trained model object to the function defined according to **ML3.0a**, above.

- ML3.2 ML software should enable different models to be applied to the object specifying data inputs and transformations (see sub-sections 1--2, above) without needing to re-define those preceding steps.* 

- ML3.4 Where training rates are used, ML software should provide explicit documentation both in all functions which use training rates, and in extended form such as vignettes, of the importance of, and/or sensitivity to, different values of training rates. In particular,

- ML3.4a Unless explicitly justified otherwise, ML software should offer abilities to automatically determine appropriate or optimal training rates, either as distinct pre-processing stages, or as implicit stages of model training.

- ML3.4b ML software which provides default values for training rates should clearly document anticipated restrictions of validity of those default values; for example through clear suggestions that user-determined and -specified values may generally be necessary or preferable.* 

- ML3.7 For ML software in which algorithms are coded in C++, user-controlled use of either CPUs or GPUs (on NVIDIA processors at least) should be implemented through direct use of [`libcudacxx`](https://github.com/NVIDIA/libcudacxx).* 

- ML4.1c Information used to advance to next point, for example quantification of local gradient.

- ML4.3 All parameters controlling batch processing and associated terminology should be explicitly documented, and it should not, for example, be presumed that users will understand the definition of "epoch" as implemented in any particular ML software.* 

- ML4.4 Explicit guidance should be provided on selection of appropriate values for parameter controlling batch processing, for example, on trade-offs between batch sizes and numbers of epochs (with both terms provided as Control Parameters in accordance with the preceding standard, **ML3**).

- ML4.6 ML software should by default provide explicit information on the progress of batch jobs (even where those jobs may be implemented in parallel on GPUs). That information may be optionally suppressed through additional parameters.* 

- ML4.7 ML software should provide an ability to combine results from multiple re-sampling iterations using a single parameter specifying numbers of iterations.

- ML4.8 Absent any additional specification, re-sampling algorithms should by default partition data according to proportions of original test and training data.

- ML4.8a Re-sampling routines of ML software should nevertheless offer an ability to explicitly control or override such default proportions of test and training data.* 

- ML5.1 As for the untrained model objects produced according to the above standards, and in particular as a direct extension of **ML3.3**, the properties and behaviours of trained models produced by ML software should be explicitly compared with equivalent objects produced by other ML software. (Such comparison will generally be done in terms of comparing model performance, as described in the following standard **ML5.3**--**ML5.4**).

- ML5.2c Where general functions for saving or serializing objects, such as [`saveRDS`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/readRDS.html) are not appropriate for storing local copies of trained models, an explicit function should be provided for that purpose, and should be demonstrated with example code.* 

- ML7.0 Test should explicitly confirm partial and case-insensitive matching of "test", "train", and, where applicable, "validation" data.

- ML7.11a Tests which compare metrics should do so over a range of inputs (generally implying differently trained models) to demonstrate relative advantages and disadvantages of different metrics.

- ML7.2 For software which imputes missing data, tests should compare internal imputation with explicit code which directly implements imputation steps (even where such imputation is a single-step implemented via some external package). These tests serve as an explicit reference for how imputation is performed.* 

- ML7.3 Where model objects are implemented as distinct classes, tests should explicitly compare the functionality of these classes with functionality of equivalent classes for ML model objects from other packages.

- ML7.3a These tests should explicitly identify restrictions on the functionality of model objects in comparison with those of other packages.

- ML7.3b These tests should explicitly identify functional advantages and unique abilities of the model objects in comparison with those of other packages.* 

- ML7.4 ML software should explicit document the effects of different training rates, and in particular should demonstrate divergence from optima with inappropriate training rates.

- ML7.5 ML software which implements routines to determine optimal training rates (see **ML3.4**, above) should implement tests to confirm the optimality of resultant values.

- ML7.6 ML software which implement independent training "epochs" should demonstrate in tests the effects of lesser versus greater numbers of epochs.



---



