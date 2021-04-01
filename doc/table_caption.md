## Description
A Table::Caption object represents a single `<CAPTION></CAPTION>` instance
for an HTML Table.

## Notes
The Table::Caption class is virtually identical to the Table::Row::Data
class. There is one important behavioral difference, however. First,
there can only be one Table::Caption. If you attempt to add a second one,
it will merely overwrite the existing one. Second, a Table::Caption is
always bumped to index 0.
