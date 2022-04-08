###################################################
# data_spec.rb
#
# Test suite for the HTML::Table::Row::Data class.
###################################################
require 'rspec'
require 'html/table'

RSpec.describe HTML::Table::Row::Data do
  before do
    @tdata = described_class.new
  end

  example 'constructor' do
    expect{ described_class.new }.not_to raise_error
    expect{ described_class.new('foo') }.not_to raise_error
    expect{ described_class.new(1) }.not_to raise_error
    expect{ described_class.new(%w/foo bar baz/) }.not_to raise_error
    expect{ described_class.new([1,2,3]) }.not_to raise_error
    expect{ described_class.new([[1,2,3],['foo','bar']]) }.not_to raise_error
  end

  example 'basic' do
    html = '<td></td>'
    expect(@tdata.html.gsub(/\s+/, '')).to eq(html)
  end

  example 'with_attributes' do
    html = "<td align='left' width=3 nowrap></td>"
    @tdata.align = 'left'
    @tdata.width = 3
    @tdata.nowrap = true
    expect(@tdata.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'configure_not_allowed' do
    expect{ @tdata.configure }.to raise_error(NoMethodError)
  end

  example 'add_content' do
    html = '<td>hello world</td>'
    @tdata.content = 'hello world'
    expect(@tdata.html.gsub(/\s{2,}/, '')).to eq(html)
  end

  example 'add_content_in_constructor' do
    html = '<td>hello world</td>'
    td = described_class.new('hello world')
    expect(td.html.gsub(/\s{2,}/, '')).to eq(html)
  end

  example 'add_multiple_content_items' do
    html = '<td>hello world</td>'
    @tdata.content = 'hello',' world'
    expect(@tdata.html.gsub(/\s{2,}/, '')).to eq(html)
  end

  example 'indent_level' do
    expect(described_class).to respond_to(:indent_level)
    expect(described_class).to respond_to(:indent_level=)
    expect{ described_class.indent_level = 'foo' }.to raise_error(ArgumentTypeError)
    expect{ described_class.indent_level = 6 }.not_to raise_error
  end

  example 'end_tags' do
    expect(described_class).to respond_to(:end_tags?)
    expect(described_class).to respond_to(:end_tags=)
    expect{ described_class.end_tags = 'foo' }.to raise_error(ArgumentTypeError)
    expect{ described_class.end_tags = 1 }.to raise_error(ArgumentTypeError)
    expect{ described_class.end_tags = true }.not_to raise_error
  end
end
