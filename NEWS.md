NEWS 
====

Versioning
----------

Releases will be numbered with the following semantic versioning format:

&lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;

And constructed with the following guidelines:

* Breaking backward compatibility bumps the major (and resets the minor 
  and patch)
* New additions without breaking backward compatibility bumps the minor 
  (and resets the patch)
* Bug fixes and misc changes bumps the patch



 <a href="https://github.com/trinker/qdapRegex" target="_blank">qdapRegex</a> 0.7.0
----------------------------------------------------------------

**BUG FIXES**

**NEW FEATURES**

* `as_count` added to convert `ex_citation` into counts of citations.

**MINOR FEATURES**

* `ex_` added to compliment the `rm_` function.

**IMPROVEMENTS**

**CHANGES**


 <a href="https://github.com/trinker/qdapRegex" target="_blank">qdapRegex</a> 0.6.0
----------------------------------------------------------------

**NEW FEATURES**

* `rm_` prefixed functions get an extraction counterpart prefixed with `ex_`.  
  This means users can use `ex_` functions directly without using the `rm_` form 
  in the less convenient form of `rm_xxx(extract = TRUE)`.


 <a href="https://github.com/trinker/qdapRegex" target="_blank">qdapRegex</a> 0.5.1
----------------------------------------------------------------

**BUG FIXES**

* `rm_number` incorrectly did not handle multiple comma separated digits (see
  <a href="https://github.com/trinker/qdapRegex/issues/17">issue #17</a>).  This behavior has been fixed and a unit test added to ensure
  proper handling.


 <a href="https://github.com/trinker/qdapRegex" target="_blank">qdapRegex</a> 0.4.1-0.5.0
----------------------------------------------------------------

**BUG FIXES**

* `rm_between` did not handle single quotation marks (`'`) as both the left and 
  right boundary when `extract = TRUE`.  Related to <a href="https://github.com/trinker/qdapRegex/issues/13">issue #13</a>
  
**NEW FEATURES**

* `rm_transcript_time` added to remove transcript specific style of time stamp 
  tagging.  See <a href="http://help-nv10mac.qsrinternational.com/desktop/procedures/import_audio_or_video_transcripts.htm" target="_blank">http://help-nv10mac.qsrinternational.com/desktop/procedures/import_audio_or_video_transcripts.htm</a>   for details.
  
* `as_time` and `as_time2`  added for use with `rm_time`/`rm_time_trnscript`.  
  These are convert to the standard HH:MM:SS.OS format and optionally converts 
  to `as.POSIXlt`.  The former outputs a list of vectors of times while the 
  later wraps `as_time` with `unlist`.

**MINOR FEATURES**

* `except_first` added to `regex_supplement` dictionary to provide a means to 
  remove all occurrences of a character except the first appearance.  Regex 
  from: <a href="http://stackoverflow.com/a/31458261/1000343" target="_blank">http://stackoverflow.com/a/31458261/1000343</a>
  
* `rm_between` and `r_between_multiple` pick up a `fixed` argument.  Previously,
  `left` and `right` boundaries containing regular expression special characters
  were fixed by default (escaped).  This did not allow for the powerful use of a 
  regular expression for left/right boundaries.  The `fixed = TRUE` behavior 
  is still the default but users can now set `fixed = FALSE` to work with 
  regular expression boundaries.  This new feature was inspired by @Ronak Shah's
  StackOverflow question: <a href="http://stackoverflow.com/q/31623069/1000343" target="_blank">http://stackoverflow.com/q/31623069/1000343</a>  

**CHANGES**

* `word_boundary`, `word_boundary_left`, `word_boundary_right` regexes in the
  `regex_supplement` did not include apostrophes as a viable word character. 
  Apostrophes are now included as a word character.
  
* `explain` no longer prints the regular expression explanation to the command 
  line.  Instead the link to <a href="http://www.regexper.com" target="_blank">http://www.regexper.com</a> is printed.  This change
  is because <a href="http://rick.measham.id.au/paste/explain" target="_blank">http://rick.measham.id.au/paste/explain</a> no longer appears to be 
  working.  The text explanation functionality will return if the website 
  becomes operational again or if a suitable substitute can be found.

 <a href="https://github.com/trinker/qdapRegex" target="_blank">qdapRegex</a> 0.4.0
----------------------------------------------------------------

**BUG FIXES**

* `rm_number` did not extract consecutive digits that aren't comma separated
  without separating it into multiple strings.  For example "12345" became 
  "123" "45".  Also 444,44 will not be removed/extracted as it is not a valid
  comma separated number.  These behavior have been corrected and the unit test 
  now include these cases.  Thanks to Jason Gray for the rework of the regex.
  It is simpler and more accurate.
  
* `rm_between` did not handle quotation marks (`"`) as both the left and right 
  boundary when `extract = TRUE`.  Bug reported by Tori Shannon, 
  <a href="http://stackoverflow.com/q/31119989/1000343," target="_blank">http://stackoverflow.com/q/31119989/1000343,</a> and addressed by Jason Gray. See 
  <a href="https://github.com/trinker/qdapRegex/issues/13">issue #13</a>

**NEW FEATURES**

* `as_numeric` & `as_numeric2` added for use with `rm_number`.  These are 
  wrappers for `as.numeric(gsub(",", "", x))`.  The former removes commas and 
  converts a list of vectors of strings to numeric.  The later wraps 
  `as_numeric` with `unlist`.

* `rm_non_words` added to remove every any character that isn't a letter, 
  apostrophe, or single space.

* The class `extracted` has been added and is the output of a `rm_xxx` function
  when `extract = TRUE`.  This allows for the `c.extracted` function to easily
  turn the `list` output into a character vector.

* `c.extracted` added to provide a quick unlist method for `list`s of class
  `extracted`.  The is less typing than `unlist` for an approach that is used
  often.
  
* `bind_or` added as a means of quickly wrapping multiple sub-expression 
  elements with left/right boundaries and then concatenate/joins the grouped 
  strings with regular expression or statement ("|").

**MINOR FEATURES**

* `punctuation` added to `regex_supplement` dictionary for easy negation of
  `[:punct:]` class.


 <a href="https://github.com/trinker/qdapRegex" target="_blank">qdapRegex</a> 0.2.1 - 0.3.2
----------------------------------------------------------------

**BUG FIXES**

* `explain` used `message` to print to the console.  `explain` now returns an
  object of the class `explain` with its own print method which uses `cat` 
  rather than `message`. Additionally, the characters `+` and `&` were not 
  handled correctly; this has been corrected.

* Documentation for `TC` "there is an incomplete sentence. It is as follows:
  TC utilizes additional rules for capitalization beyond `stri_trans_totitle` 
  that includes..." (found by rmsharp).  This has been corrected. See <a href="https://github.com/trinker/qdapRegex/issues/8">issue #8</a>

* `cheat` (and accompanying `regex_cheat` dictionary) contained misspellings in 
  the words *greedy* and *beginning*.  This has been corrected.

* `rm_number` incorrectly handled numbers containing leading or trailing zeros.
  See <a href="https://github.com/trinker/qdapRegex/issues/9">issue #9</a>

* `rm_caps_phrases` could only extract/remove up to two "words" worth of capital
  letter phrases at a time.  See <a href="https://github.com/trinker/qdapRegex/issues/11">issue #11</a>

**NEW FEATURES**

* `%+%` binary operator version of `pastex(x, y, sep = "")` added to join
  regular expressions together.

* `group_or` added as a means of quickly wrapping multiple sub-expression 
  elements with grouping parenthesis and then concatenate/joins the grouped 
  strings with regular expression or statement ("|").

* `rm_repeated_characters` added for removing/extracting/replacing words with
  repeated characters (each repeated &gt; 2 times).  Regex pattern comes from:
  StackOverflow's vks (<a href="http://stackoverflow.com/a/29438461/1000343)." target="_blank">http://stackoverflow.com/a/29438461/1000343).</a>

* `rm_repeated_phrases` added for removing/extracting/replacing repeating 
  phrases (&gt; 2 times).  Regex pattern comes from:
  StackOverflow's BrodieG (<a href="http://stackoverflow.com/a/28786617/1000343)." target="_blank">http://stackoverflow.com/a/28786617/1000343).</a>

* `rm_repeated_words` added for removing/extracting/replacing repeating words 
  (&gt; 2 times).  

**MINOR FEATURES**

* `run_split` regex added to the `regex_supplement` dictionary to split runs 
  into chunks.

**IMPROVEMENTS**

* Regular Expression Dictionaries (e.g., `regex_usa` and `regex_supplement`) are
  now managed with the **regexr** package.  This enables cleaner updating of the 
  regular expressions with easier to read structure.  Longer files will be 
  stored in this format.  Files located:
  https://github.com/trinker/qdapRegex/tree/master/inst/regex_scripts

* `rm_caps_phrase` has a new regular expression that is more accurate and does 
  not pull trailing white space.


 <a href="https://github.com/trinker/qdapRegex" target="_blank">qdapRegex</a> 0.1.3 - 0.2.0
----------------------------------------------------------------

**BUG FIXES**

* `pastex` would throw a warning on a vector (e.g., `pastex(letters)`).  This 
  has been fixed.

* `youtube_id` was documented under `qdap_usa` rather than `qdap_supplement` and
  contained an invalid hyperlink.  This has been fixed.

* `rm_citation` contained a bug that would not operate on citations with a comma 
  in multiple authors before the and/& sign.  See <a href="https://github.com/trinker/qdapRegex/issues/4">issue #4</a>

**NEW FEATURES**

* `is.regex` added as a logical check of a regular expression's validy (conforms 
  to R's regular expression rules).

* `rm_postal_code` added for removing/extracting/replacing U.S. postal codes.

* Case wrapper functions, `TC` (title case), `U` (upper case), and `L` (lower 
  case) added for convenient case manipulation.

* `group` function added to allow for convenient wrapping of grouping 
  parenthesis around regular expressions.

* `rm_citation_tex` added to remove/extract/replace bibkey citations from a .tex 
  (LaTeX) file.

* `regex_cheat` data set and `cheat` function added to act as a quick reference 
  for common regex task operations such a lookaheads.

* `rm_caps_phrase` added to supplement `rm_caps`, extending the search to phases.

* `explain` added to view a visual representation of a regular expression using 
  <a href="http://www.regexper.com" target="_blank">http://www.regexper.com</a> and <a href="http://rick.measham.id.au/paste/explain." target="_blank">http://rick.measham.id.au/paste/explain.</a>  Also 
  takes named regular expressions from the `regex_usa` or other supplied 
  dictionary.

**MINOR FEATURES**

* `last_occurrence` regex added to the `regex_supplement` dictionary to find the
  last occurrence of delimiter.

* `word_boundary`, `word_boundary_left`, and `word_boundary_right` added to
  `regex_supplement` dictionary to provide a true word boundary.  Regexes 
  adapted from: <a href="http://www.rexegg.com/regex-boundaries.html#real-word-boundary" target="_blank">http://www.rexegg.com/regex-boundaries.html#real-word-boundary</a>

* `rm_time2` regex added to the `regex_usa` dictionary to find time + AM/PM

**IMPROVEMENTS**

* The `regex_usa` dictionary regular expressions: `rm_hash`, `rm_tag`, `rm_tag2` 
  and `rm_between` pick up grouping that allows for replacement of individual 
  sections of the substring.  See `?rm_hash` and `?rm_tag` for examples.

* `pastex` picks up a `sep` argument to allow the user to choose what string
  is used to separate the collapsed expressions.

* `rm_citation`, `rm_citation2`, and `rm_citation3` now attempt to include last 
  names that contain the  lower case particles: von, van, de, da, and du.


 <a href="https://github.com/trinker/qdapRegex" target="_blank">qdapRegex</a> 0.1.2
----------------------------------------------------------------

CRAN fix for oldrel Windows.  Updated to R version 3.1.0 in Description file.

**NEW FEATURES**

* `bind` added as a convenience function to add a left and right boundary to 
  each element of a character vector.


 <a href="https://github.com/trinker/qdapRegex" target="_blank">qdapRegex</a> 0.1.1
----------------------------------------------------------------

First CRAN Release

**NEW FEATURES**

* `rm_citation` added for removing/extracting/replacing APA 6 style in-text 
  citations.

* `rm_white` and accompanying family of `rm_white` functions added to remove 
  white space.

* `rm_non_ascii` added to remove non-ASCII characters from a string.

* `around_` added to extract word(s) around a given point.

* `pages` and `pages2` added to the `regex_supplement` data set for 
  removing/extracting/validating page numbers.

**IMPROVEMENTS**

* `rm_XXX` family of functions now use `stringi::stri_extract_all_regex` as this 
  approach is much faster than the 
  `regmatches(text.var, gregexpr(pattern, text.var, perl = TRUE))` approach.



 <a href="https://github.com/trinker/qdapRegex" target="_blank">qdapRegex</a> 0.0.1 - 0.2.0
----------------------------------------------------------------

This package is a collection of regex tools associated with the qdap
package that may be useful outside of the context of discourse analysis.  Tools
include removal/extraction/replacement of abbreviations, dates, dollar amounts, 
email addresses, hash tags, numbers, percentages, person tags, phone numbers, 
times, and zip codes.
