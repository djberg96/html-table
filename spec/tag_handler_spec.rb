############################################################################
# tag_handler_spec.rb
#
# Test suite for the TagHandler module. For these tests, we'll use an
# instance of the Table class where the module has been mixed in.
############################################################################
require 'rspec'
require 'html/table'

RSpec.describe HTML::Mixin::TagHandler do
  before(:all) do
    BlinkWarning.disable
  end

  before do
    @tcontent = HTML::Table::Content.new('test')
  end

  example 'bold' do
    expect(@tcontent).to respond_to(:bold)
    expect(@tcontent).to respond_to(:bold=)
    expect{ @tcontent.bold }.not_to raise_error
    expect{ @tcontent.bold = true }.not_to raise_error
  end

  example 'big' do
    expect(@tcontent).to respond_to(:big)
    expect(@tcontent).to respond_to(:big=)
    expect{ @tcontent.big }.not_to raise_error
    expect{ @tcontent.big = true }.not_to raise_error
  end

  example 'blink' do
    expect(@tcontent).to respond_to(:blink)
    expect(@tcontent).to respond_to(:blink=)
    expect{ @tcontent.blink }.not_to raise_error
    expect{ @tcontent.blink = true }.not_to raise_error
  end

  example 'italic' do
    expect(@tcontent).to respond_to(:italic)
    expect(@tcontent).to respond_to(:italic=)
    expect{ @tcontent.italic }.not_to raise_error
    expect{ @tcontent.italic = true }.not_to raise_error
  end

  example 'strike' do
    expect(@tcontent).to respond_to(:strike)
    expect(@tcontent).to respond_to(:strike=)
    expect{ @tcontent.strike }.not_to raise_error
    expect{ @tcontent.strike = true }.not_to raise_error
  end

  example 'sub' do
    expect(@tcontent).to respond_to(:sub)
    expect(@tcontent).to respond_to(:sub)
    expect{ @tcontent.sub }.not_to raise_error
    expect{ @tcontent.sub = true }.not_to raise_error
  end

  example 'sup' do
    expect(@tcontent).to respond_to(:sup)
    expect(@tcontent).to respond_to(:sup)
    expect{ @tcontent.sup }.not_to raise_error
    expect{ @tcontent.sup = true }.not_to raise_error
  end

  example 'tt' do
    expect(@tcontent).to respond_to(:tt)
    expect(@tcontent).to respond_to(:tt)
    expect{ @tcontent.tt }.not_to raise_error
    expect{ @tcontent.tt = true }.not_to raise_error
  end

  example 'underline' do
    expect(@tcontent).to respond_to(:underline)
    expect(@tcontent).to respond_to(:underline)
    expect{ @tcontent.underline }.not_to raise_error
    expect{ @tcontent.underline = true }.not_to raise_error
  end

  after(:all) do
    BlinkWarning.enable
  end
end
