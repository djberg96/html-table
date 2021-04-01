## Description
A Table::Row object represents a single <TR></TR> instance for an HTML
Table. Although it is nested under Table, it is not a subclass of Table.
It is, however, a subclass of Array.

## Synopsis
```ruby
require "html/table"
include HTML

table = HTML::Table.new

row1 = Table::Row.new{ |r|
  r.align   = "left"
  r.bgcolor = "green"
  r.content = ["foo","bar","baz"]
}

row2 = Table::Row.new{ |r|
  r.align   = "right"
  r.bgcolor = "blue"
  r.content = "hello world"
}

table.push row1, row2

row1.content = "foofoo"
row1.configure(3){ |d| d.bgcolor = "pink" }

row1.push Table::Row::Header.new{ |h|
  h.colspan = 2
  h.content = "This is a table header"
}

row2.push Table::Row::Header.new{ |h|
  h.colspan = 2
  h.content = "This is also a table header"
}

puts table.html
#### output ####
```
```html
<table>
  <tr align='left' bgcolor='green'>
     <td>foo</td>
     <td>bar</td>
     <td>baz</td>
    <td bgcolor='pink'>foofoo</td>
     <th colspan=2>This is a table header</th>
  </tr>
  <tr align='right' bgcolor='blue'>
    <td>hello world</td>
     <th colspan=2>This is also a table header</th>
  </tr>
</table>
```

See the 'examples' directory for more examples.

## Mixins
Table::Row is a subclass of Array and therefore mixes in Enumerable.  It
also mixes in Attribute_Handler.

## Class Methods
```
Table::Row.new(arg=nil)
Table::Row.new(arg=nil){ |t| ... }
```

Creates a new table. You can set attributes for the TableRow by passing a block.
    
If `arg` is supplied, it is automatically interpreted to be content.
This is a shortcut for Table::Row.new{ |r| r.content = '...' }.

## Instance Methods
`Table::Row#[]=(index, obj)`

Assigns `obj` to index. The `obj` must be a Table::Row::Header or
Table::Row::Data object, or a TypeError is raised.

Table::Row#content
Returns the HTML content of the TableRow instance, i.e. the stuff between
the `<TR>` and `</TR>` tags.

`Table::Row#content=(args)`

Because a Table::Row doesn't store any of its own content, the arguments
to this method must be a Table::Row::Data object, a Table::Row::Header
object, or a String (or an array of any of these). In the latter case,
a single Table::Row::Data object is created for each string.

`Table::Row#html`

Returns the entire HTML content of the TableRow instance.

`Table::Row#push(obj)`

Pushes `obj` onto the Table::Row. The +obj+ must be a Table::Row::Data
or Table::Row::Header object, or a TypeError is raised.

`Table::Row#unshift(obj)`

Unshifts +obj+ onto the Table::Row. The same rules for push apply
to unshift as well.

## Notes
String attributes are quoted. Numeric attributes are not.

Some attributes have type checking. Some check for valid arguments. In
the latter case, it is case-insensitive.

Using a non-standard extension (e.g. "background") will send a warning to
STDERR in $VERBOSE (-w) mode.
