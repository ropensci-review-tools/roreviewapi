# srr report for [rcrisp](https://github.com/CityRiverSpaces/rcrisp)



[Click here for full text of all standards](https://stats-devguide.ropensci.org/standards.html)







## Standards with `srrstats` tag



**Numbers of standards:**

-  G :  43  /  68

-  SP :  27  /  45

- Total : 70 / 113





### R directory



Standards on line#93 of file [R/cache.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/cache.R#L93):

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4c explicit conversion to character via `as.character()` (and not `paste` or `paste0`)

Standards on line#68 of file [R/corridor.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/corridor.R#L68):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#149 of file [R/corridor.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/corridor.R#L149):

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#187 of file [R/corridor.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/corridor.R#L187):

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#237 of file [R/corridor.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/corridor.R#L237):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#275 of file [R/corridor.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/corridor.R#L275):

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#305 of file [R/corridor.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/corridor.R#L305):

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#347 of file [R/corridor.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/corridor.R#L347):

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#15 of file [R/data.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/data.R#L15):

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

Standards on line#70 of file [R/delineate.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/delineate.R#L70):

- G2.3 For univariate character input:

- G2.3a Use `match.arg()` or equivalent where applicable to only permit expected values.

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#32 of file [R/exampledata.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/exampledata.R#L32):

- G5.0 Where applicable or practicable, tests should use standard data sets with known properties (for example, the [NIST Standard Reference Datasets](https://www.itl.nist.gov/div898/strd/), or data sets provided by other widely-used R packages).

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#62 of file [R/exampledata.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/exampledata.R#L62):

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#30 of file [R/network.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/network.R#L30):

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#71 of file [R/network.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/network.R#L71):

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- SP4.0 Return values should either:

- SP4.0a Be in same class as input data, or

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#108 of file [R/network.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/network.R#L108):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

Standards on line#120 of file [R/network.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/network.R#L120):

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

Standards on line#142 of file [R/network.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/network.R#L142):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- SP4.0 Return values should either:

- SP4.0a Be in same class as input data, or

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

Standards on line#250 of file [R/network.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/network.R#L250):

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- SP4.0 Return values should either:

- SP4.0a Be in same class as input data, or

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#283 of file [R/network.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/network.R#L283):

- SP4.0 Return values should either:

- SP4.0a Be in same class as input data, or

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#340 of file [R/network.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/network.R#L340):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4b explicit conversion to continuous via `as.numeric()`

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- SP4.0 Return values should either:

- SP4.0a Be in same class as input data, or

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#389 of file [R/network.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/network.R#L389):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#424 of file [R/network.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/network.R#L424):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#447 of file [R/network.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/network.R#L447):

- SP4.0 Return values should either:

- SP4.0a Be in same class as input data, or

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#476 of file [R/network.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/network.R#L476):

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#501 of file [R/network.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/network.R#L501):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#33 of file [R/osmdata.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/osmdata.R#L33):

- G2.3 For univariate character input:

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- G4.0 Statistical Software which enables outputs to be written to local files should parse parameters specifying file names to ensure appropriate file suffices are automatically generated where not provided.* 

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#69 of file [R/osmdata.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/osmdata.R#L69):

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#90 of file [R/osmdata.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/osmdata.R#L90):

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#150 of file [R/osmdata.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/osmdata.R#L150):

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#242 of file [R/osmdata.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/osmdata.R#L242):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#310 of file [R/osmdata.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/osmdata.R#L310):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#402 of file [R/osmdata.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/osmdata.R#L402):

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#466 of file [R/osmdata.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/osmdata.R#L466):

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#521 of file [R/osmdata.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/osmdata.R#L521):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#565 of file [R/osmdata.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/osmdata.R#L565):

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#22 of file [R/riverspace.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/riverspace.R#L22):

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#44 of file [R/segments.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/segments.R#L44):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- G2.13 Statistical Software should implement appropriate checks for missing data as part of initial pre-processing prior to passing data to analytic algorithms.

- G2.16 All functions should also provide options to handle undefined values (e.g., `NaN`, `Inf` and `-Inf`), including potentially ignoring or removing such values.* 

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#99 of file [R/segments.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/segments.R#L99):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#137 of file [R/segments.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/segments.R#L137):

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#173 of file [R/segments.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/segments.R#L173):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- SP3.4 Where possible, spatial clustering software should avoid using standard non-spatial clustering algorithms in which spatial proximity is merely represented by an additional weighting factor in favour of explicitly spatial algorithms.* 

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#205 of file [R/segments.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/segments.R#L205):

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#6 of file [R/sf.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/sf.R#L6):

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

Standards on line#16 of file [R/sf.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/sf.R#L16):

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

Standards on line#28 of file [R/sf.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/sf.R#L28):

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

Standards on line#62 of file [R/sf.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/sf.R#L62):

- SP4.0 Return values should either:

- SP4.0a Be in same class as input data, or

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

Standards on line#56 of file [R/srr-stats-standards.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/srr-stats-standards.R#L56):

- G1.2 Statistical Software should include a* Life Cycle Statement *describing current and anticipated future states of development.* 

- G1.4 Software should use [`roxygen2`](https://roxygen2.r-lib.org/) to document all functions.

- G1.4a All internal (non-exported) functions should also be documented in standard [`roxygen2`](https://roxygen2.r-lib.org/) format, along with a final `@noRd` tag to suppress automatic generation of `.Rd` files or [`@keywords internal`](https://roxygen2.r-lib.org/reference/tags-index-crossref.html?q=keywords%20internal#null) if documentation is still desired.* 

- G2.0 Implement assertions on lengths of inputs, particularly through asserting that inputs expected to be single- or multi-valued are indeed so.

- G2.0a Provide explicit secondary documentation of any expectations on lengths of inputs

- G2.1 Implement assertions on types of inputs (see the initial point on nomenclature above).

- G2.1a Provide explicit secondary documentation of expectations on data types of all vector inputs.

- G2.2 Appropriately prohibit or restrict submission of multivariate input to parameters expected to be univariate.

- G3.0 Statistical software should never compare floating point numbers for equality. All numeric equality comparisons should either ensure that they are made between integers, or use appropriate tolerances for approximate equality.* 

- G5.2 Appropriate error and warning behaviour of all functions should be explicitly demonstrated through tests. In particular,

- G5.2a Every message produced within R code by `stop()`, `warning()`, `message()`, or equivalent should be unique

- G5.2b Explicit tests should demonstrate conditions which trigger every one of those messages, and should compare the result with expected values.

- SP1.0 Spatial software should explicitly indicate its domain of applicability, and in particular distinguish whether the software may be applied in Cartesian/rectilinear/geometric domains, curvilinear/geographic domains, or both.* 

- SP1.1 Spatial software should explicitly indicate its dimensional domain of applicability, in particular through identifying whether it is applicable to two or three dimensions only, or whether there are any other restrictions on dimensionality.* 

- SP2.0 Spatial software should only accept input data of one or more classes explicitly developed to represent such data.

- SP2.1 Spatial Software should not use the [`sp` package](https://cran.r-project.org/package=sp), rather should use [`sf`](https://cran.r-project.org/package=sf).* 

- SP2.2 Geographical Spatial Software should ensure maximal compatibility with established packages and workflows, minimally through:

- SP2.3 Software which accepts spatial input data in any standard format established in other R packages (such as any of the formats able to be read by [`GDAL`](https://gdal.org), and therefore by the [`sf` package](https://cran.r-project.org/package=sf)) should include example and test code which load those data in spatial formats, rather than R-specific binary formats such as `.Rds`.* 

- SP2.4 Geographical Spatial Software should be compliant with version 6 or larger of* [`PROJ`](https://proj.org/), *and with* `WKT2` *representations. The primary implication, described in detail in the articles linked to above, is that:

- SP2.4a Software should not permit coordinate reference systems to be represented merely by so-called "PROJ4-strings", but should use at least WKT2.* 

- SP2.5 Class systems for input data must contain meta data on associated coordinate reference systems.

- SP2.6 Spatial Software should explicitly document the types and classes of input data able to be passed to each function.

- SP2.7 Spatial Software should implement validation routines to confirm that inputs are of acceptable classes (or represented in otherwise appropriate ways for software which does not use class systems).

Standards on line#9 of file [R/utils.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/utils.R#L9):

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

Standards on line#34 of file [R/utils.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/utils.R#L34):

- SP2.8 Spatial Software should implement a single pre-processing routine to validate input data, and to appropriately transform it to a single uniform type to be passed to all subsequent data-processing functions.

- SP2.9 The pre-processing function described above should maintain those metadata attributes of input data which are relevant or important to core algorithms or return values.* 

Standards on line#75 of file [R/utils.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/utils.R#L75):

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

Standards on line#121 of file [R/utils.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/utils.R#L121):

- G2.8 Software should provide appropriate conversion or dispatch routines as part of initial pre-processing to ensure that all other sub-functions of a package receive inputs of a single defined class or type.

Standards on line#166 of file [R/utils.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/utils.R#L166):

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

Standards on line#202 of file [R/utils.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/utils.R#L202):

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

Standards on line#247 of file [R/utils.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/utils.R#L247):

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

Standards on line#273 of file [R/utils.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/utils.R#L273):

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

Standards on line#304 of file [R/utils.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/utils.R#L304):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- SP4.0 Return values should either:

- SP4.0b Be in a unique, preferably class-defined, format.

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#326 of file [R/utils.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/utils.R#L326):

- SP4.0 Return values should either:

- SP4.0a Be in same class as input data, or

- SP4.1 Any aspects of input data which are included in output data (either directly, or in some transformed form) and which contain units should ensure those same units are maintained in return values.

- SP4.2 The type and class of all return values should be explicitly documented.* 

Standards on line#60 of file [R/valley.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/valley.R#L60):

- G2.3 For univariate character input:

- G2.3b Either: use `tolower()` or equivalent to ensure input of character parameters is not case dependent; or explicitly document that parameters are strictly case-sensitive.

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- SP6.1 All functions which can be applied to both Cartesian and curvilinear data should be tested through application to both.

Standards on line#110 of file [R/valley.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/valley.R#L110):

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

Standards on line#152 of file [R/valley.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/valley.R#L152):

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

Standards on line#198 of file [R/valley.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/valley.R#L198):

- G2.7 Software should accept as input as many of the above standard tabular forms as possible, including extension to domain-specific forms.* 

- G4.0 Statistical Software which enables outputs to be written to local files should parse parameters specifying file names to ensure appropriate file suffices are automatically generated where not provided.* 

Standards on line#234 of file [R/valley.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/valley.R#L234):

- SP3.0 Spatial software which considers spatial neighbours should enable user control over neighbourhood forms and sizes. In particular:

- SP3.0a Neighbours (able to be expressed) on regular grids should be able to be considered in both rectangular only, or rectangular and diagonal (respectively "rook" and "queen" by analogy to chess).

Standards on line#269 of file [R/valley.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/valley.R#L269):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

Standards on line#293 of file [R/valley.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/valley.R#L293):

- SP3.1 Spatial software which considers spatial neighbours should wherever possible enable neighbour contributions to be weighted by distance (or other continuous weighting variable), and not rely exclusively on a uniform-weight rectangular cut-off.

Standards on line#329 of file [R/valley.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/valley.R#L329):

- G2.15 Functions should never assume non-missingness, and should never pass data with potential missing values to any base routines with default `na.rm = FALSE`-type parameters (such as [`mean()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html), [`sd()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html) or [`cor()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html)).

Standards on line#350 of file [R/valley.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/valley.R#L350):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 



### tests directory



Standards on line#3 of file [tests/testthat/helper-exampledata.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/helper-exampledata.R#L3):

- G5.1 Data sets created within, and used to test, a package should be exported (or otherwise made generally available) so that users can confirm tests and run examples.* 

Standards on line#9 of file [tests/testthat/test-corridor.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-corridor.R#L9):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

Standards on line#116 of file [tests/testthat/test-corridor.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-corridor.R#L116):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8d Data outside the scope of the algorithm (for example, data with more fields (columns) than observations (rows) for some regression algorithms)

Standards on line#253 of file [tests/testthat/test-corridor.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-corridor.R#L253):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

Standards on line#263 of file [tests/testthat/test-corridor.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-corridor.R#L263):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

Standards on line#302 of file [tests/testthat/test-corridor.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-corridor.R#L302):

- G5.6 *Parameter recovery tests** *to test that the implementation produce expected results given data with known properties. For instance, a linear regression algorithm should return expected coefficient values for a simulated data set generated from a linear model.

- G5.6a Parameter recovery tests should generally be expected to succeed within a defined tolerance rather than recovering exact values.

Standards on line#325 of file [tests/testthat/test-corridor.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-corridor.R#L325):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8b Data of unsupported types (e.g., character or complex numbers in for functions designed only for numeric data)

Standards on line#3 of file [tests/testthat/test-delineate.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-delineate.R#L3):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

Standards on line#82 of file [tests/testthat/test-delineate.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-delineate.R#L82):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

Standards on line#7 of file [tests/testthat/test-extended.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-extended.R#L7):

- G5.10 Extended tests should included and run under a common framework with other tests but be switched on by flags such as as a `<MYPKG>_EXTENDED_TESTS="true"` environment variable.* - The extended tests can be then run automatically by GitHub Actions for example by adding the following to the `env` section of the workflow: 

- G5.11 Where extended tests require large data sets or other assets, these should be provided for downloading and fetched as part of the testing workflow.

- G5.11a When any downloads of additional data necessary for extended tests fail, the tests themselves should not fail, rather be skipped and implicitly succeed with an appropriate diagnostic message.

Standards on line#75 of file [tests/testthat/test-network.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-network.R#L75):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

Standards on line#94 of file [tests/testthat/test-network.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-network.R#L94):

- SP2.2b Tests which clearly demonstrate that routines from that software may be successfully translated into forms and workflows which rely on these established packages.* 

Standards on line#115 of file [tests/testthat/test-network.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-network.R#L115):

- SP2.2b Tests which clearly demonstrate that routines from that software may be successfully translated into forms and workflows which rely on these established packages.* 

Standards on line#139 of file [tests/testthat/test-network.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-network.R#L139):

- SP2.2b Tests which clearly demonstrate that routines from that software may be successfully translated into forms and workflows which rely on these established packages.* 

Standards on line#158 of file [tests/testthat/test-network.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-network.R#L158):

- SP2.2b Tests which clearly demonstrate that routines from that software may be successfully translated into forms and workflows which rely on these established packages.* 

Standards on line#177 of file [tests/testthat/test-network.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-network.R#L177):

- SP2.2b Tests which clearly demonstrate that routines from that software may be successfully translated into forms and workflows which rely on these established packages.* 

Standards on line#330 of file [tests/testthat/test-network.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-network.R#L330):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

Standards on line#89 of file [tests/testthat/test-osmdata.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-osmdata.R#L89):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

Standards on line#175 of file [tests/testthat/test-osmdata.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-osmdata.R#L175):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8a Zero-length data

Standards on line#224 of file [tests/testthat/test-osmdata.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-osmdata.R#L224):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8a Zero-length data

Standards on line#236 of file [tests/testthat/test-osmdata.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-osmdata.R#L236):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8a Zero-length data

Standards on line#18 of file [tests/testthat/test-segments.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-segments.R#L18):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8d Data outside the scope of the algorithm (for example, data with more fields (columns) than observations (rows) for some regression algorithms)

Standards on line#101 of file [tests/testthat/test-segments.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-segments.R#L101):

- G5.4 *Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).

- G5.4a For new methods, it can be difficult to separate out correctness of the method from the correctness of the implementation, as there may not be reference for comparison. In this case, testing may be implemented against simple, trivial cases or against multiple implementations such as an initial R implementation compared with results from a C/C++ implementation.

- G5.5 Correctness tests should be run with a fixed random seed

Standards on line#135 of file [tests/testthat/test-segments.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-segments.R#L135):

- G5.6 *Parameter recovery tests** *to test that the implementation produce expected results given data with known properties. For instance, a linear regression algorithm should return expected coefficient values for a simulated data set generated from a linear model.

Standards on line#163 of file [tests/testthat/test-segments.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-segments.R#L163):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8b Data of unsupported types (e.g., character or complex numbers in for functions designed only for numeric data)

Standards on line#9 of file [tests/testthat/test-utils.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-utils.R#L9):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

Standards on line#63 of file [tests/testthat/test-utils.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-utils.R#L63):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8d Data outside the scope of the algorithm (for example, data with more fields (columns) than observations (rows) for some regression algorithms)

- SP6.2 Geographical Software should include tests with extreme geographical coordinates, minimally including extension to polar extremes of +/-90 degrees.* 

Standards on line#177 of file [tests/testthat/test-utils.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-utils.R#L177):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

Standards on line#188 of file [tests/testthat/test-utils.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-utils.R#L188):

- SP6.1 All functions which can be applied to both Cartesian and curvilinear data should be tested through application to both.

Standards on line#192 of file [tests/testthat/test-utils.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-utils.R#L192):

- G2.4 Provide appropriate mechanisms to convert between different data types, potentially including:

- G2.4a explicit conversion to `integer` via `as.integer()`

Standards on line#258 of file [tests/testthat/test-utils.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-utils.R#L258):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

- G5.8b Data of unsupported types (e.g., character or complex numbers in for functions designed only for numeric data)

Standards on line#265 of file [tests/testthat/test-utils.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-utils.R#L265):

- SP6.0 Software which implements routines for transforming coordinates of input data should include tests which demonstrate ability to recover the original coordinates.* 

Standards on line#284 of file [tests/testthat/test-utils.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-utils.R#L284):

- SP6.0 Software which implements routines for transforming coordinates of input data should include tests which demonstrate ability to recover the original coordinates.* 

Standards on line#58 of file [tests/testthat/test-valley.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-valley.R#L58):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

Standards on line#76 of file [tests/testthat/test-valley.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-valley.R#L76):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

Standards on line#82 of file [tests/testthat/test-valley.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-valley.R#L82):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

Standards on line#91 of file [tests/testthat/test-valley.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-valley.R#L91):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

Standards on line#98 of file [tests/testthat/test-valley.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat/test-valley.R#L98):

- G5.8 *Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:

Standards on line#16 of file [tests/testthat.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/tests/testthat.R#L16):

- SP2.2b Tests which clearly demonstrate that routines from that software may be successfully translated into forms and workflows which rely on these established packages.* 



### root directory



Standards on line#19 of file [./README.Rmd](https://github.com/CityRiverSpaces/rcrisp/blob/main/./README.Rmd#L19):

- G1.2 Statistical Software should include a* Life Cycle Statement *describing current and anticipated future states of development.* 



### vignettes directory



Standards on line#22 of file [vignettes/vig_01-method.Rmd](https://github.com/CityRiverSpaces/rcrisp/blob/main/vignettes/vig_01-method.Rmd#L22):

- G1.0 Statistical Software should list at least one primary reference from published academic literature.* 

- G1.1 Statistical Software should document whether the algorithm(s) it implements are:* - *The first implementation of a novel algorithm*; or - *The first implementation within **R** of an algorithm which has previously been implemented in other languages or contexts*; or - *An improvement on other implementations of similar algorithms in **R***. 

Standards on line#30 of file [vignettes/vig_03-network-preparation.Rmd](https://github.com/CityRiverSpaces/rcrisp/blob/main/vignettes/vig_03-network-preparation.Rmd#L30):

- SP2.2a Clear and extensive documentation demonstrating how routines from that software may be embedded within, or otherwise adapted to, workflows which rely on these established packages; and

Standards on line#33 of file [vignettes/vig_04-valley-delineation.Rmd](https://github.com/CityRiverSpaces/rcrisp/blob/main/vignettes/vig_04-valley-delineation.Rmd#L33):

- G1.0 Statistical Software should list at least one primary reference from published academic literature.* 

- G1.3 All statistical terminology should be clarified and unambiguously defined.* 

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- SP2.2a Clear and extensive documentation demonstrating how routines from that software may be embedded within, or otherwise adapted to, workflows which rely on these established packages; and

Standards on line#35 of file [vignettes/vig_06-corridor-segmentation.Rmd](https://github.com/CityRiverSpaces/rcrisp/blob/main/vignettes/vig_06-corridor-segmentation.Rmd#L35):

- G2.10 Software should ensure that extraction or filtering of single columns from tabular inputs should not presume any particular default behaviour, and should ensure all column-extraction operations behave consistently regardless of the class of tabular data used as input.* 

- SP2.2a Clear and extensive documentation demonstrating how routines from that software may be embedded within, or otherwise adapted to, workflows which rely on these established packages; and



---



## Standards with `srrstatsNA` tag



**Numbers of standards:**

-  G :  25  /  68

-  SP :  18  /  45

- Total : 43 / 113





### R directory



Standards on line#129 of file [R/srr-stats-standards.R](https://github.com/CityRiverSpaces/rcrisp/blob/main/R/srr-stats-standards.R#L129):

- G1.5 Software should include all code necessary to reproduce results which form the basis of performance claims made in associated publications.* 

- G1.6 Software should include code necessary to compare performance claims with alternative implementations in other R packages.* 

- G2.11 Software should ensure that `data.frame`-like tabular objects which have columns which do not themselves have standard class attributes (typically, `vector`) are appropriately processed, and do not error without reason. This behaviour should be tested. Again, columns created by the [`units` package](https://github.com/r-quantities/units/) provide a good test case.

- G2.12 Software should ensure that `data.frame`-like tabular objects which have list columns should ensure that those columns are appropriately pre-processed either through being removed, converted to equivalent vector columns where appropriate, or some other appropriate treatment such as an informative error. This behaviour should be tested.* 

- G2.14 Where possible, all functions should provide options for users to specify how to handle missing (`NA`) data, with options minimally including:

- G2.14a error on missing data

- G2.14b ignore missing data with default warnings or messages issued

- G2.14c replace missing data with appropriately imputed values

- G2.4d explicit conversion to factor via `as.factor()`

- G2.4e explicit conversion from factor via `as...()` functions

- G2.5 Where inputs are expected to be of `factor` type, secondary documentation should explicitly state whether these should be `ordered` or not, and those inputs should provide appropriate error or other routines to ensure inputs follow these expectations.* 

- G2.6 Software which accepts one-dimensional input should ensure values are appropriately pre-processed regardless of class structures.* 

- G2.9 Software should issue diagnostic messages for type conversion in which information is lost (such as conversion of variables from factor to character; standardisation of variable names; or removal of meta-data such as those associated with [`sf`-format](https://r-spatial.github.io/sf/) data) or added (such as insertion of variable or column names where none were provided).* 

- G3.1 Statistical software which relies on covariance calculations should enable users to choose between different algorithms for calculating covariances, and should not rely solely on covariances from the `stats::cov` function.

- G3.1a The ability to use arbitrarily specified covariance methods should be documented (typically in examples or vignettes).* 

- G5.12 Any conditions necessary to run extended tests such as platform requirements, memory, expected runtime, and artefacts produced that may need manual inspection, should be described in developer documentation such as a `CONTRIBUTING.md` or `tests/README.md` file.

- G5.3 For functions which are expected to return objects containing no missing (`NA`) or undefined (`NaN`, `Inf`) values, the absence of any such values in return objects should be explicitly tested.* 

- G5.4b For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.

- G5.4c Where applicable, stored values may be drawn from published paper outputs when applicable and where code from original implementations is not available

- G5.6b Parameter recovery tests should be run with multiple random seeds when either data simulation or the algorithm contains a random component. (When long-running, such tests may be part of an extended, rather than regular, test suite; see G5.10-4.12, below).* 

- G5.7 *Algorithm performance tests** *to test that implementation performs as expected as properties of data change. For instance, a test may show that parameters approach correct estimates within tolerance as data size increases, or that convergence times decrease for higher convergence thresholds.

- G5.8c Data with all-`NA` fields or columns or all identical fields or columns

- G5.9 *Noise susceptibility tests** *Packages should test for expected stochastic behaviour, such as through the following conditions:

- G5.9a Adding trivial noise (for example, at the scale of `.Machine$double.eps`) to data does not meaningfully change results

- G5.9b Running under different random seeds or initial conditions does not meaningfully change results* 

- SP2.0a Where new classes are implemented, conversion to other common classes for spatial data in R should be documented.

- SP2.0b Class systems should ensure that functions error appropriately, rather than merely warning, in response to data from inappropriate spatial domains.* 

- SP2.5a Software which implements new classes to input spatial data (or the spatial components of more general data) should provide an ability to convert such input objects into alternative spatial classes such as those listed above.

- SP3.0b Neighbourhoods in irregular spaces should be minimally able to be controlled via an integer number of neighbours, an area (or equivalent distance defining an area) in which to include neighbours, or otherwise equivalent user-controlled value.

- SP3.2 Spatial software which relies on sampling from input data (even if only of spatial coordinates) should enable sampling procedures to be based on local spatial densities of those input data.* 

- SP3.3 Spatial regression software should explicitly quantify and distinguish autocovariant or autoregressive processes from those covariant or regressive processes not directly related to spatial structure alone.* 

- SP3.5 Spatial machine learning software should ensure that broadcasting procedures for reconciling inputs of different dimensions are **not** applied*. 

- SP3.6 Spatial machine learning software should document (and, where possible, test) the potential effects of different sampling procedures* 

- SP5.0 Implement default `plot` methods for any implemented class system.

- SP5.1 Implement appropriate placement of variables along x- and y-axes.

- SP5.2 Ensure that axis labels include appropriate units.* 

- SP5.3 Offer an ability to generate interactive (generally `html`-based) visualisations of results.* 

- SP6.1a Functions which may yield inaccurate results when applied to data in one or the other forms (such as the preceding examples of centroids and buffers from ellipsoidal data) should test that results from inappropriate application of those functions are indeed less accurate.

- SP6.1b Functions which yield accurate results regardless of whether input data are rectilinear or curvilinear should demonstrate equivalent accuracy in both cases, and should also demonstrate how equivalent results may be obtained through first explicitly transforming input data.* 

- SP6.3 Spatial Software which considers spatial neighbours should explicitly test all possible ways of defining them, and should explicitly compare quantitative effects of different ways of defining neighbours.

- SP6.4 Spatial Software which considers spatial neighbours should explicitly test effects of different schemes to weight neighbours by spatial proximity.* 

- SP6.5 Spatial Unsupervised Learning Software which uses clustering algorithms should implement tests which explicitly compare results with equivalent results obtained with a non-spatial clustering algorithm.* 

- SP6.6 Spatial Machine Learning Software should implement tests which explicitly demonstrate the detrimental consequences of sampling test and training data from the same spatial region, rather than from spatially distinct regions.



---



