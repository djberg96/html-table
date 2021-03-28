## Description
An interface for generating HTML Tables with Ruby.

## Synopsis
```ruby
require "html/table"
include HTML

table = HTML::Table.new{ |t|
  t.border  = 1
  t.bgcolor = "red"
}

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

#### output ####
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

See the 'examples' directory for more examples.

## Mixins
`Table` is a subclass of `Array`, and therefore mixes in `Enumerable`. The
`push`, `unshift` and `[]=` methods have been modified. See below for details.    
    
Table also mixes in the `AttributeHandler` module which provides methods
for adding attributes to each of the tag types. See attributes.md for
more details.

## Constants
`VERSION`

The current version number (a String). This serves as the VERSION number
for the entire html-table package.

## Class Methods
```
Table.new(arg=nil)
Table.new(arg=nil){ |t| ... }
```

Creates a new Table instance.  You can set attributes for the Table by
passing a block.
    
If `arg` is supplied, it is automatically interpreted to be content. This
is a shortcut for `Table.new{ |t| t.content = '...' }`.

`Table.global_end_tags?`

Returns the value of the `global_end_tags` class variable.  By default,
this is true.

`Table.global_end_tags=(true|false)`

Sets the `global_end_tags` class variable. This determines class-wide, for
those classes where end tags are optional, whether or not end tags are
included in the final html. Classes where end tags are not optional are
not affected.
    
If set to false, this overrides individual class end tags settings.

## Instance Methods
`Table#[]=(index, object)`

Assigns `object` to `index`. There are restrictions to the data
types that you can assign to a Table instance. They include `Caption`,
`ColGroup`, `Body`, `Foot`, `Head` and `Row`. You cannot assign a slice (yet).

`Table#configure(row_num, col_num=0){ |td_object| block }`

Configures column `col_num` at row `row_num`, using a block to set
options. If only `row_num` is specified, then you'll be configuring
only the row. Generally speaking, that means you'll be configure a
Table::Row and not a Data or Header object.

`Table#content`

Returns the HTML content.

`Table#content=(arg)`

Adds data to the Table. The `arg` may be a Table::Row object, an
Array of Table::Row objects, an Array of Array's, an Array of Strings,
or a single String. In the last two cases, a single Table::Row with a
single Table::Row::Data object is created, with the string as the content.

`Table#html`

Returns the entire HTML content for the Table Object. This is what you
want to print when you're done creating your Table.

`Table#push(obj)`

Pushes `obj` onto the Table, where `obj` must be a Row, Caption,
ColGroup, Body, Foot or Head object. Also note that the Caption and Head
objects will automatically put themselves at row 0 (or possibly 1, in the
case of a Head object where a Caption already exists).

`Table#unshift(obj)`

Unshifts `obj` onto the Table. The same rules apply to `unshift` as
they do to `push`.

## Notes
A Table consists of Table::Row, Table::Caption, Table::ColGroup,
Table::Body, Table::Foot, Table::Head and Table::Row objects.

Table::Row objects in turn consist of Table::Row::Data and Table::Row::Header objects.

Table::ColGroup objects consist of Table::ColGroup::Col objects.

Table::Head, Table::Body and Table::Foot objects consist of Table::Row objects.

String attributes are quoted. Numeric attributes are not.

Some attributes have type checking. Some check for valid arguments. In
the latter case, it is case-insensitive. See the documentation on
specific methods for more details.

Using a non-standard extension (e.g. "background") will send a warning to
STDERR in `$VERBOSE` (-w) mode.

## Known Bugs
None that I'm aware of. Please report bugs on the project page at
https://github.com/djberg96/html-table

## Future Plans
Allow standard html tags to be added to elements as appropriate, such
as `<B>`, `<I>`, etc.

CSS support.

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
