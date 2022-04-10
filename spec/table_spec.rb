#######################################################################
# table_spec.rb
#
# Specs for the HTML::Table class. These specs should be run via the
# 'rake spec' or 'rake spec:table' task.
#######################################################################
require 'rspec'
require 'html/table'

RSpec.describe HTML::Table do
  before do
    @table = described_class.new
    @original_case = described_class.html_case
  end

  after do
    described_class.html_case = @original_case
  end

  example 'version' do
    expect(described_class::VERSION).to eq('1.7.0')
    expect(described_class::VERSION).to be_frozen
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

  example 'constructor_with_attributes' do
    expect{ described_class.new(%w[foo bar baz], border: 1) }.not_to raise_error
  end

  example 'html_case method basic functionality' do
    expect(described_class).to respond_to(:html_case)
    expect(described_class).to respond_to(:html_case=)
  end

  example "html_case writer method only accepts 'upper' and 'lower'" do
    expect{ described_class.html_case = 'upper' }.not_to raise_error
    expect{ described_class.html_case = 'lower' }.not_to raise_error
    expect{ described_class.html_case = 'foo' }.to raise_error(ArgumentError)
    expect{ described_class.html_case = 7 }.to raise_error(ArgumentTypeError)
  end

  example 'html_case causes uppercased output as expected' do
    html = '<TABLE><TR><TD>hello</TD></TR></TABLE>'
    described_class.html_case = 'upper'
    @table.content = 'hello'
    expect(@table.html.gsub(/\s+/, '')).to eq(html)
  end

  example 'indent_level' do
    expect(described_class).to respond_to(:indent_level)
    expect(described_class).to respond_to(:indent_level=)
    expect{ described_class.indent_level = 0 }.not_to raise_error
    expect{ described_class.indent_level = 'foo' }.to raise_error(ArgumentTypeError)
  end

  example 'index' do
    expect{ @table[0] = 'foo' }.to raise_error(ArgumentTypeError)
  end

  example 'caption_index_constraints' do
    expect{ @table[0] = described_class::Caption.new }.not_to raise_error
    expect{ @table[1] = described_class::Caption.new }.to raise_error(ArgumentError)
  end

  example 'head_index_constraints' do
    expect{ @table[0] = described_class::Head.create }.not_to raise_error
    expect{ @table[1] = described_class::Head.create }.to raise_error(ArgumentError)
    expect{ @table[2] = described_class::Head.create }.to raise_error(ArgumentError)
  end

  example 'foot_index_constraints' do
    expect do
      @table[0] = described_class::Caption.new
      @table[-1] = described_class::Foot.create
    end.not_to raise_error
    expect{ @table[0] = described_class::Foot.create }.to raise_error(ArgumentError)
  end

  example 'unshift_constraints' do
    expect{ @table.unshift described_class::Row.new }.not_to raise_error
    expect{ @table.unshift described_class::Row::Data.new }.to raise_error(ArgumentTypeError)
    expect{ @table.unshift 'foo' }.to raise_error(ArgumentTypeError)
  end

  example 'push_constraints' do
    expect{ @table.push described_class::Row.new }.not_to raise_error
    expect{ @table.push('foo') }.to raise_error(ArgumentTypeError)
    expect{ @table.push(7) }.to raise_error(ArgumentTypeError)
    expect{ @table.push(nil) }.to raise_error(ArgumentTypeError)
  end

  example 'double arrow allows valid values' do
    expect{ @table << HTML::Table::Row.new }.not_to raise_error
    expect{ @table << HTML::Table::Row.new << HTML::Table::Row.new }.not_to raise_error
  end

  example 'double arrow raises an error for invalid types' do
    expect{ @table << 'foo' }.to raise_error(ArgumentTypeError)
    expect{ @table << 7 }.to raise_error(ArgumentTypeError)
    expect{ @table << nil }.to raise_error(ArgumentTypeError)
  end

  example 'basic' do
    html = "<table>\n</table>"
    expect(@table.html).to eq(html)
  end

  example 'with_attributes' do
    html = "<table border=1 align='left' nowrap>\n</table>"
    @table.border = 1
    @table.align = 'left'
    @table.nowrap = true
    expect(@table.html).to eq(html)
  end

  example 'add_row_push' do
    html = '<table><tr></tr></table>'
    @table.push(described_class::Row.new)
    expect(@table.html.gsub(/\s+/, '')).to eq(html)
  end

  example 'add_row_by_index' do
    html = '<table><tr></tr></table>'
    @table[0] = described_class::Row.new
    expect(@table.html.gsub(/\s+/, '')).to eq(html)
  end

  example 'add_multiple_rows' do
    html = '<table><tr></tr><tr></tr></table>'
    @table.push HTML::Table::Row.new, HTML::Table::Row.new
    expect(@table.html.gsub(/\s+/, '')).to eq(html)
  end

  example 'add_single_data_element' do
    html = '<table><tr><td>hello</td></tr></table>'
    @table.content = 'hello'
    expect(@table.html.gsub(/\s+/, '')).to eq(html)
  end

  example 'add_multiple_data_elements' do
    html = '<table><tr><td>hello</td></tr><tr><td>world</td></tr></table>'
    @table.content = 'hello', 'world'
    expect(@table.html.gsub(/\s+/, '')).to eq(html)
  end

  example 'configure_row' do
    html = "<table><tr align='center'><td bgcolor='red'>hello</td></tr>"
    html << '</table>'
    @table.push(HTML::Table::Row::Data.new{ |d| d.content = 'hello' })
    @table.configure(0){ |t| t.align = 'center' }
    @table.configure(0, 0){ |d| d.bgcolor = 'red' }
    expect(@table.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'global_end_tags? basic functionality' do
    expect(described_class).to respond_to(:global_end_tags?)
    expect(described_class.global_end_tags?).to be(true)
  end

  example 'global_end_tags= basic functionality' do
    expect(described_class).to respond_to(:global_end_tags=)
  end

  example 'global_end_tags= only accepts valid values' do
    expect{ described_class.global_end_tags = false }.not_to raise_error
    expect{ described_class.global_end_tags = true }.not_to raise_error
    expect{ described_class.global_end_tags = 'foo' }.to raise_error(ArgumentTypeError)
  end
end
