############################################################################
# html_handler_spec.rb
#
# Test suite for the HtmlHandler module. For these tests, we'll use an
# instance of the Table class where the module has been mixed in.
############################################################################
require 'rspec'
require 'html/table'

RSpec.describe HTML::Mixin::HtmlHandler do
  before do
    @table = HTML::Table.new(['foo',1,'bar'])
  end

  example 'html' do
    expect(@table).to respond_to(:html)
    expect{ @table.html }.not_to raise_error
    expect{ @table.html = 'foo' }.to raise_error(NoMethodError)
    expect( @table.html).to be_kind_of(String)
    expect( @table.html.length > 0).to eq(true)
  end

  example 'modify_html' do
    expect{ @table.send(:modify_html) }.to raise_error(ArgumentError)
    expect{ @table.send(:modify_html,'nowrap') }.not_to raise_error
    expect{ @table.send(:modify_html,'align','top') }.not_to raise_error
    expect{
      @table.send(:modify_html,'align','top')
      @table.send(:modify_html,'align','top')
    }.not_to raise_error
  end
end
