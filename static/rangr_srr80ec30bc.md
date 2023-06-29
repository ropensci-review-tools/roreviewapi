# srr report for [rangr](https://github.com/popecol/rangr)



[Click here for full text of all standards](https://stats-devguide.ropensci.org/standards.html)







## Standards with `srrstats` tag



**Numbers of standards:**

-  G :  33  /  68

-  SP :  23  /  45

- Total : 56 / 113





### R directory



Standards in  on line#24 of file [R/data.R](https://github.com/popecol/rangr/blob/main/R/data.R#L24):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

Standards in  on line#56 of file [R/data.R](https://github.com/popecol/rangr/blob/main/R/data.R#L56):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

Standards in  on line#81 of file [R/data.R](https://github.com/popecol/rangr/blob/main/R/data.R#L81):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

Standards in  on line#105 of file [R/data.R](https://github.com/popecol/rangr/blob/main/R/data.R#L105):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

Standards in  on line#128 of file [R/data.R](https://github.com/popecol/rangr/blob/main/R/data.R#L128):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

Standards in function 'observations_points()' on line#151 of file [R/data.R](https://github.com/popecol/rangr/blob/main/R/data.R#L151):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

Standards in function 'disp()' on line#95 of file [R/disp.R](https://github.com/popecol/rangr/blob/main/R/disp.R#L95):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

- SP2.6 Spatial Software should explicitly document the types and classes of input data able to be passed to each function.

Standards in function 'dists_tab()' on line#184 of file [R/disp.R](https://github.com/popecol/rangr/blob/main/R/disp.R#L184):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

Standards in function 'sq_disp()' on line#217 of file [R/disp.R](https://github.com/popecol/rangr/blob/main/R/disp.R#L217):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

Standards in function 'target_ids_in_disp()' on line#286 of file [R/disp.R](https://github.com/popecol/rangr/blob/main/R/disp.R#L286):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- SP2.6 Spatial Software should explicitly document the types and classes of input data able to be passed to each function.

Standards in function 'one_dist_sq_disp()' on line#347 of file [R/disp.R](https://github.com/popecol/rangr/blob/main/R/disp.R#L347):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

Standards in function 'get_observations()' on line#142 of file [R/get_observations.R](https://github.com/popecol/rangr/blob/main/R/get_observations.R#L142):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.3 For univariate character input:

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

- SP2.6 Spatial Software should explicitly document the types and classes of input data able to be passed to each function.

- SP2.7 Spatial Software should implement validation routines to confirm that inputs are of acceptable classes (or represented in otherwise appropriate ways for software which does not use class systems).

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards in function 'get_observations_random()' on line#202 of file [R/get_observations.R](https://github.com/popecol/rangr/blob/main/R/get_observations.R#L202):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

Standards in function 'get_observations_from_data()' on line#269 of file [R/get_observations.R](https://github.com/popecol/rangr/blob/main/R/get_observations.R#L269):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

Standards in function 'get_observations_monitoring_based()' on line#320 of file [R/get_observations.R](https://github.com/popecol/rangr/blob/main/R/get_observations.R#L320):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

Standards in function 'exponential()' on line#44 of file [R/growth_functions.R](https://github.com/popecol/rangr/blob/main/R/growth_functions.R#L44):

- G1.0 Statistical Software should list at least one primary reference from published academic literature.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

Standards in function 'initialise()' on line#153 of file [R/initialise.R](https://github.com/popecol/rangr/blob/main/R/initialise.R#L153):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.3 For univariate character input:

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- SP1.0 Spatial software should explicitly indicate its domain of applicability, and in particular distinguish whether the software may be applied in Cartesian/rectilinear/geometric domains, curvilinear/geographic domains, or both.* 

- SP1.1 Spatial software should explicitly indicate its dimensional domain of applicability, in particular through identifying whether it is applicable to two or three dimensions only, or whether there are any other restrictions on dimensionality.* 

- SP2.0 Spatial software should only accept input data of one or more classes explicitly developed to represent such data.

- SP2.0b Class systems should ensure that functions error appropriately, rather than merely warning, in response to data from inappropriate spatial domains.* 

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

- SP2.6 Spatial Software should explicitly document the types and classes of input data able to be passed to each function.

- SP2.7 Spatial Software should implement validation routines to confirm that inputs are of acceptable classes (or represented in otherwise appropriate ways for software which does not use class systems).

- SP2.8 Spatial Software should implement a single pre-processing routine to validate input data, and to appropriately transform it to a single uniform type to be passed to all subsequent data-processing functions.

- SP2.9 The pre-processing function described above should maintain those metadata attributes of input data which are relevant or important to core algorithms or return values.* 

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards in function 'K_n1_map_check()' on line#357 of file [R/initialise.R](https://github.com/popecol/rangr/blob/main/R/initialise.R#L357):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

Standards in function 'K_get_init_values()' on line#390 of file [R/initialise.R](https://github.com/popecol/rangr/blob/main/R/initialise.R#L390):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

Standards in function 'calc_dist()' on line#423 of file [R/initialise.R](https://github.com/popecol/rangr/blob/main/R/initialise.R#L423):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

Standards in function 'dist_list()' on line#459 of file [R/initialise.R](https://github.com/popecol/rangr/blob/main/R/initialise.R#L459):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

Standards in function 'target_ids()' on line#521 of file [R/initialise.R](https://github.com/popecol/rangr/blob/main/R/initialise.R#L521):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

Standards in function 'ncell_in_circle()' on line#578 of file [R/initialise.R](https://github.com/popecol/rangr/blob/main/R/initialise.R#L578):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

Standards in function 'K_get_interpolation()' on line#70 of file [R/K_get_interpolation.R](https://github.com/popecol/rangr/blob/main/R/K_get_interpolation.R#L70):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- SP1.1 Spatial software should explicitly indicate its dimensional domain of applicability, in particular through identifying whether it is applicable to two or three dimensions only, or whether there are any other restrictions on dimensionality.* 

- SP2.0 Spatial software should only accept input data of one or more classes explicitly developed to represent such data.

- SP2.0b Class systems should ensure that functions error appropriately, rather than merely warning, in response to data from inappropriate spatial domains.* 

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

- SP2.6 Spatial Software should explicitly document the types and classes of input data able to be passed to each function.

- SP4.0 Return values should either:

- SP4.0a Be in same class as input data, or

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards in function 'K_check()' on line#104 of file [R/K_get_interpolation.R](https://github.com/popecol/rangr/blob/main/R/K_get_interpolation.R#L104):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- G2.9 Software should issue diagnostic messages for type conversion in which information is lost (such as conversion of variables from factor to character; standardisation of variable names; or removal of meta-data such as those associated with [`sf`-format](https://r-spatial.github.io/sf/) data) or added (such as insertion of variable or column names where none were provided).* 

- SP2.7 Spatial Software should implement validation routines to confirm that inputs are of acceptable classes (or represented in otherwise appropriate ways for software which does not use class systems).

Standards in function 'K_interpolate()' on line#203 of file [R/K_get_interpolation.R](https://github.com/popecol/rangr/blob/main/R/K_get_interpolation.R#L203):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

Standards in function 'plot.sim_results()' on line#46 of file [R/plot.sim_results.R](https://github.com/popecol/rangr/blob/main/R/plot.sim_results.R#L46):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.3 For univariate character input:

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

- SP2.6 Spatial Software should explicitly document the types and classes of input data able to be passed to each function.

- SP5.0 Implement default `plot` methods for any implemented class system.

Standards in function 'print.sim_data()' on line#31 of file [R/print.sim_data.R](https://github.com/popecol/rangr/blob/main/R/print.sim_data.R#L31):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

Standards in function 'print.sim_results()' on line#31 of file [R/print.sim_results.R](https://github.com/popecol/rangr/blob/main/R/print.sim_results.R#L31):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

Standards in function 'sim()' on line#131 of file [R/sim.R](https://github.com/popecol/rangr/blob/main/R/sim.R#L131):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

- SP2.6 Spatial Software should explicitly document the types and classes of input data able to be passed to each function.

- SP2.7 Spatial Software should implement validation routines to confirm that inputs are of acceptable classes (or represented in otherwise appropriate ways for software which does not use class systems).

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards in function 'get_K()' on line#322 of file [R/sim.R](https://github.com/popecol/rangr/blob/main/R/sim.R#L322):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

Standards in function 'extinction_check()' on line#357 of file [R/sim.R](https://github.com/popecol/rangr/blob/main/R/sim.R#L357):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files.* 

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

Standards in  on line#15 of file [R/srr-stats-standards.R](https://github.com/popecol/rangr/blob/main/R/srr-stats-standards.R#L15):

- G1.1 Statistical Software should document whether the algorithm(s) it implements are:* - *The first implementation of a novel algorithm*; or - *The first implementation within **R** of an algorithm which has previously been implemented in other languages or contexts*; or - *An improvement on other implementations of similar algorithms in **R***. 

- G1.2 Statistical Software should include a* Life Cycle Statement *describing current and anticipated future states of development.* 

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G3.0 Statistical software should never compare floating point numbers for equality. All numeric equality comparisons should either ensure that they are made between integers, or use appropriate tolerances for approximate equality.* 

- SP2.1 Spatial Software should not use the [`sp` package](https://cran.r-project.org/package=sp), rather should use [`sf`](https://cran.r-project.org/package=sf).* 

- SP2.2 Geographical Spatial Software should ensure maximal compatibility with established packages and workflows, minimally through:

- SP2.2a Clear and extensive documentation demonstrating how routines from that software may be embedded within, or otherwise adapted to, workflows which rely on these established packages; and

- SP2.2b Tests which clearly demonstrate that routines from that software may be successfully translated into forms and workflows which rely on these established packages.* 

- SP2.4 Geographical Spatial Software should be compliant with version 6 or larger of* [`PROJ`](https://proj.org/), *and with* `WKT2` *representations. The primary implication, described in detail in the articles linked to above, is that:

- SP2.4a Software should not permit coordinate reference systems to be represented merely by so-called "PROJ4-strings", but should use at least WKT2.* 

- SP2.5 Class systems for input data must contain meta data on associated coordinate reference systems.

Standards in function 'subset.sim_results()' on line#47 of file [R/subset.sim_results.R](https://github.com/popecol/rangr/blob/main/R/subset.sim_results.R#L47):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

Standards in function 'summary.sim_data()' on line#32 of file [R/summary.sim_data.R](https://github.com/popecol/rangr/blob/main/R/summary.sim_data.R#L32):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

Standards in function 'print.summary.sim_data()' on line#99 of file [R/summary.sim_data.R](https://github.com/popecol/rangr/blob/main/R/summary.sim_data.R#L99):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

Standards in function 'summary.sim_results()' on line#33 of file [R/summary.sim_results.R](https://github.com/popecol/rangr/blob/main/R/summary.sim_results.R#L33):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

Standards in function 'print.summary.sim_results()' on line#102 of file [R/summary.sim_results.R](https://github.com/popecol/rangr/blob/main/R/summary.sim_results.R#L102):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

Standards in function 'to_rast()' on line#62 of file [R/to_rast.R](https://github.com/popecol/rangr/blob/main/R/to_rast.R#L62):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.9 Software should issue diagnostic messages for type conversion in which information is lost (such as conversion of variables from factor to character; standardisation of variable names; or removal of meta-data such as those associated with [`sf`-format](https://r-spatial.github.io/sf/) data) or added (such as insertion of variable or column names where none were provided).* 

- SP2.0a Where new classes are implemented, conversion to other common classes for spatial data in R should be documented.

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

- SP2.6 Spatial Software should explicitly document the types and classes of input data able to be passed to each function.

- SP2.7 Spatial Software should implement validation routines to confirm that inputs are of acceptable classes (or represented in otherwise appropriate ways for software which does not use class systems).

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards in function 'update.sim_data()' on line#40 of file [R/update.sim_data.R](https://github.com/popecol/rangr/blob/main/R/update.sim_data.R#L40):

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 



### tests directory



Standards in  on line#7 of file [tests/testthat/generate_test_data.R](https://github.com/popecol/rangr/blob/main/tests/testthat/generate_test_data.R#L7):

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

Standards in  on line#1 of file [tests/testthat/test-get_observations.R](https://github.com/popecol/rangr/blob/main/tests/testthat/test-get_observations.R#L1):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8a Zero-length data

- G5.8b Data of unsupported types (e.g., character or complex numbers in for functions designed only for numeric data)

- G5.8c Data with all-`NA` fields or columns or all identical fields or columns

Standards in  on line#1 of file [tests/testthat/test-growth_functions.R](https://github.com/popecol/rangr/blob/main/tests/testthat/test-growth_functions.R#L1):

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4a For new methods, it can be difficult to separate out correctness of the method from the correctness of the implementation, as there may not be reference for comparison. In this case, testing may be implemented against simple, trivial cases or against multiple implementations such as an initial R implementation compared with results from a C/C++ implementation.

Standards in  on line#1 of file [tests/testthat/test-initialise.R](https://github.com/popecol/rangr/blob/main/tests/testthat/test-initialise.R#L1):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8c Data with all-`NA` fields or columns or all identical fields or columns

- G5.8d Data outside the scope of the algorithm (for example, data with more fields (columns) than observations (rows) for some regression algorithms)

Standards in  on line#11 of file [tests/testthat/test-K_get_interpolation.R](https://github.com/popecol/rangr/blob/main/tests/testthat/test-K_get_interpolation.R#L11):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8a Zero-length data

- G5.8b Data of unsupported types (e.g., character or complex numbers in for functions designed only for numeric data)

- G5.8c Data with all-`NA` fields or columns or all identical fields or columns

Standards in  on line#1 of file [tests/testthat/test-sim.R](https://github.com/popecol/rangr/blob/main/tests/testthat/test-sim.R#L1):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4a For new methods, it can be difficult to separate out correctness of the method from the correctness of the implementation, as there may not be reference for comparison. In this case, testing may be implemented against simple, trivial cases or against multiple implementations such as an initial R implementation compared with results from a C/C++ implementation.



### root directory



Standards in  on line#70 of file [./README.Rmd](https://github.com/popecol/rangr/blob/main/./README.Rmd#L70):

- SP1.0 Spatial software should explicitly indicate its domain of applicability, and in particular distinguish whether the software may be applied in Cartesian/rectilinear/geometric domains, curvilinear/geographic domains, or both.* 



---



## Standards with `srrstatsNA` tag



**Numbers of standards:**

-  G :  35  /  68

-  SP :  22  /  45

- Total : 57 / 113





### R directory



Standards in  on line#57 of file [R/srr-stats-standards.R](https://github.com/popecol/rangr/blob/main/R/srr-stats-standards.R#L57):

- G1.5 Software should include all code necessary to reproduce results which form the basis of performance claims made in associated publications.* 

- G1.6 Software should include code necessary to compare performance claims with alternative implementations in other R packages.* 

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- G2.11 Software should ensure that `data.frame`-like tabular objects which have columns which do not themselves have standard class attributes (typically, `vector`) are appropriately processed, and do not error without reason. This behaviour should be tested. Again, columns created by the [`units` package](https://github.com/r-quantities/units/) provide a good test case.

- G2.12 Software should ensure that `data.frame`-like tabular objects which have list columns should ensure that those columns are appropriately pre-processed either through being removed, converted to equivalent vector columns where appropriate, or some other appropriate treatment such as an informative error. This behaviour should be tested.* 

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.14a error on missing data

- G2.14b ignore missing data with default warnings or messages issued

- G2.14c replace missing data with appropriately imputed values

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4a explicit conversion to `integer` via `as.integer()`

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.4c explicit conversion to character via `as.character()` (and not `paste` or `paste0`)

- G2.4d explicit conversion to factor via `as.factor()`

- G2.4e explicit conversion from factor via `as...()` functions

- G2.5 Where inputs are expected to be of `factor` type, secondary documentation should explicitly state whether these should be `ordered` or not, and those inputs should provide appropriate error or other routines to ensure inputs follow these expectations.* 

- G3.1 Statistical software which relies on covariance calculations should enable users to choose between different algorithms for calculating covariances, and should not rely solely on covariances from the `stats::cov` function.

- G3.1a The ability to use arbitrarily specified covariance methods should be documented (typically in examples or vignettes).* 

- G4.0 Statistical Software which enables outputs to be written to local files should parse parameters specifying file names to ensure appropriate file suffices are automatically generated where not provided.* 

- G5.0 Where applicable or practicable, tests should use standard data sets with known properties (for example, the [NIST Standard Reference Datasets](https://www.itl.nist.gov/div898/strd/), or data sets provided by other widely-used R packages).

- G5.10 Extended tests should included and run under a common framework with other tests but be switched on by flags such as as a `<MYPKG>_EXTENDED_TESTS="true"` environment variable.* - The extended tests can be then run automatically by GitHub Actions for example by adding the following to the `env` section of the workflow: 

- G5.11 Where extended tests require large data sets or other assets, these should be provided for downloading and fetched as part of the testing workflow.

- G5.11a When any downloads of additional data necessary for extended tests fail, the tests themselves should not fail, rather be skipped and implicitly succeed with an appropriate diagnostic message.

- G5.12 Any conditions necessary to run extended tests such as platform requirements, memory, expected runtime, and artefacts produced that may need manual inspection, should be described in developer documentation such as a `CONTRIBUTING.md` or `tests/README.md` file.

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

- G5.4c Where applicable, stored values may be drawn from published paper outputs when applicable and where code from original implementations is not available

- G5.5 Correctness tests should be run with a fixed random seed

- G5.6 *Parameter recovery tests** *to test that the implementation produce expected results given data with known properties. For instance, a linear regression algorithm should return expected coefficient values for a simulated data set generated from a linear model.

- G5.6a Parameter recovery tests should generally be expected to succeed within a defined tolerance rather than recovering exact values.

- G5.6b Parameter recovery tests should be run with multiple random seeds when either data simulation or the algorithm contains a random component. (When long-running, such tests may be part of an extended, rather than regular, test suite; see G4.10-4.12, below).* 

- G5.7 *Algorithm performance tests** *to test that implementation performs as expected as properties of data change. For instance, a test may show that parameters approach correct estimates within tolerance as data size increases, or that convergence times decrease for higher convergence thresholds.

- G5.9 *Noise susceptibility tests** *Packages should test for expected stochastic behaviour, such as through the following conditions:

- G5.9a Adding trivial noise (for example, at the scale of `.Machine$double.eps`) to data does not meaningfully change results

- G5.9b Running under different random seeds or initial conditions does not meaningfully change results* 

- SP2.5a Software which implements new classes to input spatial data (or the spatial components of more general data) should provide an ability to convert such input objects into alternative spatial classes such as those listed above.

- SP3.0 Spatial software which considers spatial neighbours should enable user control over neighbourhood forms and sizes. In particular:

- SP3.0a Neighbours (able to be expressed) on regular grids should be able to be considered in both rectangular only, or rectangular and diagonal (respectively "rook" and "queen" by analogy to chess).

- SP3.0b Neighbourhoods in irregular spaces should be minimally able to be controlled via an integer number of neighbours, an area (or equivalent distance defining an area) in which to include neighbours, or otherwise equivalent user-controlled value.

- SP3.1 Spatial software which considers spatial neighbours should wherever possible enable neighbour contributions to be weighted by distance (or other continuous weighting variable), and not rely exclusively on a uniform-weight rectangular cut-off.

- SP3.2 Spatial software which relies on sampling from input data (even if only of spatial coordinates) should enable sampling procedures to be based on local spatial densities of those input data.* 

- SP3.3 Spatial regression software should explicitly quantify and distinguish autocovariant or autoregressive processes from those covariant or regressive processes not directly related to spatial structure alone.* 

- SP3.4 Where possible, spatial clustering software should avoid using standard non-spatial clustering algorithms in which spatial proximity is merely represented by an additional weighting factor in favour of explicitly spatial algorithms.* 

- SP3.5 Spatial machine learning software should ensure that broadcasting procedures for reconciling inputs of different dimensions are **not** applied*. 

- SP3.6 Spatial machine learning software should document (and, where possible, test) the potential effects of different sampling procedures* 

- SP5.1 Implement appropriate placement of variables along x- and y-axes.

- SP5.2 Ensure that axis labels include appropriate units.* 

- SP5.3 Offer an ability to generate interactive (generally `html`-based) visualisations of results.* 

- SP6.0 Software which implements routines for transforming coordinates of input data should include tests which demonstrate ability to recover the original coordinates.* 

- SP6.1 All functions which can be applied to both Cartesian and curvilinear data should be tested through application to both.

- SP6.1a Functions which may yield inaccurate results when applied to data in one or the other forms (such as the preceding examples of centroids and buffers from ellipsoidal data) should test that results from inappropriate application of those functions are indeed less accurate.

- SP6.1b Functions which yield accurate results regardless of whether input data are rectilinear or curvilinear should demonstrate equivalent accuracy in both cases, and should also demonstrate how equivalent results may be obtained through first explicitly transforming input data.* 

- SP6.2 Geographical Software should include tests with extreme geographical coordinates, minimally including extension to polar extremes of +/-90 degrees.* 

- SP6.3 Spatial Software which considers spatial neighbours should explicitly test all possible ways of defining them, and should explicitly compare quantitative effects of different ways of defining neighbours.

- SP6.4 Spatial Software which considers spatial neighbours should explicitly test effects of different schemes to weight neighbours by spatial proximity.* 

- SP6.5 Spatial Unsupervised Learning Software which uses clustering algorithms should implement tests which explicitly compare results with equivalent results obtained with a non-spatial clustering algorithm.* 

- SP6.6 Spatial Machine Learning Software should implement tests which explicitly demonstrate the detrimental consequences of sampling test and training data from the same spatial region, rather than from spatially distinct regions.



---



