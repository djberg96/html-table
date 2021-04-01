## Description
An interface for generating HTML Tables with Ruby.

## Installation
`gem install html-table`
   
## Synopsis
```ruby
require 'html/table'
include HTML

# Explicit syntax
table = HTML::Table.new{ |t|
  t.border  = 1
  t.bgcolor = "red"
}

# Implicit syntax
table = HTML::Table.new do
  border   1
  bgcolor 'red'
end

table.push Table::Row.new{ |r|
  r.align   = "left"
  r.bgcolor = "green"
  r.content = ["foo","bar","baz"]
}

row = Table::Row.new{ |r|
  r.align   = "right"
  r.bgcolor = "blue"
  r.content = "hello world"
}

table[1] = row

puts table.html
```
Output:
```
<table border=1 bgcolor='red'>
   <tr align='left' bgcolor='green'>  # row 0
      <td>foo</td>                    # column 0
      <td>bar</td>                    # column 1
      <td>baz</td>                    # column 2
   </tr>
   <tr align='right' bgcolor='blue'>  # row 1
      <td>hello world</td>            # column 0
   </tr>
</table>
```
See the 'examples' directory under 'doc' for more examples.

## Mixins
Table is a subclass of Array, and therefore mixes in Enumerable. The
+push+, +unshift+ and []= methods have been modified. See below for details.    
   
Table also mixes in AttributeHandler which provides methods for adding
attributes to each of the tag types. See attributes.rdoc for more details.

## Notes
A Table consists of Table::Row, Table::Caption, Table::ColGroup,
Table::Body, Table::Foot, Table::Head and Table::Row objects.

Table::Row objects in turn consist of Table::Row::Data and
Table::Row::Header objects.

Table::ColGroup objects consist of Table::ColGroup::Col
objects.

Table::Head, Table::Body and Table::Foot objects consist
of Table::Row objects.
    
String attributes are quoted. Numeric attributes are not.

Some attributes have type checking. Some check for valid arguments. In
the latter case, it is case-insensitive. See the documentation on
specific methods for more details.

Using a non-standard extension (e.g. "background") will emit a
NonStandardExtensionWarning. See the documentation for structured_warnings
for more information on how to control these.

## Known Bugs
None that I'm aware of. Please report bugs on the project page at:

http://github.com/djberg96/html-table

## Future Plans
None at this time.

## Acknowledgements
Anthony Peacock, for giving me ideas with his HTML::Table Perl module.
Holden Glova and Culley Harrelson for API suggestions and comments.

## License
Apache-2.0

## Copyright
(C) 2003-2021 Daniel J. Berger
All Rights Reserved

## Warranty
This package is provided "as is" and without any express or
implied warranties, including, without limitation, the implied
warranties of merchantability and fitness for a particular purpose.

## Author
Daniel J. Berger

## Developer's Notes
Some people might be a little annoyed with the fact that I use a
strongtyping library. I'm not a big fan of strong typing myself.
So, why did I do this?

Normally when creating code, you setup your own rules as far as what is
allowed as an argument. You publish the API, set up a good set of tests,
and don't bother worrying about types because you figure people can read
the API and won't go out of their way to break it. You certainly don't
worry about it yourself because you're used to dynamic languages and find
that you don't need the strong typing training wheels after all, right?

However, HTML tables have a predefined set of rules as far as what content
is valid, and where it's placed in order to be HTML compliant. For
example, if a caption is included, it should be at the 'top' of your table
syntax, you can only have one foot section, and so on. I therefore chose to
enforce these conventions and rules in Ruby via a module. I could have
lived without it, and instead chose to do a plethora of "kind_of?" checks,
but the strongtyping lib is simply more convenient all around.

UPDATE: I originally used Ryan Pavlik's strongtyping library as a dependency.
As of version 1.6.0 I now simply include a pure Ruby version with this library.
This makes it easier to work with JRuby and eliminates a dependency.
