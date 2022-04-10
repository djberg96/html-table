##################################################
# colgroup_spec.rb
#
# Test suite for the HTML::Table::ColGroup class.
##################################################
require 'rspec'
require 'html/table'

RSpec.describe HTML::Table::ColGroup do
  before do
    @cgroup = described_class.new
    @col = HTML::Table::ColGroup::Col.new
  end

  example 'constructor' do
    expect{ described_class.new }.not_to raise_error
    expect{ described_class.new(@col) }.not_to raise_error
    expect{ described_class.new('foo') }.to raise_error(TypeError)
  end

  example 'basic' do
    html = '<colgroup></colgroup>'
    expect(@cgroup.html.gsub(/\s+/, '')).to eq(html)
  end

  example 'with_attributes' do
    html = "<colgroup align='center' width='20%'></colgroup>"
    @cgroup.align = 'center'
    @cgroup.width = '20%'
    expect(@cgroup.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'push_single_col_element' do
    html = '<colgroup><col></colgroup>'
    @cgroup.push(@col)
    expect(@cgroup.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'index_assignment_constraints' do
    expect{ @cgroup[0] = 'foo' }.to raise_error(ArgumentTypeError)
    expect{ @cgroup[0] = 1 }.to raise_error(ArgumentTypeError)
    expect{ @cgroup[1] = HTML::Table::Row.new }.to raise_error(ArgumentTypeError)
    expect{ @cgroup[0] = HTML::Table::ColGroup::Col.new }.not_to raise_error
  end

  example 'push_constraints' do
    expect{ @cgroup.push(7) }.to raise_error(TypeError)
    expect{ @cgroup.push('hello') }.to raise_error(TypeError)
    expect{ @cgroup.push(HTML::Table::Row.new) }.to raise_error(TypeError)
    expect{ @cgroup.push(HTML::Table::ColGroup::Col.new) }.not_to raise_error
  end

  example 'double_arrow_constraints' do
    expect{ @cgroup << 7 }.to raise_error(TypeError)
    expect{ @cgroup << 'hello' }.to raise_error(TypeError)
    expect{ @cgroup << HTML::Table::Row.new }.to raise_error(TypeError)
    expect{ @cgroup << HTML::Table::ColGroup::Col.new }.not_to raise_error
  end

  example 'configure_error' do
    expect{ @cgroup.configure(0, 0){} }.to raise_error(ArgumentError)
  end

  example 'content_error' do
    expect{ @cgroup.content }.to raise_error(NoMethodError)
    expect{ @cgroup.content = 'blah' }.to raise_error(NoMethodError)
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
