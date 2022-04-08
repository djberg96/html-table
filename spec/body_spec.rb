############################################
# body_spec.rb
#
# Test suite for the HTML::Table::Body class.
############################################
require 'rspec'
require 'html/table'

RSpec.describe HTML::Table::Body do
  before do
    @table = HTML::Table.new
    @tbody = HTML::Table::Body.new
  end

  example 'constructor' do
    expect{ HTML::Table::Body.new }.not_to raise_error
    expect{ HTML::Table::Body.new('foo') }.not_to raise_error
    expect{ HTML::Table::Body.new(1) }.not_to raise_error
    expect{ HTML::Table::Body.new(%w/foo bar baz/) }.not_to raise_error
    expect{ HTML::Table::Body.new([1,2,3]) }.not_to raise_error
    expect{ HTML::Table::Body.new([[1,2,3],['foo','bar']]) }.not_to raise_error
  end

  example 'basic' do
    html = '<tbody></tbody>'
    expect(@tbody.html.gsub(/\s{2,}|\n/, '')).to eq(html)
  end

  example 'with_attributes' do
    html = "<tbody align='left' char='x'></tbody>"
    @tbody.align = 'left'
    @tbody.char = 'x'
    expect(@tbody.html.gsub(/\s{2,}|\n/, '')).to eq(html)
  end

  example 'push_single_row' do
    html = '<tbody><tr><td>test</td></tr></tbody>'
    @tbody.push HTML::Table::Row.new{|r| r.content = 'test' }
    expect(@tbody.html.gsub(/\s{2,}|\n/, '')).to eq(html)
  end

  example 'push_multiple_rows' do
    html = '<tbody><tr><td>test</td></tr><tr><td>foo</td></tr></tbody>'
    r1 = HTML::Table::Row.new{|r| r.content = 'test' }
    r2 = HTML::Table::Row.new{|r| r.content = 'foo' }
    @tbody.push r1, r2
    expect(@tbody.html.gsub(/\s{2,}|\n/, '')).to eq(html)
  end

  example 'add_content_directly' do
    html = '<tbody><tr><td>hello</td><td>world</td></tr></tbody>'
    @tbody.content = 'hello','world'
    expect(@tbody.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'add_content_in_constructor' do
    html = '<tbody><tr><td>hello</td><td>world</td></tr></tbody>'
    tb = HTML::Table::Body.new(%w/hello world/)
    expect(tb.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'configure_column' do
    html = "<tbody><tr><td>hello</td><td abbr='test' width=3 nowrap>world"
    html += '</td></tr></tbody>'
    @tbody.content = 'hello','world'
    @tbody.configure(0,1){ |data|
      data.abbr   = 'test'
      data.width  = 3
      data.nowrap = true
    }
    expect(@tbody.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'end_tags' do
    expect(HTML::Table::Body).to respond_to(:end_tags?)
    expect(HTML::Table::Body).to respond_to(:end_tags=)
    expect{ HTML::Table::Body.end_tags = 'foo' }.to raise_error(ArgumentTypeError)
    expect{ HTML::Table::Body.end_tags = 1 }.to raise_error(ArgumentTypeError)
    expect{ HTML::Table::Body.end_tags = true }.not_to raise_error
  end
end
