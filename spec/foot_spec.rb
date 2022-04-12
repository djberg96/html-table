###############################################################################
# foot_spec.rb
#
# Test suite for the HTML::Table::Foot class. The class is a singleton
# class, so we have to take extra measures to ensure that a fresh instance
# is created between tests.
###############################################################################
require 'rspec'
require 'html/table'

RSpec.describe HTML::Table::Foot do
  before do
    @tfoot = described_class.create
  end

  after do
    described_class.instance_variable_set(:@instance, nil)
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
    html = '<tfoot></tfoot>'
    expect(@tfoot.html.gsub(/\s{2,}|\n/, '')).to eq(html)
  end

  example 'end_tags? basic functionality' do
    expect(described_class).to respond_to(:end_tags?)
    expect(described_class.end_tags?).to be(true)
    expect{ described_class.end_tags? }.not_to raise_error
  end

  example 'end_tags= basic functionality' do
    expect(described_class).to respond_to(:end_tags=)
    expect{ described_class.end_tags = true }.not_to raise_error
  end

  example 'end_tags raises an error on an invalid type' do
    expect{ described_class.end_tags = 'foo' }.to raise_error(ArgumentTypeError)
  end

  example 'with attributes' do
    html = "<tfoot align='left' char='x'></tfoot>"
    @tfoot.align = 'left'
    @tfoot.char = 'x'
    expect(@tfoot.html.gsub(/\s{2,}|\n/, '')).to eq(html)
  end

  example 'push single row' do
    html = '<tfoot><tr><td>test</td></tr></tfoot>'
    @tfoot.push(HTML::Table::Row.new{ |r| r.content = 'test' })
    expect(@tfoot.html.gsub(/\s{2,}|\n/, '')).to eq(html)
  end

  example 'push multiple rows' do
    html = '<tfoot><tr><td>test</td></tr><tr><td>foo</td></tr></tfoot>'
    r1 = HTML::Table::Row.new{ |r| r.content = 'test' }
    r2 = HTML::Table::Row.new{ |r| r.content = 'foo' }
    @tfoot.push r1, r2
    expect(@tfoot.html.gsub(/\s{2,}|\n/, '')).to eq(html)
  end

  example 'add content directly' do
    html = '<tfoot><tr><td>hello</td><td>world</td></tr></tfoot>'
    @tfoot.content = 'hello', 'world'
    expect(@tfoot.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'add content in constructor' do
    html = '<tfoot><tr><td>hello</td><td>world</td></tr></tfoot>'
    described_class.instance_variable_set(:@instance, nil)
    @tfoot = described_class.create(%w[hello world])
    expect(@tfoot.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example 'configure column' do
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

  # rubocop:disable RSpec/IdenticalEqualityAssertion
  example 'new not allowed' do
    expect{ described_class.new }.to raise_error(NoMethodError)
  end

  example 'additional calls to constructor do nothing since class is a singleton' do
    expect(described_class.create).to eq(described_class.create)
    expect(described_class.instance).to eq(described_class.instance)
    expect(described_class.instance.object_id).to eq(described_class.instance.object_id)
    expect(described_class.create.object_id).to eq(described_class.create.object_id)
  end
  # rubocop:enable RSpec/IdenticalEqualityAssertion
end
