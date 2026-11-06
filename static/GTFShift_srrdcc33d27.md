# srr report for [GTFShift](https://github.com/U-Shift/GTFShift)



[Click here for full text of all standards](https://stats-devguide.ropensci.org/standards.html)







## Standards with `srrstats` tag



**Numbers of standards:**

-  EA :  16  /  34

-  G :  43  /  68

-  SP :  25  /  45

- Total : 84 / 147





### R directory



Standards on line#59 of file [R/calendar_utils.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/R/calendar_utils.R#L59):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

Standards on line#50 of file [R/classify_frequency_los.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/R/classify_frequency_los.R#L50):

- G1.0 Statistical Software should list at least one primary reference from published academic literature.* 

- G1.1 Statistical Software should document whether the algorithm(s) it implements are:* - *The first implementation of a novel algorithm*; or - *The first implementation within **R** of an algorithm which has previously been implemented in other languages or contexts*; or - *An improvement on other implementations of similar algorithms in **R***. 

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.11 Software should ensure that `data.frame`-like tabular objects which have columns which do not themselves have standard class attributes (typically, `vector`) are appropriately processed, and do not error without reason. This behaviour should be tested. Again, columns created by the [`units` package](https://github.com/r-quantities/units/) provide a good test case.

- G2.12 Software should ensure that `data.frame`-like tabular objects which have list columns should ensure that those columns are appropriately pre-processed either through being removed, converted to equivalent vector columns where appropriate, or some other appropriate treatment such as an informative error. This behaviour should be tested.* 

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.3 For univariate character input:

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- EA2.3 Table join operations should not be based on any assumed variable or column names* 

- EA4.0 EDA Software should ensure all return results have types which are consistent with input types.* 

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

Standards on line#35 of file [R/create_calendar.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/R/create_calendar.R#L35):

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G2.4a explicit conversion to `integer` via `as.integer()`

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#79 of file [R/create_shapes_from_sf.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/R/create_shapes_from_sf.R#L79):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.12 Software should ensure that `data.frame`-like tabular objects which have list columns should ensure that those columns are appropriately pre-processed either through being removed, converted to equivalent vector columns where appropriate, or some other appropriate treatment such as an informative error. This behaviour should be tested.* 

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.4b explicit conversion to continuous via `as.numeric()`

- SP1.0 Spatial software should explicitly indicate its domain of applicability, and in particular distinguish whether the software may be applied in Cartesian/rectilinear/geometric domains, curvilinear/geographic domains, or both.* 

- SP1.1 Spatial software should explicitly indicate its dimensional domain of applicability, in particular through identifying whether it is applicable to two or three dimensions only, or whether there are any other restrictions on dimensionality.* 

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

- SP2.4 Geographical Spatial Software should be compliant with version 6 or larger of* [`PROJ`](https://proj.org/), *and with* `WKT2` *representations. The primary implication, described in detail in the articles linked to above, is that:

- SP2.4a Software should not permit coordinate reference systems to be represented merely by so-called "PROJ4-strings", but should use at least WKT2.* 

- SP2.6 Spatial Software should explicitly document the types and classes of input data able to be passed to each function.

- SP2.7 Spatial Software should implement validation routines to confirm that inputs are of acceptable classes (or represented in otherwise appropriate ways for software which does not use class systems).

- SP2.8 Spatial Software should implement a single pre-processing routine to validate input data, and to appropriately transform it to a single uniform type to be passed to all subsequent data-processing functions.

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#38 of file [R/filter_by_mode.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/R/filter_by_mode.R#L38):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

Standards on line#37 of file [R/filter_by_route_name.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/R/filter_by_route_name.R#L37):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

Standards on line#53 of file [R/get_network_extension.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/R/get_network_extension.R#L53):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- SP1.0 Spatial software should explicitly indicate its domain of applicability, and in particular distinguish whether the software may be applied in Cartesian/rectilinear/geometric domains, curvilinear/geographic domains, or both.* 

- SP1.1 Spatial software should explicitly indicate its dimensional domain of applicability, in particular through identifying whether it is applicable to two or three dimensions only, or whether there are any other restrictions on dimensionality.* 

- SP2.4 Geographical Spatial Software should be compliant with version 6 or larger of* [`PROJ`](https://proj.org/), *and with* `WKT2` *representations. The primary implication, described in detail in the articles linked to above, is that:

- SP2.4a Software should not permit coordinate reference systems to be represented merely by so-called "PROJ4-strings", but should use at least WKT2.* 

- SP2.8 Spatial Software should implement a single pre-processing routine to validate input data, and to appropriately transform it to a single uniform type to be passed to all subsequent data-processing functions.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#71 of file [R/get_prioritisation_stats.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/R/get_prioritisation_stats.R#L71):

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.11 Software should ensure that `data.frame`-like tabular objects which have columns which do not themselves have standard class attributes (typically, `vector`) are appropriately processed, and do not error without reason. This behaviour should be tested. Again, columns created by the [`units` package](https://github.com/r-quantities/units/) provide a good test case.

- G2.12 Software should ensure that `data.frame`-like tabular objects which have list columns should ensure that those columns are appropriately pre-processed either through being removed, converted to equivalent vector columns where appropriate, or some other appropriate treatment such as an informative error. This behaviour should be tested.* 

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G2.4b explicit conversion to continuous via `as.numeric()`

- EA3.0 The algorithmic components of EDA Software should enable automated extraction and/or reporting of statistics as some sufficiently "meta" level (such as variable or model selection), for which previous or reference implementations require manual intervention.

- EA3.1 EDA software should enable standardised comparison of inputs, processes, models, or outputs which previous or reference implementations otherwise only enable in some comparably unstandardised form.* 

- SP1.0 Spatial software should explicitly indicate its domain of applicability, and in particular distinguish whether the software may be applied in Cartesian/rectilinear/geometric domains, curvilinear/geographic domains, or both.* 

- SP1.1 Spatial software should explicitly indicate its dimensional domain of applicability, in particular through identifying whether it is applicable to two or three dimensions only, or whether there are any other restrictions on dimensionality.* 

- SP2.4 Geographical Spatial Software should be compliant with version 6 or larger of* [`PROJ`](https://proj.org/), *and with* `WKT2` *representations. The primary implication, described in detail in the articles linked to above, is that:

- SP2.4a Software should not permit coordinate reference systems to be represented merely by so-called "PROJ4-strings", but should use at least WKT2.* 

- SP2.8 Spatial Software should implement a single pre-processing routine to validate input data, and to appropriately transform it to a single uniform type to be passed to all subsequent data-processing functions.

- SP2.9 The pre-processing function described above should maintain those metadata attributes of input data which are relevant or important to core algorithms or return values.* 

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#150 of file [R/get_trip_speed_profile.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/R/get_trip_speed_profile.R#L150):

- G1.1 Statistical Software should document whether the algorithm(s) it implements are:* - *The first implementation of a novel algorithm*; or - *The first implementation within **R** of an algorithm which has previously been implemented in other languages or contexts*; or - *An improvement on other implementations of similar algorithms in **R***. 

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- G2.11 Software should ensure that `data.frame`-like tabular objects which have columns which do not themselves have standard class attributes (typically, `vector`) are appropriately processed, and do not error without reason. This behaviour should be tested. Again, columns created by the [`units` package](https://github.com/r-quantities/units/) provide a good test case.

- G2.12 Software should ensure that `data.frame`-like tabular objects which have list columns should ensure that those columns are appropriately pre-processed either through being removed, converted to equivalent vector columns where appropriate, or some other appropriate treatment such as an informative error. This behaviour should be tested.* 

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.3 For univariate character input:

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- EA1.3 Identify the kinds of data each function is intended to accept as input* 

- EA2.3 Table join operations should not be based on any assumed variable or column names* 

- EA2.6 Routines should appropriately process vector data regardless of additional attributes* 

- EA3.0 The algorithmic components of EDA Software should enable automated extraction and/or reporting of statistics as some sufficiently "meta" level (such as variable or model selection), for which previous or reference implementations require manual intervention.

- EA3.1 EDA software should enable standardised comparison of inputs, processes, models, or outputs which previous or reference implementations otherwise only enable in some comparably unstandardised form.* 

- EA4.0 EDA Software should ensure all return results have types which are consistent with input types.* 

- EA4.2 The primary routines of EDA Software should return objects for which default `print` and `plot` methods give sensible results. Default `summary` methods may also be implemented.* 

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#75 of file [R/load_feed.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/R/load_feed.R#L75):

- G1.1 Statistical Software should document whether the algorithm(s) it implements are:* - *The first implementation of a novel algorithm*; or - *The first implementation within **R** of an algorithm which has previously been implemented in other languages or contexts*; or - *An improvement on other implementations of similar algorithms in **R***. 

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- G2.9 Software should issue diagnostic messages for type conversion in which information is lost (such as conversion of variables from factor to character; standardisation of variable names; or removal of meta-data such as those associated with [`sf`-format](https://r-spatial.github.io/sf/) data) or added (such as insertion of variable or column names where none were provided).* 

- EA1.3 Identify the kinds of data each function is intended to accept as input* 

- EA4.0 EDA Software should ensure all return results have types which are consistent with input types.* 

- EA4.2 The primary routines of EDA Software should return objects for which default `print` and `plot` methods give sensible results. Default `summary` methods may also be implemented.* 

- SP2.2 Geographical Spatial Software should ensure maximal compatibility with established packages and workflows, minimally through:

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#100 of file [R/multiline_to_sorted_linestring.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/R/multiline_to_sorted_linestring.R#L100):

- G1.1 Statistical Software should document whether the algorithm(s) it implements are:* - *The first implementation of a novel algorithm*; or - *The first implementation within **R** of an algorithm which has previously been implemented in other languages or contexts*; or - *An improvement on other implementations of similar algorithms in **R***. 

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.4b explicit conversion to continuous via `as.numeric()`

- G3.0 Statistical software should never compare floating point numbers for equality. All numeric equality comparisons should either ensure that they are made between integers, or use appropriate tolerances for approximate equality.* 

- SP1.0 Spatial software should explicitly indicate its domain of applicability, and in particular distinguish whether the software may be applied in Cartesian/rectilinear/geometric domains, curvilinear/geographic domains, or both.* 

- SP1.1 Spatial software should explicitly indicate its dimensional domain of applicability, in particular through identifying whether it is applicable to two or three dimensions only, or whether there are any other restrictions on dimensionality.* 

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

- SP2.4 Geographical Spatial Software should be compliant with version 6 or larger of* [`PROJ`](https://proj.org/), *and with* `WKT2` *representations. The primary implication, described in detail in the articles linked to above, is that:

- SP2.4a Software should not permit coordinate reference systems to be represented merely by so-called "PROJ4-strings", but should use at least WKT2.* 

- SP2.8 Spatial Software should implement a single pre-processing routine to validate input data, and to appropriately transform it to a single uniform type to be passed to all subsequent data-processing functions.

- SP2.9 The pre-processing function described above should maintain those metadata attributes of input data which are relevant or important to core algorithms or return values.* 

- SP4.0 Return values should either:

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#88 of file [R/network_overline.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/R/network_overline.R#L88):

- G1.1 Statistical Software should document whether the algorithm(s) it implements are:* - *The first implementation of a novel algorithm*; or - *The first implementation within **R** of an algorithm which has previously been implemented in other languages or contexts*; or - *An improvement on other implementations of similar algorithms in **R***. 

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.11 Software should ensure that `data.frame`-like tabular objects which have columns which do not themselves have standard class attributes (typically, `vector`) are appropriately processed, and do not error without reason. This behaviour should be tested. Again, columns created by the [`units` package](https://github.com/r-quantities/units/) provide a good test case.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.3 For univariate character input:

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- EA2.3 Table join operations should not be based on any assumed variable or column names* 

- EA4.0 EDA Software should ensure all return results have types which are consistent with input types.* 

- SP1.0 Spatial software should explicitly indicate its domain of applicability, and in particular distinguish whether the software may be applied in Cartesian/rectilinear/geometric domains, curvilinear/geographic domains, or both.* 

- SP1.1 Spatial software should explicitly indicate its dimensional domain of applicability, in particular through identifying whether it is applicable to two or three dimensions only, or whether there are any other restrictions on dimensionality.* 

- SP2.2 Geographical Spatial Software should ensure maximal compatibility with established packages and workflows, minimally through:

- SP2.2a Clear and extensive documentation demonstrating how routines from that software may be embedded within, or otherwise adapted to, workflows which rely on these established packages; and

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

- SP2.4 Geographical Spatial Software should be compliant with version 6 or larger of* [`PROJ`](https://proj.org/), *and with* `WKT2` *representations. The primary implication, described in detail in the articles linked to above, is that:

- SP2.4a Software should not permit coordinate reference systems to be represented merely by so-called "PROJ4-strings", but should use at least WKT2.* 

- SP2.8 Spatial Software should implement a single pre-processing routine to validate input data, and to appropriately transform it to a single uniform type to be passed to all subsequent data-processing functions.

- SP2.9 The pre-processing function described above should maintain those metadata attributes of input data which are relevant or important to core algorithms or return values.* 

- SP4.0a Be in same class as input data, or

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#11 of file [R/osm_utils.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/R/osm_utils.R#L11):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

Standards on line#80 of file [R/prioritise_lanes.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/R/prioritise_lanes.R#L80):

- G1.1 Statistical Software should document whether the algorithm(s) it implements are:* - *The first implementation of a novel algorithm*; or - *The first implementation within **R** of an algorithm which has previously been implemented in other languages or contexts*; or - *An improvement on other implementations of similar algorithms in **R***. 

- G2.12 Software should ensure that `data.frame`-like tabular objects which have list columns should ensure that those columns are appropriately pre-processed either through being removed, converted to equivalent vector columns where appropriate, or some other appropriate treatment such as an informative error. This behaviour should be tested.* 

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G2.4a explicit conversion to `integer` via `as.integer()`

- G2.4b explicit conversion to continuous via `as.numeric()`

- EA3.0 The algorithmic components of EDA Software should enable automated extraction and/or reporting of statistics as some sufficiently "meta" level (such as variable or model selection), for which previous or reference implementations require manual intervention.

- EA3.1 EDA software should enable standardised comparison of inputs, processes, models, or outputs which previous or reference implementations otherwise only enable in some comparably unstandardised form.* 

- EA4.0 EDA Software should ensure all return results have types which are consistent with input types.* 

- EA4.2 The primary routines of EDA Software should return objects for which default `print` and `plot` methods give sensible results. Default `summary` methods may also be implemented.* 

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

- SP4.0a Be in same class as input data, or

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#94 of file [R/project_points_along_geometry.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/R/project_points_along_geometry.R#L94):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.11 Software should ensure that `data.frame`-like tabular objects which have columns which do not themselves have standard class attributes (typically, `vector`) are appropriately processed, and do not error without reason. This behaviour should be tested. Again, columns created by the [`units` package](https://github.com/r-quantities/units/) provide a good test case.

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.4c explicit conversion to character via `as.character()` (and not `paste` or `paste0`)

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- EA1.3 Identify the kinds of data each function is intended to accept as input* 

- EA2.6 Routines should appropriately process vector data regardless of additional attributes* 

- SP1.0 Spatial software should explicitly indicate its domain of applicability, and in particular distinguish whether the software may be applied in Cartesian/rectilinear/geometric domains, curvilinear/geographic domains, or both.* 

- SP1.1 Spatial software should explicitly indicate its dimensional domain of applicability, in particular through identifying whether it is applicable to two or three dimensions only, or whether there are any other restrictions on dimensionality.* 

- SP2.0 Spatial software should only accept input data of one or more classes explicitly developed to represent such data.

- SP2.0b Class systems should ensure that functions error appropriately, rather than merely warning, in response to data from inappropriate spatial domains.* 

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

- SP2.4 Geographical Spatial Software should be compliant with version 6 or larger of* [`PROJ`](https://proj.org/), *and with* `WKT2` *representations. The primary implication, described in detail in the articles linked to above, is that:

- SP2.4a Software should not permit coordinate reference systems to be represented merely by so-called "PROJ4-strings", but should use at least WKT2.* 

- SP2.5 Class systems for input data must contain meta data on associated coordinate reference systems.

- SP2.6 Spatial Software should explicitly document the types and classes of input data able to be passed to each function.

- SP2.7 Spatial Software should implement validation routines to confirm that inputs are of acceptable classes (or represented in otherwise appropriate ways for software which does not use class systems).

- SP2.8 Spatial Software should implement a single pre-processing routine to validate input data, and to appropriately transform it to a single uniform type to be passed to all subsequent data-processing functions.

- SP2.9 The pre-processing function described above should maintain those metadata attributes of input data which are relevant or important to core algorithms or return values.* 

- SP4.0 Return values should either:

- SP4.0a Be in same class as input data, or

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#49 of file [R/query_mobilitydatabase.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/R/query_mobilitydatabase.R#L49):

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

Standards on line#47 of file [R/query_osm_centerlines.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/R/query_osm_centerlines.R#L47):

- G1.0 Statistical Software should list at least one primary reference from published academic literature.* 

- G1.1 Statistical Software should document whether the algorithm(s) it implements are:* - *The first implementation of a novel algorithm*; or - *The first implementation within **R** of an algorithm which has previously been implemented in other languages or contexts*; or - *An improvement on other implementations of similar algorithms in **R***. 

Standards on line#130 of file [R/query_osm_shapes_match_routes.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/R/query_osm_shapes_match_routes.R#L130):

- G1.1 Statistical Software should document whether the algorithm(s) it implements are:* - *The first implementation of a novel algorithm*; or - *The first implementation within **R** of an algorithm which has previously been implemented in other languages or contexts*; or - *An improvement on other implementations of similar algorithms in **R***. 

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G2.9 Software should issue diagnostic messages for type conversion in which information is lost (such as conversion of variables from factor to character; standardisation of variable names; or removal of meta-data such as those associated with [`sf`-format](https://r-spatial.github.io/sf/) data) or added (such as insertion of variable or column names where none were provided).* 

- EA2.3 Table join operations should not be based on any assumed variable or column names* 

- SP1.0 Spatial software should explicitly indicate its domain of applicability, and in particular distinguish whether the software may be applied in Cartesian/rectilinear/geometric domains, curvilinear/geographic domains, or both.* 

- SP1.1 Spatial software should explicitly indicate its dimensional domain of applicability, in particular through identifying whether it is applicable to two or three dimensions only, or whether there are any other restrictions on dimensionality.* 

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

- SP2.4 Geographical Spatial Software should be compliant with version 6 or larger of* [`PROJ`](https://proj.org/), *and with* `WKT2` *representations. The primary implication, described in detail in the articles linked to above, is that:

- SP2.4a Software should not permit coordinate reference systems to be represented merely by so-called "PROJ4-strings", but should use at least WKT2.* 

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#158 of file [R/rt_average_speed.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/R/rt_average_speed.R#L158):

- G1.1 Statistical Software should document whether the algorithm(s) it implements are:* - *The first implementation of a novel algorithm*; or - *The first implementation within **R** of an algorithm which has previously been implemented in other languages or contexts*; or - *An improvement on other implementations of similar algorithms in **R***. 

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.3 For univariate character input:

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G2.9 Software should issue diagnostic messages for type conversion in which information is lost (such as conversion of variables from factor to character; standardisation of variable names; or removal of meta-data such as those associated with [`sf`-format](https://r-spatial.github.io/sf/) data) or added (such as insertion of variable or column names where none were provided).* 

- EA1.3 Identify the kinds of data each function is intended to accept as input* 

- EA2.3 Table join operations should not be based on any assumed variable or column names* 

- EA4.0 EDA Software should ensure all return results have types which are consistent with input types.* 

- SP1.0 Spatial software should explicitly indicate its domain of applicability, and in particular distinguish whether the software may be applied in Cartesian/rectilinear/geometric domains, curvilinear/geographic domains, or both.* 

- SP1.1 Spatial software should explicitly indicate its dimensional domain of applicability, in particular through identifying whether it is applicable to two or three dimensions only, or whether there are any other restrictions on dimensionality.* 

- SP2.0 Spatial software should only accept input data of one or more classes explicitly developed to represent such data.

- SP2.0b Class systems should ensure that functions error appropriately, rather than merely warning, in response to data from inappropriate spatial domains.* 

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

- SP2.4 Geographical Spatial Software should be compliant with version 6 or larger of* [`PROJ`](https://proj.org/), *and with* `WKT2` *representations. The primary implication, described in detail in the articles linked to above, is that:

- SP2.4a Software should not permit coordinate reference systems to be represented merely by so-called "PROJ4-strings", but should use at least WKT2.* 

- SP2.5 Class systems for input data must contain meta data on associated coordinate reference systems.

- SP2.6 Spatial Software should explicitly document the types and classes of input data able to be passed to each function.

- SP2.7 Spatial Software should implement validation routines to confirm that inputs are of acceptable classes (or represented in otherwise appropriate ways for software which does not use class systems).

- SP2.8 Spatial Software should implement a single pre-processing routine to validate input data, and to appropriately transform it to a single uniform type to be passed to all subsequent data-processing functions.

- SP2.9 The pre-processing function described above should maintain those metadata attributes of input data which are relevant or important to core algorithms or return values.* 

- SP4.0 Return values should either:

- SP4.0a Be in same class as input data, or

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#88 of file [R/rt_extend_prioritisation.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/R/rt_extend_prioritisation.R#L88):

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

- EA4.0 EDA Software should ensure all return results have types which are consistent with input types.* 

- SP1.0 Spatial software should explicitly indicate its domain of applicability, and in particular distinguish whether the software may be applied in Cartesian/rectilinear/geometric domains, curvilinear/geographic domains, or both.* 

- SP1.1 Spatial software should explicitly indicate its dimensional domain of applicability, in particular through identifying whether it is applicable to two or three dimensions only, or whether there are any other restrictions on dimensionality.* 

- SP2.0b Class systems should ensure that functions error appropriately, rather than merely warning, in response to data from inappropriate spatial domains.* 

- SP2.4 Geographical Spatial Software should be compliant with version 6 or larger of* [`PROJ`](https://proj.org/), *and with* `WKT2` *representations. The primary implication, described in detail in the articles linked to above, is that:

- SP2.4a Software should not permit coordinate reference systems to be represented merely by so-called "PROJ4-strings", but should use at least WKT2.* 

- SP2.8 Spatial Software should implement a single pre-processing routine to validate input data, and to appropriately transform it to a single uniform type to be passed to all subsequent data-processing functions.

- SP2.9 The pre-processing function described above should maintain those metadata attributes of input data which are relevant or important to core algorithms or return values.* 

- SP4.0a Be in same class as input data, or

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#18 of file [R/spatial_utils.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/R/spatial_utils.R#L18):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- SP2.4 Geographical Spatial Software should be compliant with version 6 or larger of* [`PROJ`](https://proj.org/), *and with* `WKT2` *representations. The primary implication, described in detail in the articles linked to above, is that:

- SP2.4a Software should not permit coordinate reference systems to be represented merely by so-called "PROJ4-strings", but should use at least WKT2.* 

- SP2.7 Spatial Software should implement validation routines to confirm that inputs are of acceptable classes (or represented in otherwise appropriate ways for software which does not use class systems).

Standards on line#64 of file [R/spatial_utils.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/R/spatial_utils.R#L64):

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- SP2.0 Spatial software should only accept input data of one or more classes explicitly developed to represent such data.

- SP2.0b Class systems should ensure that functions error appropriately, rather than merely warning, in response to data from inappropriate spatial domains.* 

- SP2.4 Geographical Spatial Software should be compliant with version 6 or larger of* [`PROJ`](https://proj.org/), *and with* `WKT2` *representations. The primary implication, described in detail in the articles linked to above, is that:

- SP2.4a Software should not permit coordinate reference systems to be represented merely by so-called "PROJ4-strings", but should use at least WKT2.* 

- SP2.5 Class systems for input data must contain meta data on associated coordinate reference systems.

- SP2.7 Spatial Software should implement validation routines to confirm that inputs are of acceptable classes (or represented in otherwise appropriate ways for software which does not use class systems).

- SP2.8 Spatial Software should implement a single pre-processing routine to validate input data, and to appropriately transform it to a single uniform type to be passed to all subsequent data-processing functions.

- SP2.9 The pre-processing function described above should maintain those metadata attributes of input data which are relevant or important to core algorithms or return values.* 

Standards on line#23 of file [R/srr-stats-standards.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/R/srr-stats-standards.R#L23):

- G1.0 Statistical Software should list at least one primary reference from published academic literature.* 

- G1.1 Statistical Software should document whether the algorithm(s) it implements are:* - *The first implementation of a novel algorithm*; or - *The first implementation within **R** of an algorithm which has previously been implemented in other languages or contexts*; or - *An improvement on other implementations of similar algorithms in **R***. 

- G1.2 Statistical Software should include a* Life Cycle Statement *describing current and anticipated future states of development.* 

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- EA1.0 Identify one or more target audiences for whom the software is intended

- EA1.1 Identify the kinds of data the software is capable of analysing (see *Kinds of Data* below).

- EA1.2 Identify the kinds of questions the software is intended to help explore.* 

- SP1.0 Spatial software should explicitly indicate its domain of applicability, and in particular distinguish whether the software may be applied in Cartesian/rectilinear/geometric domains, curvilinear/geographic domains, or both.* 

- SP1.1 Spatial software should explicitly indicate its dimensional domain of applicability, in particular through identifying whether it is applicable to two or three dimensions only, or whether there are any other restrictions on dimensionality.* 

- SP2.1 Spatial Software should not use the [`sp` package](https://cran.r-project.org/package=sp), rather should use [`sf`](https://cran.r-project.org/package=sf).* 

- SP2.2 Geographical Spatial Software should ensure maximal compatibility with established packages and workflows, minimally through:

- SP2.2a Clear and extensive documentation demonstrating how routines from that software may be embedded within, or otherwise adapted to, workflows which rely on these established packages; and



### tests directory



Standards on line#13 of file [tests/testthat/test-classify_frequency_los.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/tests/testthat/test-classify_frequency_los.R#L13):

- G2.11 Software should ensure that `data.frame`-like tabular objects which have columns which do not themselves have standard class attributes (typically, `vector`) are appropriately processed, and do not error without reason. This behaviour should be tested. Again, columns created by the [`units` package](https://github.com/r-quantities/units/) provide a good test case.

- G2.12 Software should ensure that `data.frame`-like tabular objects which have list columns should ensure that those columns are appropriately pre-processed either through being removed, converted to equivalent vector columns where appropriate, or some other appropriate treatment such as an informative error. This behaviour should be tested.* 

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- EA6.0 Return values from all functions should be tested, including tests for the following characteristics:

- EA6.0a Classes and types of objects

- EA6.0b Dimensions of tabular objects

- EA6.0c Column names (or equivalent) of tabular objects

- EA6.0d Classes or types of all columns contained within `data.frame`-type tabular objects 

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

Standards on line#8 of file [tests/testthat/test-create_calendar.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/tests/testthat/test-create_calendar.R#L8):

- EA6.0 Return values from all functions should be tested, including tests for the following characteristics:

- EA6.0a Classes and types of objects

- EA6.0b Dimensions of tabular objects

- EA6.0c Column names (or equivalent) of tabular objects

- EA6.0d Classes or types of all columns contained within `data.frame`-type tabular objects 

Standards on line#16 of file [tests/testthat/test-create_shapes_from_sf.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/tests/testthat/test-create_shapes_from_sf.R#L16):

- G5.0 Where applicable or practicable, tests should use standard data sets with known properties (for example, the [NIST Standard Reference Datasets](https://www.itl.nist.gov/div898/strd/), or data sets provided by other widely-used R packages).

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

- EA6.0e Values of single-valued objects; for `numeric` values either using `testthat::expect_equal()` or equivalent with a defined value for the `tolerance` parameter, or using `round(..., digits = x)` with some defined value of `x` prior to testing equality.* 

- SP2.2b Tests which clearly demonstrate that routines from that software may be successfully translated into forms and workflows which rely on these established packages.* 

- SP6.0 Software which implements routines for transforming coordinates of input data should include tests which demonstrate ability to recover the original coordinates.* 

- SP6.1 All functions which can be applied to both Cartesian and curvilinear data should be tested through application to both.

- SP6.1b Functions which yield accurate results regardless of whether input data are rectilinear or curvilinear should demonstrate equivalent accuracy in both cases, and should also demonstrate how equivalent results may be obtained through first explicitly transforming input data.* 

Standards on line#8 of file [tests/testthat/test-create_shapes_from_stops.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/tests/testthat/test-create_shapes_from_stops.R#L8):

- EA6.0 Return values from all functions should be tested, including tests for the following characteristics:

- EA6.0a Classes and types of objects

- EA6.0b Dimensions of tabular objects

- EA6.0c Column names (or equivalent) of tabular objects

- EA6.0d Classes or types of all columns contained within `data.frame`-type tabular objects 

Standards on line#10 of file [tests/testthat/test-get_network_extension.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/tests/testthat/test-get_network_extension.R#L10):

- G2.11 Software should ensure that `data.frame`-like tabular objects which have columns which do not themselves have standard class attributes (typically, `vector`) are appropriately processed, and do not error without reason. This behaviour should be tested. Again, columns created by the [`units` package](https://github.com/r-quantities/units/) provide a good test case.

- G5.0 Where applicable or practicable, tests should use standard data sets with known properties (for example, the [NIST Standard Reference Datasets](https://www.itl.nist.gov/div898/strd/), or data sets provided by other widely-used R packages).

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- SP6.1 All functions which can be applied to both Cartesian and curvilinear data should be tested through application to both.

- SP6.1b Functions which yield accurate results regardless of whether input data are rectilinear or curvilinear should demonstrate equivalent accuracy in both cases, and should also demonstrate how equivalent results may be obtained through first explicitly transforming input data.* 

Standards on line#15 of file [tests/testthat/test-get_prioritisation_stats.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/tests/testthat/test-get_prioritisation_stats.R#L15):

- G2.11 Software should ensure that `data.frame`-like tabular objects which have columns which do not themselves have standard class attributes (typically, `vector`) are appropriately processed, and do not error without reason. This behaviour should be tested. Again, columns created by the [`units` package](https://github.com/r-quantities/units/) provide a good test case.

- G2.12 Software should ensure that `data.frame`-like tabular objects which have list columns should ensure that those columns are appropriately pre-processed either through being removed, converted to equivalent vector columns where appropriate, or some other appropriate treatment such as an informative error. This behaviour should be tested.* 

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- EA6.0a Classes and types of objects

- EA6.0c Column names (or equivalent) of tabular objects

- EA6.0e Values of single-valued objects; for `numeric` values either using `testthat::expect_equal()` or equivalent with a defined value for the `tolerance` parameter, or using `round(..., digits = x)` with some defined value of `x` prior to testing equality.* 

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP6.1 All functions which can be applied to both Cartesian and curvilinear data should be tested through application to both.

Standards on line#8 of file [tests/testthat/test-get_route_frequency_hourly.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/tests/testthat/test-get_route_frequency_hourly.R#L8):

- EA6.0 Return values from all functions should be tested, including tests for the following characteristics:

- EA6.0a Classes and types of objects

- EA6.0b Dimensions of tabular objects

- EA6.0c Column names (or equivalent) of tabular objects

- EA6.0d Classes or types of all columns contained within `data.frame`-type tabular objects 

Standards on line#9 of file [tests/testthat/test-get_stop_frequency_hourly.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/tests/testthat/test-get_stop_frequency_hourly.R#L9):

- EA6.0 Return values from all functions should be tested, including tests for the following characteristics:

- EA6.0a Classes and types of objects

- EA6.0b Dimensions of tabular objects

- EA6.0c Column names (or equivalent) of tabular objects

- EA6.0d Classes or types of all columns contained within `data.frame`-type tabular objects 

- EA6.0e Values of single-valued objects; for `numeric` values either using `testthat::expect_equal()` or equivalent with a defined value for the `tolerance` parameter, or using `round(..., digits = x)` with some defined value of `x` prior to testing equality.* 

Standards on line#23 of file [tests/testthat/test-get_trip_speed_profile.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/tests/testthat/test-get_trip_speed_profile.R#L23):

- G2.11 Software should ensure that `data.frame`-like tabular objects which have columns which do not themselves have standard class attributes (typically, `vector`) are appropriately processed, and do not error without reason. This behaviour should be tested. Again, columns created by the [`units` package](https://github.com/r-quantities/units/) provide a good test case.

- G2.12 Software should ensure that `data.frame`-like tabular objects which have list columns should ensure that those columns are appropriately pre-processed either through being removed, converted to equivalent vector columns where appropriate, or some other appropriate treatment such as an informative error. This behaviour should be tested.* 

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4a For new methods, it can be difficult to separate out correctness of the method from the correctness of the implementation, as there may not be reference for comparison. In this case, testing may be implemented against simple, trivial cases or against multiple implementations such as an initial R implementation compared with results from a C/C++ implementation.

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8b Data of unsupported types (e.g., character or complex numbers in for functions designed only for numeric data)

- G5.8c Data with all-`NA` fields or columns or all identical fields or columns

- G5.8d Data outside the scope of the algorithm (for example, data with more fields (columns) than observations (rows) for some regression algorithms)

- EA6.0 Return values from all functions should be tested, including tests for the following characteristics:

- EA6.0a Classes and types of objects

- EA6.0b Dimensions of tabular objects

- EA6.0c Column names (or equivalent) of tabular objects

- EA6.0d Classes or types of all columns contained within `data.frame`-type tabular objects 

- EA6.0e Values of single-valued objects; for `numeric` values either using `testthat::expect_equal()` or equivalent with a defined value for the `tolerance` parameter, or using `round(..., digits = x)` with some defined value of `x` prior to testing equality.* 

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

Standards on line#11 of file [tests/testthat/test-get_way_frequency_hourly.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/tests/testthat/test-get_way_frequency_hourly.R#L11):

- G2.12 Software should ensure that `data.frame`-like tabular objects which have list columns should ensure that those columns are appropriately pre-processed either through being removed, converted to equivalent vector columns where appropriate, or some other appropriate treatment such as an informative error. This behaviour should be tested.* 

- EA6.0 Return values from all functions should be tested, including tests for the following characteristics:

- EA6.0a Classes and types of objects

- EA6.0b Dimensions of tabular objects

- EA6.0c Column names (or equivalent) of tabular objects

- EA6.0d Classes or types of all columns contained within `data.frame`-type tabular objects 

- EA6.0e Values of single-valued objects; for `numeric` values either using `testthat::expect_equal()` or equivalent with a defined value for the `tolerance` parameter, or using `round(..., digits = x)` with some defined value of `x` prior to testing equality.* 

Standards on line#11 of file [tests/testthat/test-load_feed.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/tests/testthat/test-load_feed.R#L11):

- G5.0 Where applicable or practicable, tests should use standard data sets with known properties (for example, the [NIST Standard Reference Datasets](https://www.itl.nist.gov/div898/strd/), or data sets provided by other widely-used R packages).

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

- SP2.2b Tests which clearly demonstrate that routines from that software may be successfully translated into forms and workflows which rely on these established packages.* 

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

Standards on line#11 of file [tests/testthat/test-multiline_to_sorted_linestring.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/tests/testthat/test-multiline_to_sorted_linestring.R#L11):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4a For new methods, it can be difficult to separate out correctness of the method from the correctness of the implementation, as there may not be reference for comparison. In this case, testing may be implemented against simple, trivial cases or against multiple implementations such as an initial R implementation compared with results from a C/C++ implementation.

- G5.8c Data with all-`NA` fields or columns or all identical fields or columns

- SP6.0 Software which implements routines for transforming coordinates of input data should include tests which demonstrate ability to recover the original coordinates.* 

- SP6.1 All functions which can be applied to both Cartesian and curvilinear data should be tested through application to both.

- SP6.2 Geographical Software should include tests with extreme geographical coordinates, minimally including extension to polar extremes of +/-90 degrees.* 

Standards on line#12 of file [tests/testthat/test-network_overline.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/tests/testthat/test-network_overline.R#L12):

- G2.11 Software should ensure that `data.frame`-like tabular objects which have columns which do not themselves have standard class attributes (typically, `vector`) are appropriately processed, and do not error without reason. This behaviour should be tested. Again, columns created by the [`units` package](https://github.com/r-quantities/units/) provide a good test case.

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

- SP2.2b Tests which clearly demonstrate that routines from that software may be successfully translated into forms and workflows which rely on these established packages.* 

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP6.0 Software which implements routines for transforming coordinates of input data should include tests which demonstrate ability to recover the original coordinates.* 

- SP6.1 All functions which can be applied to both Cartesian and curvilinear data should be tested through application to both.

Standards on line#11 of file [tests/testthat/test-prioritise_lanes.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/tests/testthat/test-prioritise_lanes.R#L11):

- G2.12 Software should ensure that `data.frame`-like tabular objects which have list columns should ensure that those columns are appropriately pre-processed either through being removed, converted to equivalent vector columns where appropriate, or some other appropriate treatment such as an informative error. This behaviour should be tested.* 

- EA6.0 Return values from all functions should be tested, including tests for the following characteristics:

- EA6.0a Classes and types of objects

- EA6.0b Dimensions of tabular objects

- EA6.0c Column names (or equivalent) of tabular objects

- EA6.0d Classes or types of all columns contained within `data.frame`-type tabular objects 

- EA6.0e Values of single-valued objects; for `numeric` values either using `testthat::expect_equal()` or equivalent with a defined value for the `tolerance` parameter, or using `round(..., digits = x)` with some defined value of `x` prior to testing equality.* 

Standards on line#24 of file [tests/testthat/test-project_points_along_geometry.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/tests/testthat/test-project_points_along_geometry.R#L24):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4a For new methods, it can be difficult to separate out correctness of the method from the correctness of the implementation, as there may not be reference for comparison. In this case, testing may be implemented against simple, trivial cases or against multiple implementations such as an initial R implementation compared with results from a C/C++ implementation.

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8a Zero-length data

- G5.8b Data of unsupported types (e.g., character or complex numbers in for functions designed only for numeric data)

- EA6.0 Return values from all functions should be tested, including tests for the following characteristics:

- EA6.0a Classes and types of objects

- EA6.0b Dimensions of tabular objects

- EA6.0c Column names (or equivalent) of tabular objects

- EA6.0d Classes or types of all columns contained within `data.frame`-type tabular objects 

- EA6.0e Values of single-valued objects; for `numeric` values either using `testthat::expect_equal()` or equivalent with a defined value for the `tolerance` parameter, or using `round(..., digits = x)` with some defined value of `x` prior to testing equality.* 

- SP2.4a Software should not permit coordinate reference systems to be represented merely by so-called "PROJ4-strings", but should use at least WKT2.* 

- SP6.0 Software which implements routines for transforming coordinates of input data should include tests which demonstrate ability to recover the original coordinates.* 

- SP6.1 All functions which can be applied to both Cartesian and curvilinear data should be tested through application to both.

- SP6.1b Functions which yield accurate results regardless of whether input data are rectilinear or curvilinear should demonstrate equivalent accuracy in both cases, and should also demonstrate how equivalent results may be obtained through first explicitly transforming input data.* 

- SP6.2 Geographical Software should include tests with extreme geographical coordinates, minimally including extension to polar extremes of +/-90 degrees.* 

Standards on line#51 of file [tests/testthat/test-query_osm_shapes_match_routes.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/tests/testthat/test-query_osm_shapes_match_routes.R#L51):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.8a Zero-length data

- SP6.1 All functions which can be applied to both Cartesian and curvilinear data should be tested through application to both.

Standards on line#17 of file [tests/testthat/test-rt_average_speed.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/tests/testthat/test-rt_average_speed.R#L17):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4a For new methods, it can be difficult to separate out correctness of the method from the correctness of the implementation, as there may not be reference for comparison. In this case, testing may be implemented against simple, trivial cases or against multiple implementations such as an initial R implementation compared with results from a C/C++ implementation.

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8b Data of unsupported types (e.g., character or complex numbers in for functions designed only for numeric data)

- G5.8d Data outside the scope of the algorithm (for example, data with more fields (columns) than observations (rows) for some regression algorithms)

- EA6.0 Return values from all functions should be tested, including tests for the following characteristics:

- EA6.0a Classes and types of objects

- EA6.0b Dimensions of tabular objects

- EA6.0c Column names (or equivalent) of tabular objects

- EA6.0e Values of single-valued objects; for `numeric` values either using `testthat::expect_equal()` or equivalent with a defined value for the `tolerance` parameter, or using `round(..., digits = x)` with some defined value of `x` prior to testing equality.* 

Standards on line#8 of file [tests/testthat/test-rt_extend_prioritisation.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/tests/testthat/test-rt_extend_prioritisation.R#L8):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- SP6.1 All functions which can be applied to both Cartesian and curvilinear data should be tested through application to both.

Standards on line#10 of file [tests/testthat/test-spatial_utils.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/tests/testthat/test-spatial_utils.R#L10):

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- SP2.4a Software should not permit coordinate reference systems to be represented merely by so-called "PROJ4-strings", but should use at least WKT2.* 

- SP2.8 Spatial Software should implement a single pre-processing routine to validate input data, and to appropriately transform it to a single uniform type to be passed to all subsequent data-processing functions.

- SP2.9 The pre-processing function described above should maintain those metadata attributes of input data which are relevant or important to core algorithms or return values.* 



---



## Standards with `srrstatsNA` tag



**Numbers of standards:**

-  EA :  18  /  34

-  G :  25  /  68

-  SP :  20  /  45

- Total : 63 / 147





### R directory



Standards on line#94 of file [R/srr-stats-standards.R](https://github.com/U-Shift/GTFShift/blob/ropensci-software-review/R/srr-stats-standards.R#L94):

- G1.5 Software should include all code necessary to reproduce results which form the basis of performance claims made in associated publications.* 

- G1.6 Software should include code necessary to compare performance claims with alternative implementations in other R packages.* 

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.14a error on missing data

- G2.14b ignore missing data with default warnings or messages issued

- G2.14c replace missing data with appropriately imputed values

- G2.4d explicit conversion to factor via `as.factor()`

- G2.4e explicit conversion from factor via `as...()` functions

- G2.5 Where inputs are expected to be of `factor` type, secondary documentation should explicitly state whether these should be `ordered` or not, and those inputs should provide appropriate error or other routines to ensure inputs follow these expectations.* 

- G3.1 Statistical software which relies on covariance calculations should enable users to choose between different algorithms for calculating covariances, and should not rely solely on covariances from the `stats::cov` function.

- G3.1a The ability to use arbitrarily specified covariance methods should be documented (typically in examples or vignettes).* 

- G4.0 Statistical Software which enables outputs to be written to local files should parse parameters specifying file names to ensure appropriate file suffixes are automatically generated where not provided.* 

- G5.10 Extended tests should included and run under a common framework with other tests but be switched on by flags such as as a `<MYPKG>_EXTENDED_TESTS="true"` environment variable.* - The extended tests can be then run automatically by GitHub Actions for example by adding the following to the `env` section of the workflow: 

- G5.11 Where extended tests require large data sets or other assets, these should be provided for downloading and fetched as part of the testing workflow.

- G5.11a When any downloads of additional data necessary for extended tests fail, the tests themselves should not fail, rather be skipped and implicitly succeed with an appropriate diagnostic message.

- G5.12 Any conditions necessary to run extended tests such as platform requirements, memory, expected runtime, and artefacts produced that may need manual inspection, should be described in developer documentation such as a `CONTRIBUTING.md` or `tests/README.md` file.

- G5.4c Where applicable, stored values may be drawn from published paper outputs when applicable and where code from original implementations is not available

- G5.5 Correctness tests should be run with a fixed random seed

- G5.6 *Parameter recovery tests** *to test that the implementation produce expected results given data with known properties. For instance, a linear regression algorithm should return expected coefficient values for a simulated data set generated from a linear model.

- G5.6a Parameter recovery tests should generally be expected to succeed within a defined tolerance rather than recovering exact values.

- G5.6b Parameter recovery tests should be run with multiple random seeds when either data simulation or the algorithm contains a random component. (When long-running, such tests may be part of an extended, rather than regular, test suite; see G5.10-4.12, below).* 

- G5.7 *Algorithm performance tests** *to test that implementation performs as expected as properties of data change. For instance, a test may show that parameters approach correct estimates within tolerance as data size increases, or that convergence times decrease for higher convergence thresholds.

- G5.9 *Noise susceptibility tests** *Packages should test for expected stochastic behaviour, such as through the following conditions:

- G5.9a Adding trivial noise (for example, at the scale of `.Machine$double.eps`) to data does not meaningfully change results

- G5.9b Running under different random seeds or initial conditions does not meaningfully change results* 

- EA2.0 EDA Software which accepts standard tabular data and implements or relies upon extensive table filter and join operations should utilise an **index column** system

- EA2.1 All values in an index column must be unique, and this uniqueness should be affirmed as a pre-processing step for all input data.

- EA2.2 Index columns should be explicitly identified, either:

- EA2.2a by using an appropriate class system, or

- EA2.2b through setting an `attribute` on a table, `x`, of `attr(x, "index") <- <index_col_name>`.* 

- EA2.4 Use and demand an explicit class system for such input (for example, via the [`DM` package](https://github.com/krlmlr/dm)).

- EA2.5 Ensure all individual tables follow the above standards for Index Columns* 

- EA4.1 EDA Software should implement parameters to enable explicit control of numeric precision

- EA5.0 Graphical presentation in EDA software should be as accessible as possible or practicable. In particular, EDA software should consider accessibility in terms of:

- EA5.0a Typeface sizes, which should default to sizes which explicitly enhance accessibility

- EA5.0b Default colour schemes, which should be carefully constructed to ensure accessibility.

- EA5.1 Any explicit specifications of typefaces which override default values provided through other packages (including the `graphics` package) should consider accessibility* 

- EA5.2 Screen-based output should never rely on default print formatting of `numeric` types, rather should also use some version of `round(., digits)`, `formatC`, `sprintf`, or similar functions for numeric formatting according the parameter described in* **EA4.1**.

- EA5.3 Column-based summary statistics should always indicate the `storage.mode`, `class`, or equivalent defining attribute of each column.* 

- EA5.4 All visualisations should ensure values are rounded sensibly (for example, via `pretty()` function).

- EA5.5 All visualisations should include units on all axes where such are specified or otherwise obtainable from input data or other routines.* 

- EA5.6 Any packages which internally bundle libraries used for dynamic visualization and which are also bundled in other, pre-existing R packages, should explain the necessity and advantage of re-bundling that library.* 

- EA6.1 The properties of graphical output from EDA software should be explicitly tested, for example via the [`vdiffr` package](https://github.com/r-lib/vdiffr) or equivalent.* 

- SP2.0a Where new classes are implemented, conversion to other common classes for spatial data in R should be documented.

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

- SP5.0 Implement default `plot` methods for any implemented class system.

- SP5.1 Implement appropriate placement of variables along x- and y-axes.

- SP5.2 Ensure that axis labels include appropriate units.* 

- SP5.3 Offer an ability to generate interactive (generally `html`-based) visualisations of results.* 

- SP6.1a Functions which may yield inaccurate results when applied to data in one or the other forms (such as the preceding examples of centroids and buffers from ellipsoidal data) should test that results from inappropriate application of those functions are indeed less accurate.

- SP6.3 Spatial Software which considers spatial neighbours should explicitly test all possible ways of defining them, and should explicitly compare quantitative effects of different ways of defining neighbours.

- SP6.4 Spatial Software which considers spatial neighbours should explicitly test effects of different schemes to weight neighbours by spatial proximity.* 

- SP6.5 Spatial Unsupervised Learning Software which uses clustering algorithms should implement tests which explicitly compare results with equivalent results obtained with a non-spatial clustering algorithm.* 

- SP6.6 Spatial Machine Learning Software should implement tests which explicitly demonstrate the detrimental consequences of sampling test and training data from the same spatial region, rather than from spatially distinct regions.



---



