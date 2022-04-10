###################################################
# caption_spec.rb
#
# Test suite for the HTML::Table::Caption class.
###################################################
require 'rspec'
require 'html/table'

RSpec.describe HTML::Table::Caption do
  before do
    @table = HTML::Table.new
    @tcaption = described_class.new
  end

  example 'constructor' do
    expect{ described_class.new }.not_to raise_error
    expect{ described_class.new('foo') }.not_to raise_error
    expect{ described_class.new(1) }.not_to raise_error
    expect{ described_class.new(%w[foo bar baz]) }.not_to raise_error
    expect{ described_class.new([1, 2, 3]) }.not_to raise_error
    expect{ described_class.new([[1, 2, 3], ['foo', 'bar']]) }.not_to raise_error
  end

  example 'basic' do
    html = '<caption></caption>'
    expect(@tcaption.html.gsub(/\s+/, '')).to eq(html)
  end

  example 'with_attributes' do
    html = "<caption align='left' valign='top'></caption>"
    @tcaption.align = 'left'
    @tcaption.valign = 'top'
    expect(@tcaption.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'configure_not_allowed' do
    expect{ @tcaption.configure }.to raise_error(NoMethodError)
  end

  example 'add_content' do
    html = '<caption>hello world</caption>'
    @tcaption.content = 'hello world'
    expect(@tcaption.html.gsub(/\s{2,}/, '')).to eq(html)
  end

  example 'add_multiple_content_items' do
    html = '<caption>hello world</caption>'
    @tcaption.content = 'hello', ' world'
    expect(@tcaption.html.gsub(/\s{2,}/, '')).to eq(html)
  end

  example 'add_content_in_constructor' do
    html = '<caption>hello world</caption>'
    @tcaption = described_class.new('hello world')
    expect(@tcaption.html.gsub(/\s{2,}/, '')).to eq(html)
  end

  example 'indent_level' do
    expect(described_class).to respond_to(:indent_level)
    expect(described_class).to respond_to(:indent_level=)
    expect{ described_class.indent_level = 'foo' }.to raise_error(ArgumentTypeError)
    expect{ described_class.indent_level = 3 }.not_to raise_error
  end

  example 'only_row_zero_allowed' do
    expect{ @table[1] = @tcaption }.to raise_error(ArgumentError)
  end

  example 'automatically_set_to_row_zero' do
    @table.content = 'hello', 'world'
    @table.push(@tcaption)
    expect(@table[0]).to be_kind_of(described_class)
  end
end
