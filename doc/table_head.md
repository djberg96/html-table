## Description
A Table::Head object represents a single `<THEAD></THEAD>` instance for an HTML Table.

## Notes
In virtually every respect the Table::Head class is identical to
the Table or Table::Row class. There are two significant differences.
First, the Table::Head class is a singleton. There can be only one
Table::Head instance per table. Second, if an instance of Table::Head
is added to a table, it will be automatically be put at index 0 (or 1
if a Table::Caption exists).
