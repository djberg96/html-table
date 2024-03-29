#####################################################
# header_spec.rb
#
# Test suite for the HTML::Table::Row::Header class.
#####################################################
require 'rspec'
require 'html/table'

RSpec.describe HTML::Table::Row::Header do
  before do
    @theader = described_class.new
  end

  example 'basic' do
    html = '<th></th>'
    expect(@theader.html.gsub(/\s+/, '')).to eq(html)
  end

  example 'constructor' do
    expect{ described_class.new }.not_to raise_error
  end

  example 'constructor with string' do
    expect{ described_class.new('foo') }.not_to raise_error
  end

  example 'constructor with numeric' do
    expect{ described_class.new(1) }.not_to raise_error
  end

  example 'constructor with arrays' do
    expect{ described_class.new(%w[foo bar baz]) }.not_to raise_error
    expect{ described_class.new([1, 2, 3]) }.not_to raise_error
    expect{ described_class.new([[1, 2, 3], %w[foo bar]]) }.not_to raise_error
  end

  example 'with_attributes' do
    html = "<th align='left' colspan=3 nowrap></th>"
    @theader.align = 'left'
    @theader.colspan = 3
    @theader.nowrap = true
    expect(@theader.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'configure_not_allowed' do
    expect{ @theader.configure }.to raise_error(NoMethodError)
  end

  example 'add_content' do
    html = '<th>hello world</th>'
    @theader.content = 'hello world'
    expect(@theader.html.gsub(/\s{2,}/, '')).to eq(html)
  end

  example 'add_multiple_content_items' do
    html = '<th>hello world</th>'
    @theader.content = 'hello', ' world'
    expect(@theader.html.gsub(/\s{2,}/, '')).to eq(html)
  end

  example 'add_content_in_constructor' do
    html = '<th>hello world</th>'
    @theader = described_class.new('hello world')
    expect(@theader.html.gsub(/\s{2,}/, '')).to eq(html)
  end

  example 'indent_level' do
    expect(described_class).to respond_to(:indent_level)
    expect(described_class).to respond_to(:indent_level=)
    expect{ described_class.indent_level = 'foo' }.to raise_error(ArgumentTypeError)
    expect{ described_class.indent_level = 6 }.not_to raise_error
  end

  example 'end_tags? basic functionality' do
    expect(described_class).to respond_to(:end_tags?)
    expect(described_class.end_tags?).to be(true)
  end

  example 'end_tags= only accepts valid types' do
    expect(described_class).to respond_to(:end_tags=)
    expect{ described_class.end_tags = 'foo' }.to raise_error(ArgumentTypeError)
    expect{ described_class.end_tags = 1 }.to raise_error(ArgumentTypeError)
    expect{ described_class.end_tags = true }.not_to raise_error
  end
end
