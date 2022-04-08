############################################
# row_spec.rb
#
# Specs for the Table::Row class.
############################################
require 'rspec'
require 'html/table'
include HTML

RSpec.describe HTML::Table::Row do
  before do
    @trow = described_class.new
  end

  example 'constructor' do
    expect{ Table::Row.new }.not_to raise_error
    expect{ Table::Row.new('foo') }.not_to raise_error
    expect{ Table::Row.new(1) }.not_to raise_error
    expect{ Table::Row.new([1, 2, 3]) }.not_to raise_error
    expect{ Table::Row.new([[1, 2, 3], ['foo', 'bar']]) }.not_to raise_error
  end

  example 'basic' do
    html = '<tr></tr>'
    expect(@trow.html.gsub(/\s+/, '')).to eq(html)
  end

  example 'header' do
    expect(@trow).to respond_to(:header?)
    expect(@trow).to respond_to(:header=)
    expect{ @trow.header? }.not_to raise_error
    expect{ @trow.header = true }.not_to raise_error
  end

  example 'with_attributes' do
    html = "<tr align='center'></tr>"
    @trow.align = 'center'
    expect(@trow.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'index_assignment_constraints' do
    expect{ @trow[0] = 'foo' }.to raise_error(ArgumentTypeError)
    expect{ @trow[0] = 1 }.to raise_error(ArgumentTypeError)
    expect{ @trow[0] = Table::Caption.new }.to raise_error(ArgumentTypeError)
    expect{ @trow[0] = Table::Row::Data.new }.not_to raise_error
    expect{ @trow[0] = Table::Row::Header.new }.not_to raise_error
  end

  example 'push_constraints' do
    expect{ @trow.push(Table::Caption.new) }.to raise_error(ArgumentTypeError)
    expect{ @trow.push(nil) }.to raise_error(ArgumentTypeError)
    expect{ @trow.push('test') }.not_to raise_error
    expect{ @trow.push(7) }.not_to raise_error
    expect{ @trow.push(Table::Row::Data.new) }.not_to raise_error
    expect{ @trow.push(Table::Row::Header.new) }.not_to raise_error
  end

  example 'double_arrow_constraints' do
    expect{ @trow << Table::Caption.new }.to raise_error(ArgumentTypeError)
    expect{ @trow << 'test' }.not_to raise_error
    expect{ @trow << 'test' << 'foo' }.not_to raise_error
    expect{ @trow << Table::Row::Data.new }.not_to raise_error
    expect{ @trow << Table::Row::Header.new }.not_to raise_error
  end

  example 'header_in_constructor' do
    expect{ @trow = Table::Row.new('test', true) }.not_to raise_error
    html = '<tr><th>test</th></tr>'
    expect(@trow.html.gsub(/\s+/, '')).to eq(html)
  end

  example 'push_single_data_element' do
    html = '<tr><td>hello</td></tr>'
    @trow.push Table::Row::Data.new{ |d| d.content = 'hello' }
    expect(@trow.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'push_multiple_data_element' do
    html = '<tr><td>hello</td><td>world</td></tr>'
    d1 = Table::Row::Data.new{ |d| d.content = 'hello' }
    d2 = Table::Row::Data.new{ |d| d.content = 'world' }
    @trow.push d1, d2
    expect(@trow.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'add_content_directly' do
    html = '<tr><td>hello</td><td>world</td></tr>'
    @trow.content = 'hello', 'world'
    expect(@trow.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'add_content_in_constructor' do
    html = '<tr><td>hello</td><td>world</td></tr>'
    @trow = Table::Row.new(%w/hello world/)
    expect(@trow.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'configure_column' do
    html = "<tr><td>hello</td><td abbr='test' width=3 nowrap>world</td></tr>"
    @trow.content = 'hello', 'world'
    @trow.configure(1){ |d|
      d.abbr = 'test'
      d.width = 3
      d.nowrap = true
    }
    expect(@trow.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'unshift_constraints' do
    expect{ @trow.unshift(Table::Caption.new) }.to raise_error(ArgumentTypeError)
    expect{ @trow.unshift(nil) }.to raise_error(ArgumentTypeError)
    expect{ @trow.unshift('test') }.not_to raise_error
    expect{ @trow.unshift(7) }.not_to raise_error
    expect{ @trow.unshift(Table::Row::Data.new) }.not_to raise_error
    expect{ @trow.unshift(Table::Row::Header.new) }.not_to raise_error
  end

  example 'configure_error' do
    expect{ @trow.configure(0, 0){ }.to raise_error(ArgumentError) }
  end

  example 'indent_level' do
    expect(Table::Row).to respond_to(:indent_level)
    expect(Table::Row).to respond_to(:indent_level=)
    expect{ Table::Row.indent_level = 'foo' }.to raise_error(ArgumentTypeError)
    expect{ Table::Row.indent_level = 3 }.not_to raise_error
  end

  example 'end_tags' do
    expect(Table::Row).to respond_to(:end_tags?)
    expect(Table::Row).to respond_to(:end_tags=)
    expect{ Table::Row.end_tags = 'foo' }.to raise_error(ArgumentTypeError)
    expect{ Table::Row.end_tags = 1 }.to raise_error(ArgumentTypeError)
    expect{ Table::Row.end_tags = true }.not_to raise_error
  end
end
