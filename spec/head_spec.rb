###############################################################################
# head_spec.rb
#
# Test suite for the described_class class. The Table::Head class is a singleton
# class, so we have to take extra measures to ensure that a fresh instance
# is created between tests.
###############################################################################
require 'rspec'
require 'html/table'

#####################################################################
# Ensure that a fresh instance of described_class is used between tests
# by calling 'refresh' in the 'teardown' method.
#####################################################################
class HTML::Table::Head
  private

  def refresh
    @@head = nil
  end
end

RSpec.describe HTML::Table::Head do
  before do
    @table = HTML::Table.new
    @thead = described_class.create
  end

  after do
    @table = nil
    @thead.send(:refresh)
    @thead = nil
  end

  example 'constructor' do
    expect{ described_class.create }.not_to raise_error
  end

  example 'constructor with string' do
    expect{ described_class.create('foo') }.not_to raise_error
  end

  example 'constructor with numeric' do
    expect{ described_class.create(1) }.not_to raise_error
  end

  example 'constructor with arrays' do
    expect{ described_class.create(%w[foo bar baz]) }.not_to raise_error
    expect{ described_class.create([1, 2, 3]) }.not_to raise_error
    expect{ described_class.create([[1, 2, 3], %w[foo bar]]) }.not_to raise_error
  end

  example 'basic' do
    html = '<thead></thead>'
    expect(@thead.html.gsub(/\s{2,}|\n/, '')).to eq(html)
  end

  example 'end_tags? basic functionality' do
    expect(described_class).to respond_to(:end_tags?)
    expect(described_class.end_tags?).to be(true)
  end

  example 'end_tags= does not allow invalid types' do
    expect(described_class).to respond_to(:end_tags=)
    expect{ described_class.end_tags? }.not_to raise_error
    expect{ described_class.end_tags = true }.not_to raise_error
    expect{ described_class.end_tags = 'foo' }.to raise_error(HTML::Mixin::StrongTyping::ArgumentTypeError)
  end

  example 'with_attributes' do
    html = "<thead align='left' char='x'></thead>"
    @thead.align = 'left'
    @thead.char = 'x'
    expect(@thead.html.gsub(/\s{2,}|\n/, '')).to eq(html)
  end

  example 'push_single_row' do
    html = '<thead><tr><td>test</td></tr></thead>'
    @thead.push(HTML::Table::Row.new{ |r| r.content = 'test' })
    expect(@thead.html.gsub(/\s{2,}|\n/, '')).to eq(html)
  end

  example 'push_multiple_rows' do
    html = '<thead><tr><td>test</td></tr><tr><td>foo</td></tr></thead>'
    r1 = HTML::Table::Row.new('test')
    r2 = HTML::Table::Row.new('foo')
    @thead.push(r1, r2)
    expect(@thead.html.gsub(/\s{2,}|\n/, '')).to eq(html)
  end

  example 'add_content_directly' do
    html = '<thead><tr><td>hello</td><td>world</td></tr></thead>'
    @thead.content = 'hello', 'world'
    expect(@thead.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'add_content_in_constructor' do
    html = '<thead><tr><td>hello</td><td>world</td></tr></thead>'
    @thead.send(:refresh)
    @thead = described_class.create(%w[hello world])
    expect(@thead.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'configure_column' do
    html = "<thead><tr><td>hello</td><td abbr='test' width=3 nowrap>world"
    html += '</td></tr></thead>'
    @thead.content = 'hello', 'world'
    @thead.configure(0, 1) do |d|
      d.abbr = 'test'
      d.width = 3
      d.nowrap = true
    end
    expect(@thead.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end
end
