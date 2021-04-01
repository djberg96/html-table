## Description
   A list of attributes handled by html-table.  Each of the writers has a
   corresponding reader unless otherwise stated.

## Attributes
`abbr=(string)`

Sets the value for the abbr attribute.

`align=(string)`

Sets the align attribute. Valid arguments are 'left', 'center' and
'right'.  An ArgumentError is raised if an invalid argument is passed.

`axis=(string)`

Sets the value for the axis attribute.

`background=(url)`

Sets the background attribute. The url must be a String or a TypeError
is raised. This is a non-standard extension.

`bgcolor=(color)`

Sets the color for the bgcolor attribute. Hex values should still be
quoted, e.g. "#F80000".

`border=(num)`

Sets the value for the border attribute.

`bordercolor=(color)`

Sets the color for the bordercolor attribute. This is a non-standard extension.

`bordercolordark=(color)`

Sets the color for the bordercolordark attribute. This is a non-standard extension.

`bordercolorlight=(color)`

Sets the color for the bordercolorlight attribute. This is a non-standard extension.

`cellpadding=(num)`

Sets the value for the cellpadding attribute.  Raises an ArgumentError if num.to_i is less than 0.

`cellspacing=(num)`

Sets the value for the cellspacing attribute.  Raises an ArgumentError if num.to_i is less than 0.

`char=(character)`

Sets the value for the char attribute.  An ArgumentError is raised if the
argument passed has a length greater than 1 (i.e. it may only be a char).

`charoff=(value)`

Sets the value for the charoff attribute.

`colspan=(num)`

Sets the colspan attribute.

`content=(*args)`

The behavior of this method varies largely based on the type of instance
that invokes it. Here are the rules for each argument in `args`:
    
* `Table`:
    
If `arg` is a `Row`, `Head`, `Foot`, `Body` or `ColGroup` object, it is
pushed onto the table. If `arg` is a string, one `Row` object with
one one `Data` object is pushed onto the `Table`. If `arg` is an `Array`,
then one `Row` object is created and each element of the array is pushed
onto that Row.
    
* `Table::Row`:
    
If `arg` is a `Header` or `Data` object, it is pushed onto the `Row`. If
`arg` is a `String`, it is created as a single `Data` object. Any attempt
to assign any other type will raise a `TypeError`.
       
* `Table::Head`, `Table::Foot`, `Table::Body`:
    
Behave identically to `Table::Row` except that they accept Table::Row objects as well.
       
* `Table::ColGroup`:
    
Behaves identically to Table::Row except that it only accepts Col objects.
       
* `Table::Col`:
    
This method is undefined for Table::Col, because they do not accept content.
       
* `Table::Data and Table::Header`:
    
Sets the text string for the `Data` or `Header` object. Arrays are join'd.
Any other type raises a `TypeError`.

`frame=(type)`

Sets the value for the frame attribute. Valid values are border, void,
above, below, hsides, lhs, rhs, vsides, and box. An ArgumentError is
raised if an invalid type is detected.

`height=(num)`

Sets the value for the height attribute. Raises an ArgumentError if
num.to_i is less than 0.

`hspace=(num)`

Sets the value for the hspace attribute. Raises an ArgumentError if
num.to_i is less than 0.

`nowrap=(bool)`

Sets the value for the nowrap attribute. Setting it to true means it will be
included as an attribute for the Table object. The default is false (i.e. not included).

`rowspan=(num)`

Sets the value for the rowspan attribute.

`rules=(edges)`

Sets the value for the rules attribute. Valid values are "all", "groups",
"rows", "cols", or "none". An `ArgumentError` is raised if an invalid edges value
is detected.

`scope=(scope)`

Sets the value for the scope attribute.  Valid values for +scope+ are
row, col, rowgroup or colgroup.  An ArgumentError is raised if an invalid
scope value is passed.

`span=(num)`

Sets the span attribute. If num.to_i is less than 0, and ArgumentError is raised.

`summary=(string)`

Sets the value for the summary attribute.

`valign=(position)`

Sets the value for the valign attribute. Valid values are top, center,
bottom, and baseline. This is a non-standard extension.

`vspace=(num)`

Sets the value for the vspace attribute. This is a non-standard extension.

`width=(num)`

Sets the value for the width attribute.  If num is in 'x%' format, it
is retained as a string.  If num is a Fixnum (or stringified number), an
ArgumentError is raised if num.to_i is less than 0.
