##################################################
# colgroup_col_spec.rb
#
# Test suite for the Table::ColGroup::Col class
##################################################
require 'rspec'
require 'html/table'

RSpec.describe HTML::Table::ColGroup::Col do
  before do
    @col = described_class.new
  end

  example "basic" do
    html = "<col>"
    expect(@col.html.gsub(/\s{2,}|\n+/, '')).to eq(html)
  end

  example "no_configure" do
    expect{ @col.configure }.to raise_error(NoMethodError)
  end

  example "no_content_allowed" do
    expect{ @col.content }.to raise_error(NoMethodError)
    expect{ @col.content = "foo" }.to raise_error(NoMethodError)
  end

  example "indent_level" do
    expect(described_class).to respond_to(:indent_level)
    expect(described_class).to respond_to(:indent_level=)
    expect{ described_class.indent_level = "foo" }.to raise_error(ArgumentTypeError)
    expect{ described_class.indent_level = 6 }.not_to raise_error
  end
end
