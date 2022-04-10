###############################################################################
# foot_spec.rb
#
# Test suite for the HTML::Table::Foot class. The class is a singleton
# class, so we have to take extra measures to ensure that a fresh instance
# is created between tests.
###############################################################################
require 'rspec'
require 'html/table'

class HTML::Table::Foot
  private

  def refresh
    @@foot = nil
  end
end

RSpec.describe HTML::Table::Foot do
  before do
    @table = HTML::Table.new
    @tfoot = described_class.create
  end

  after do
    @table = nil
    @tfoot.send(:refresh)
    @tfoot = nil
  end

  example 'new_not_allowed' do
    expect{ described_class.new }.to raise_error(NoMethodError)
  end

  example 'constructor' do
    expect{ described_class.create }.not_to raise_error
    expect{ described_class.create('foo') }.not_to raise_error
    expect{ described_class.create(1) }.not_to raise_error
    expect{ described_class.create(%w[foo bar baz]) }.not_to raise_error
    expect{ described_class.create([1, 2, 3]) }.not_to raise_error
    expect{ described_class.create([[1, 2, 3], %w[foo bar]]) }.not_to raise_error
  end

  example 'basic' do
    html = '<tfoot></tfoot>'
    expect(@tfoot.html.gsub(/\s{2,}|\n/, '')).to eq(html)
  end

  example 'end_tags' do
    expect(described_class).to respond_to(:end_tags?)
    expect(described_class).to respond_to(:end_tags=)
    expect{ described_class.end_tags? }.not_to raise_error
    expect{ described_class.end_tags = true }.not_to raise_error
  end

  example 'end_tags_expected_errors' do
    expect{ described_class.end_tags = 'foo' }.to raise_error(HTML::Mixin::StrongTyping::ArgumentTypeError)
  end

  example 'with_attributes' do
    html = "<tfoot align='left' char='x'></tfoot>"
    @tfoot.align = 'left'
    @tfoot.char = 'x'
    expect(@tfoot.html.gsub(/\s{2,}|\n/, '')).to eq(html)
  end

  example 'push_single_row' do
    html = '<tfoot><tr><td>test</td></tr></tfoot>'
    @tfoot.push(Table::Row.new{ |r| r.content = 'test' })
    expect(@tfoot.html.gsub(/\s{2,}|\n/, '')).to eq(html)
  end

  example 'push_multiple_rows' do
    html = '<tfoot><tr><td>test</td></tr><tr><td>foo</td></tr></tfoot>'
    r1 = Table::Row.new{ |r| r.content = 'test' }
    r2 = Table::Row.new{ |r| r.content = 'foo' }
    @tfoot.push r1, r2
    expect(@tfoot.html.gsub(/\s{2,}|\n/, '')).to eq(html)
  end

  example 'add_content_directly' do
    html = '<tfoot><tr><td>hello</td><td>world</td></tr></tfoot>'
    @tfoot.content = 'hello', 'world'
    expect(@tfoot.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'add_content_in_constructor' do
    html = '<tfoot><tr><td>hello</td><td>world</td></tr></tfoot>'
    @tfoot.send(:refresh)
    @tfoot = described_class.create(%w[hello world])
    expect(@tfoot.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'configure_column' do
    html = "<tfoot><tr><td>hello</td><td abbr='test' width=3 nowrap>world"
    html += '</td></tr></tfoot>'
    @tfoot.content = 'hello', 'world'
    @tfoot.configure(0, 1) do |data|
      data.abbr   = 'test'
      data.width  = 3
      data.nowrap = true
    end
    expect(@tfoot.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end
end
