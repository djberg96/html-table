## Description
A Table::Row::Data object represents a single <TD></TD> instance for an HTML
Table. For purposes of html-table, it also represents a "column".

## Synopsis
```ruby
require "html/table"
require HTML

Table::Row.end_tags = false
Table::Row::Data.end_tags = false

table = Table.new{ |t| t.border = 1 }
row = Table::Row.new

col1 = Table::Row::Data.new{ |d|
  d.abbr    = "test"
  d.align   = "right"
  d.content = "hello world"
}

col2 = Table::Row::Data.new{ |d|
  d.align   = "center"
  d.content = "Matz rules!"
}

col3 = Table::Row::Data.new{ |d|
  d.align   = "left"
  d.content = "Foo!"
}

row.push col1, col2, col3

puts table.html
```

output:

```html
<table border=1>
  <tr>
    <td abbr='test' align='right'>hello world
    <td align='center'>Matz rules!
    <td align='left'>Foo!
</table>
```

See the 'examples' directory under 'doc' for more examples.

## Mixins
Table::Row::Data mixes in Attribute_Handler.    

## Class Methods
```
Table::Row::Data.new(arg=nil)
Table::Row::Data.new(arg=nil){ |t| ... }
```
Creates a new table.  You can set attributes for the Table::Row::Data by passing a block.
   
If `arg` is supplied, it is automatically interpreted to be content.
This is a shortcut for Table::Row::Data.new{ |d| d.content = '...' }.

`Table::Row::Data.end_tags`

Returns true or false to indicate whether end tags are included or not.

`Table::Row::Data.end_tags=(bool)`

Sets whether or not end tags are included in the html.

`Table::Row::Data.indent_level`
Returns the current number of spaces that `<TD>` tags are indented. The default is 6.

`Table::Row::Data.indent_level=(num)`

Sets the number of spaces that `<TD>` tags are indented.

## Instance Methods
TableData#content

Returns the content of the TableData object, i.e. the stuff between `<TD>` and `</TD>`.

Table::Row::Data#content=(string)

Sets the content for the TableData object, i.e. the stuff between `<TD>` and `</TD>`.

Table::Row::Data#html

Returns all html content for the TableData instance.

## Notes
The end tags for Table::Row::Data objects are are the same line as the begin tags.
    
String attributes are quoted. Numeric attributes are not.

Some attributes have type checking. Some check for valid arguments. In
the latter case, it is case-insensitive.

Using a non-standard extension (e.g. "background") will send a warning to
STDERR in $VERBOSE (-w) mode.
