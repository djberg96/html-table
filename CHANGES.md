## 1.7.1 - 12-Jan-2021
* Switch from rdoc to markdown since github isn't rendering rdoc properly.

## 1.7.0 - 8-Sep-2020
* Switched from test-unit to rspec.
* Added a Gemfile.

## 1.6.3 - 18-Mar-2020
* Fixed the LICENSE file, which inadvertently included some unrelated
  copyright notices. I also removed some unnecessary boilerplate.
* Added an explicit .rdoc extension to files that were already in that format.

## 1.6.2 - 17-Mar-2020
* Include copy of Apache-2.0 license in distribution.

## 1.6.1 - 24-Feb-2019
* Namespace all the modules under `HTML::Mixin` to prevent potential clashes,
  especially for the StrongTyping module. Thanks go to mistoo for the report.

## 1.6.0 - 16-Jan-2019
* Changed license to Apache-2.0.
* Removed strongtyping dependency, now comes bundled with a pure Ruby
  version instead.
* Minor documentation updates.

## 1.5.2 - 4-Nov-2018
* Added metadata to gemspec.

## 1.5.1 - 31-Mar-2018
* Fixed deprecation warnings.
* Updated cert.

## 1.5.0 - 29-Mar-2017
* Updated the structured_warnings dependency to 0.3.0, and modified the
  warning classes to subclass the new warning types.
* The VERSION constant is now frozen.
* Updated cert file.

## 1.4.2 - 8-Apr-2016
* This gem is now signed.
* Added the html-table.rb file for convenience.
* Updated the gem related rake tasks.
* Corrections to the README.

## 1.4.1 - 8-Nov-2014
* Minor updates to Rakefile and gemspec.
* Use require_relative where appropriate.

## 1.4.0 - 28-Aug-2013
* The `HTML::Table` constructor now accepts an optional hash of options.
  If present, they are treated as table attributes.
* Some Rakefile and gemspec updates.
* Minor test file cleanup.

## 1.3.6 - 19-Sep-2011
* Fixes header.rb, data.rb and caption.rb for Ruby 1.9.

## 1.3.5 - 1-Sep-2011
* Refactored the Rakefile. Removed an old install task, reworked the
  gem tasks and added a default task.
* Minor updates to the gemspec.

## 1.3.4 - 29-Sep-2009
* The test-unit library is now a development dependency instead of a
  standard dependency.
* Removed all load path mangling.
* License changed to Artistic-2.0.
* Updated the gemspec description, added a license. 

## 1.3.3 - 5-Feb-2009
* Added `structured_warnings` as a requirement. The non standard tags now
  raise a `NonStandardExtensionWarning`. These are now _always_ raised whenever
  used (instead of only in `$VERBOSE` mode), but the warning can be disabled as
  you see fit. See the documentation on structured_warnings for more details.
* Added test-unit 2.x as a requirement.
* Refactored and renamed the tests.
* The gem now includes the example files.
* Added additional rake tasks for the sake of testing individual portions
  of the html-table library instead of the all or nothing approach I had
  before.
* Added rake tasks for running the example programs.

## 1.3.2 - 15-Jul-2008
* Added to_s and to_str aliases for the html method for all classes.
* Some documentation updates.
* Removed unnecessary presetup code from the test files that was no longer
  necessary thanks to Rake.
* Removed the ts_all.rb file. It was no longer necessary thanks to Rake.

## 1.3.1 - 8-Feb-2008
* Fully qualified the `HTML::Table` class in the `HTMLHandler` module. This fix
  eliminates the need to 'include HTML' to actually get some code to work
  properly. Thanks go to Jos Backus for the spot and patch.
* Added a Rakefile with tasks for testing and installation.
* Removed the install.rb file. That's now handled by the Rakefile.
* Cleaned up some warnings in the AttributeHandler and TagHandler modules.
* Updated the MANIFEST and README files.

## 1.3.0 - 2-Aug-2006
* Added support for DSI style syntax, i.e. the ability to omit the explicit
  receiver in block form.
* The content method now creates a `Table::Content` object behind the scenes
  (a subclass of String) and allows physical tags to generated on the fly
  via a block.
* Added support for physical tags for content, e.g. `<b>`, `<i>` etc.
  See the documentation for more details.
* Added the 'style' and 'class_' attribute handlers for you CSS lovers.
* Added the 'data' alias for the 'content' method.
* Added the 'header' method to the Table class so that you can explicitly
  generate `<th>` content instead of `<td>` content if you prefer.
* The `html` singleton method now accepts an optional boolean that can be used to
  disable formatting. If set to true, the output will not include newlines
  or spaces between the tags (i.e. it will give you a single long string).
* Some comment additions and tweaks.

## 1.2.2 - 17-Jun-2005
* Each class now defines its own `content=` method (rather than a generic module
  method that handles it). Internal change only.
* The Head, Foot and Body classes now use the inherited version of content=
  method, instead of defining them individually (which they should have
  been doing all along).
* Made the README and CHANGES file rdoc friendly.
* Removed the .rd and html files under the 'doc' directory.  All of those
  files have been made rdoc friendly and been given .rdoc extensions.
* Some `$LOAD_PATH` setup changes for the test suite.

## 1.2.1 - 26-Oct-2004
* Documentation additions to make the code rdoc friendly.
* Minor typo/bug fix in the background method of the `AttributeHandler` module.
* Added an assertion to the test suite, mostly to make tc_all.rb work
  correctly (one test was causing other tests to fail due to a global
  setting that was made in a previous test).

## 1.2.0 - 8-Aug-2004
* Added the `global_end_tags=` singleton method for the Table class. This
  allows you to configure you want end tags or not for all classes, rather
  than having to configure each class individually. Note that classes which
  require end tags are unaffected.
* Added handling for `<<` for those classes where it was appropriate (i.e.
  any class that also used `push`).
* Minor update in the `Table::Row#unshift` method.
* Modified the `border=` method in the AttributeHandler module to accept true
  or false as arguments. I had forgotten that you could specify `border` as
  an attribute without a value.
* Yet more tests.

## 1.1.0 - 6-Aug-2004
* Modified the constructors for all of the classes that can contain content
  to accept an optional argument. If present it is assumed to be content.
* Fixed a bug/feature in `Table::Row` where it did not allow you to add or
  delete Fixnums. Henceforth, Fixnums are stringified.
* The `Table::ColGroup` class no longer has the `content` or `content=` methods.
  This was illegal in 1.0.0 as well but it now raises a `NoMethodError` instead.
* Added many more tests, including tests for attribute handlers and html
  handlers.
* Made the `modify_html` method in the `HtmlHandler` module private. This
  should have no affect on your code.
* Added another simple sample program under doc/examples.
* Documentation updates.

## 1.0.0 - 23-May-2004
* No API changes - same as 0.0.4 but now officially declared "stable".  The
  only change that was made is that each class is now in its own file.

## 0.0.4 - 16-May-2004 (Beta4)
* Prerequisites now include Ruby 1.8.0 or later and the StrongTyping library
  from Ryan Pavlik.
* More stringent type checking added using the StrongTyping package.
* Bug in `Table::Foot` class corrected.
* Minor name change for included modules (AttributeHandler, HtmlHandler).
* Many more tests added

## 0.0.3 - 9-Jul-2003 (Beta3)
* Added the `html_case` singleton method for those who want their HTML tags
  in uppercase.
* Fixed up the docs, added the html docs to the core distro.
* Added some config info to table.rb so that this package works as expected
  after installation.

## 0.0.2 - 5-Jul-2003 (Beta2)
* API completely rewritten.
* End tags and indentation level now configurable.
* Added all remaining tag types (caption, colgroup, col, tbody, tfoot and
  thead).

## 0.0.1 11-Jun-2003 (Beta1)
* Initial Release
