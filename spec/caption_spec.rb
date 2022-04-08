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
    @tcaption = HTML::Table::Caption.new
  end

  example 'constructor' do
    expect{ HTML::Table::Caption.new }.not_to raise_error
    expect{ HTML::Table::Caption.new('foo') }.not_to raise_error
    expect{ HTML::Table::Caption.new(1) }.not_to raise_error
    expect{ HTML::Table::Caption.new(%w/foo bar baz/) }.not_to raise_error
    expect{ HTML::Table::Caption.new([1,2,3]) }.not_to raise_error
    expect{ HTML::Table::Caption.new([[1,2,3],['foo','bar']]) }.not_to raise_error
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
    @tcaption.content = 'hello',' world'
    expect(@tcaption.html.gsub(/\s{2,}/, '')).to eq(html)
  end

  example 'add_content_in_constructor' do
    html = '<caption>hello world</caption>'
    @tcaption = HTML::Table::Caption.new('hello world')
    expect(@tcaption.html.gsub(/\s{2,}/, '')).to eq(html)
  end

  example 'indent_level' do
    expect(HTML::Table::Caption).to respond_to(:indent_level)
    expect(HTML::Table::Caption).to respond_to(:indent_level=)
    expect{ HTML::Table::Caption.indent_level = 'foo' }.to raise_error(ArgumentTypeError)
    expect{ HTML::Table::Caption.indent_level = 3 }.not_to raise_error
  end

  example 'only_row_zero_allowed' do
    expect{ @table[1] = @tcaption }.to raise_error(ArgumentError)
  end

  example 'automatically_set_to_row_zero' do
    @table.content = 'hello','world'
    @table.push(@tcaption)
    expect(@table[0]).to be_kind_of(HTML::Table::Caption)
  end
end
