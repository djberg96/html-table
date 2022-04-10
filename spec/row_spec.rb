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
    expect{ Table::Row.new([[1, 2, 3], %w[foo bar]]) }.not_to raise_error
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

  example 'with attributes' do
    html = "<tr align='center'></tr>"
    @trow.align = 'center'
    expect(@trow.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'index assignment constraints' do
    expect{ @trow[0] = 'foo' }.to raise_error(ArgumentTypeError)
    expect{ @trow[0] = 1 }.to raise_error(ArgumentTypeError)
    expect{ @trow[0] = Table::Caption.new }.to raise_error(ArgumentTypeError)
    expect{ @trow[0] = Table::Row::Data.new }.not_to raise_error
    expect{ @trow[0] = Table::Row::Header.new }.not_to raise_error
  end

  example 'push constraints' do
    expect{ @trow.push(Table::Caption.new) }.to raise_error(ArgumentTypeError)
    expect{ @trow.push(nil) }.to raise_error(ArgumentTypeError)
    expect{ @trow.push('test') }.not_to raise_error
    expect{ @trow.push(7) }.not_to raise_error
    expect{ @trow.push(Table::Row::Data.new) }.not_to raise_error
    expect{ @trow.push(Table::Row::Header.new) }.not_to raise_error
  end

  example 'double arrow constraints' do
    expect{ @trow << Table::Caption.new }.to raise_error(ArgumentTypeError)
    expect{ @trow << 'test' }.not_to raise_error
    expect{ @trow << 'test' << 'foo' }.not_to raise_error
    expect{ @trow << Table::Row::Data.new }.not_to raise_error
    expect{ @trow << Table::Row::Header.new }.not_to raise_error
  end

  example 'header in constructor' do
    expect{ @trow = Table::Row.new('test', true) }.not_to raise_error
    html = '<tr><th>test</th></tr>'
    expect(@trow.html.gsub(/\s+/, '')).to eq(html)
  end

  example 'push single data element' do
    html = '<tr><td>hello</td></tr>'
    @trow.push(Table::Row::Data.new{ |d| d.content = 'hello' })
    expect(@trow.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'push multiple data element' do
    html = '<tr><td>hello</td><td>world</td></tr>'
    d1 = Table::Row::Data.new{ |d| d.content = 'hello' }
    d2 = Table::Row::Data.new{ |d| d.content = 'world' }
    @trow.push d1, d2
    expect(@trow.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'add content directly' do
    html = '<tr><td>hello</td><td>world</td></tr>'
    @trow.content = 'hello', 'world'
    expect(@trow.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'add content in constructor' do
    html = '<tr><td>hello</td><td>world</td></tr>'
    @trow = Table::Row.new(%w[hello world])
    expect(@trow.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'configure column' do
    html = "<tr><td>hello</td><td abbr='test' width=3 nowrap>world</td></tr>"
    @trow.content = 'hello', 'world'
    @trow.configure(1) do |d|
      d.abbr = 'test'
      d.width = 3
      d.nowrap = true
    end
    expect(@trow.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'unshift does not allow invalid types' do
    expect{ @trow.unshift(Table::Caption.new) }.to raise_error(ArgumentTypeError)
    expect{ @trow.unshift(nil) }.to raise_error(ArgumentTypeError)
  end

  example 'unshift allows proper types' do
    expect{ @trow.unshift('test') }.not_to raise_error
    expect{ @trow.unshift(7) }.not_to raise_error
    expect{ @trow.unshift(Table::Row::Data.new) }.not_to raise_error
    expect{ @trow.unshift(Table::Row::Header.new) }.not_to raise_error
  end

  example 'configure error' do
    expect{ @trow.configure(0, 0){} }.to raise_error(ArgumentError)
  end

  example 'indent_level' do
    expect(Table::Row).to respond_to(:indent_level)
    expect(Table::Row).to respond_to(:indent_level=)
    expect{ Table::Row.indent_level = 'foo' }.to raise_error(ArgumentTypeError)
    expect{ Table::Row.indent_level = 3 }.not_to raise_error
  end

  example 'end_tags?' do
    expect(Table::Row).to respond_to(:end_tags?)
    expect(Table::Row.end_tags?).to be(true)
  end

  example 'end_tags= basic functionality' do
    expect(Table::Row).to respond_to(:end_tags=)
    expect{ Table::Row.end_tags = true }.not_to raise_error
  end

  example 'end_tags= rejects invalid values' do
    expect{ Table::Row.end_tags = 'foo' }.to raise_error(ArgumentTypeError)
    expect{ Table::Row.end_tags = 1 }.to raise_error(ArgumentTypeError)
  end
end
