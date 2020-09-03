###############################################################################
# test_foot.rb
#
# Test suite for the Table::Foot class. The Table::Foot class is a singleton
# class, so we have to take extra measures to ensure that a fresh instance
# is created between tests.
###############################################################################
require 'rspec'
require 'html/table'

#####################################################################
# Ensure that a fresh instance of Table::Foot is used between tests
# by calling 'refresh' in the 'teardown' method.
#####################################################################
RSpec.describe HTML::Table::Foot do
  let(:foot) do
    Class.new(described_class) do
      def self.refresh
        @@foot = nil
      end
    end
  end

  before do
    @table = HTML::Table.new
    @tfoot = HTML::Table::Foot.create
    StructuredWarnings::BuiltInWarning.disable{ foot.refresh }
  end

  example "new_not_allowed" do
    expect{ HTML::Table::Foot.new }.to raise_error(NoMethodError)
  end

  example "constructor" do
    expect{ HTML::Table::Foot.create }.not_to raise_error
    expect{ HTML::Table::Foot.create("foo") }.not_to raise_error
    expect{ HTML::Table::Foot.create(1) }.not_to raise_error
    expect{ HTML::Table::Foot.create(%w/foo bar baz/) }.not_to raise_error
    expect{ HTML::Table::Foot.create([1,2,3]) }.not_to raise_error
    expect{ HTML::Table::Foot.create([[1,2,3], ["foo","bar"]]) }.not_to raise_error
  end

  example "basic" do
    html = "<tfoot></tfoot>"
    expect(@tfoot.html.gsub(/\s{2,}|\n/, '')).to eq(html)
  end

  example "end_tags" do
    expect(HTML::Table::Foot).to respond_to(:end_tags?)
    expect(HTML::Table::Foot).to respond_to(:end_tags=)
    expect{ HTML::Table::Foot.end_tags? }.not_to raise_error
    expect{ HTML::Table::Foot.end_tags = true }.not_to raise_error
  end

  example "end_tags_expected_errors" do
    expect{ HTML::Table::Foot.end_tags = "foo" }.to raise_error(HTML::Mixin::StrongTyping::ArgumentTypeError)
  end

  example "with_attributes" do
    html = "<tfoot align='left' char='x'></tfoot>"
    @tfoot.align = "left"
    @tfoot.char = 'x'
    expect(@tfoot.html.gsub(/\s{2,}|\n/, '')).to eq(html)
  end

  example "push_single_row" do
    html = "<tfoot><tr><td>test</td></tr></tfoot>"
    @tfoot.push HTML::Table::Row.new{ |r| r.content = "test" }
    expect(@tfoot.html.gsub(/\s{2,}|\n/, '')).to eq(html)
  end

  example "push_multiple_rows" do
    html = "<tfoot><tr><td>test</td></tr><tr><td>foo</td></tr></tfoot>"
    r1 = HTML::Table::Row.new{ |r| r.content = "test" }
    r2 = HTML::Table::Row.new{ |r| r.content = "foo" }
    @tfoot.push r1, r2
    expect(@tfoot.html.gsub(/\s{2,}|\n/, '')).to eq(html)
  end

  example "add_content_directly" do
    html = "<tfoot><tr><td>hello</td><td>world</td></tr></tfoot>"
    @tfoot.content = "hello","world"
    expect(@tfoot.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example "add_content_in_constructor" do
    html = "<tfoot><tr><td>hello</td><td>world</td></tr></tfoot>"
    @tfoot = HTML::Table::Foot.create(["hello","world"])
    expect(@tfoot.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example "configure_column" do
    html = "<tfoot><tr><td>hello</td><td abbr='test' width=3 nowrap>world"
    html += "</td></tr></tfoot>"
    @tfoot.content = "hello","world"
    @tfoot.configure(0,1){ |data|
      data.abbr   = 'test'
      data.width  = 3
      data.nowrap = true
    }
    expect(@tfoot.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end
end
