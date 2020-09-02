#######################################################################
# table_spec.rb
#
# Specs for the HTML::Table class. These specs should be run via the
# 'rake spec' or 'rake spec:table' task.
#######################################################################
require 'rspec'
require 'html/table'
include HTML

RSpec.describe HTML::Table do
  before do
    @table = Table.new
  end

  example "version" do
    expect(Table::VERSION).to eq('1.6.3')
    expect(Table::VERSION.frozen?).to be true
  end

  example "constructor" do
    expect{ Table.new }.not_to raise_error
    expect{ Table.new('foo') }.not_to raise_error
    expect{ Table.new(1) }.not_to raise_error
    expect{ Table.new(%w/foo bar baz/) }.not_to raise_error
    expect{ Table.new([1,2,3]) }.not_to raise_error
    expect{ Table.new([[1,2,3],['foo','bar']]) }.not_to raise_error
  end

  example "constructor_with_attributes" do
    expect{ Table.new(%w[foo bar baz], :border => 1) }.not_to raise_error
  end

  example "html_case" do
    expect(Table).to respond_to(:html_case)
    expect(Table).to respond_to(:html_case=)
    expect{ Table.html_case = 'upper' }.not_to raise_error
    expect{ Table.html_case = 'lower' }.not_to raise_error
    expect{ Table.html_case = 'foo' }.to raise_error(ArgumentError)
    expect{ Table.html_case = 7 }.to raise_error(ArgumentTypeError)
  end

  example "indent_level" do
    expect(Table).to respond_to(:indent_level)
    expect(Table).to respond_to(:indent_level=)
    expect{ Table.indent_level = 0 }.not_to raise_error
    expect{ Table.indent_level = 'foo' }.to raise_error(ArgumentTypeError)
  end

  example "index" do
    expect{ @table[0] = 'foo' }.to raise_error(ArgumentTypeError)
  end

  example "caption_index_constraints" do
    expect{ @table[0] = Table::Caption.new }.not_to raise_error
    expect{ @table[1] = Table::Caption.new }.to raise_error(ArgumentError)
  end

  example "head_index_constraints" do
    expect{ @table[0] = Table::Head.create }.not_to raise_error
    expect{ @table[1] = Table::Head.create }.to raise_error(ArgumentError)
    expect{ @table[2] = Table::Head.create }.to raise_error(ArgumentError)
  end

  example "foot_index_constraints" do
    expect {
      @table[0] = Table::Caption.new
      @table[-1] = Table::Foot.create
    }.not_to raise_error
    expect{ @table[0] = Table::Foot.create }.to raise_error(ArgumentError)
  end

  example "unshift_constraints" do
    expect{ @table.unshift Table::Row.new }.not_to raise_error
    expect{ @table.unshift Table::Row::Data.new }.to raise_error(ArgumentTypeError)
    expect{ @table.unshift 'foo' }.to raise_error(ArgumentTypeError)
  end

  example "push_constraints" do
    expect{ @table.push Table::Row.new }.not_to raise_error
    expect{ @table.push('foo') }.to raise_error(ArgumentTypeError)
    expect{ @table.push(7) }.to raise_error(ArgumentTypeError)
    expect{ @table.push(nil) }.to raise_error(ArgumentTypeError)
  end

  example "double_arrow_constraints" do
    expect{ @table << Table::Row.new }.not_to raise_error
    expect{ @table << Table::Row.new << Table::Row.new }.not_to raise_error
    expect{ @table << 'foo' }.to raise_error(ArgumentTypeError)
    expect{ @table << 7 }.to raise_error(ArgumentTypeError)
    expect{ @table << nil }.to raise_error(ArgumentTypeError)
  end

  example "basic" do
    html = "<table>\n</table>"
    expect(@table.html).to eq(html)
  end

  example "with_attributes" do
    html = "<table border=1 align='left' nowrap>\n</table>"
    @table.border = 1
    @table.align = 'left'
    @table.nowrap = true
    expect( @table.html).to eq(html)
  end

  example "add_row_push" do
    html = '<table><tr></tr></table>'
    @table.push(Table::Row.new)
    expect(@table.html.gsub(/\s+/, '')).to eq(html)
  end

  example "add_row_by_index" do
    html = '<table><tr></tr></table>'
    @table[0] = Table::Row.new
    expect(@table.html.gsub(/\s+/, '')).to eq(html)
  end

  example "add_multiple_rows" do
    html = '<table><tr></tr><tr></tr></table>'
    @table.push Table::Row.new, Table::Row.new
    expect(@table.html.gsub(/\s+/, '')).to eq(html)
  end

  example "add_single_data_element" do
    html = '<table><tr><td>hello</td></tr></table>'
    @table.content = 'hello'
    expect(@table.html.gsub(/\s+/, '')).to eq(html)
  end

  example "add_multiple_data_elements" do
    html = '<table><tr><td>hello</td></tr><tr><td>world</td></tr></table>'
    @table.content = 'hello','world'
    expect(@table.html.gsub(/\s+/, '')).to eq(html)
  end

  example "configure_row" do
    html = "<table><tr align='center'><td bgcolor='red'>hello</td></tr>"
    html << '</table>'
    @table.push Table::Row::Data.new{ |d| d.content = 'hello' }
    @table.configure(0){ |t| t.align = 'center' }
    @table.configure(0,0){ |d| d.bgcolor = 'red' }
    expect(@table.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example "global_end_tags" do
    expect(Table).to respond_to(:global_end_tags?)
    expect(Table).to respond_to(:global_end_tags=)
    expect{ Table.global_end_tags = false }.not_to raise_error
    expect{ Table.global_end_tags = true }.not_to raise_error
    expect{ Table.global_end_tags = 'foo' }.to raise_error(ArgumentTypeError)
  end
end
