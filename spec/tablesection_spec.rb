######################################################
# tablesection_spec.rb
#
# Test suite for the HTML::Table::TableSection class.
######################################################
require 'rspec'
require 'html/table'

RSpec.describe HTML::Table::TableSection do
  before do
    @table = Table.new
    @tsection = described_class.new
  end

  example 'indent_level' do
    expect(described_class).to respond_to(:indent_level)
    expect(described_class).to respond_to(:indent_level=)
    expect{ described_class.indent_level = 'foo' }.to raise_error(ArgumentTypeError)
    expect{ described_class.indent_level = 3 }.not_to raise_error
  end

  example 'indices' do
    expect{ @tsection[0] = 'foo' }.to raise_error(ArgumentTypeError)
    expect{ @tsection[0] = HTML::Table::Row.new }.not_to raise_error
  end

  example 'push' do
    expect{ @tsection.push('foo') }.to raise_error(ArgumentTypeError)
    expect{ @tsection.push(HTML::Table::Row.new) }.not_to raise_error
  end

  example 'unshift' do
    expect{ @tsection.unshift('foo') }.to raise_error(ArgumentTypeError)
    expect{ @tsection.unshift(HTML::Table::Row.new) }.not_to raise_error
  end
end
