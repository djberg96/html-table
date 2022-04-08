############################################################################
# attribute_handler_spec.rb
#
# Test suite for the AttributeHandler module. For these tests, we'll use an
# instance of the Table class where the module has been mixed in.
############################################################################
require 'rspec'
require 'html/table'

RSpec.describe HTML::Mixin::AttributeHandler do
  before(:all) do
    NonStandardExtensionWarning.disable
  end

  before do
    @table = HTML::Table.new(['foo', 1, 'bar'])
  end

  example 'abbr_basic' do
    expect(@table).to respond_to(:abbr)
    expect(@table).to respond_to(:abbr=)
  end

  example 'abbr' do
    expect{ @table.abbr }.not_to raise_error
    expect(@table.abbr).to be_nil
    expect{ @table.abbr = 'foo' }.not_to raise_error
    expect( @table.abbr).to eq('foo')
  end

  example 'align_basic' do
    expect(@table).to respond_to(:align)
    expect(@table).to respond_to(:align=)
  end

  example 'align' do
    expect{ @table.align }.not_to raise_error
    expect(@table.align).to be_nil
    expect{ @table.align = 'center' }.not_to raise_error
    expect( @table.align).to eq('center')
  end

  example 'align_expected_errors' do
    expect{ @table.align = 'foo' }.to raise_error(ArgumentError)
  end

  example 'axis' do
    expect(@table).to respond_to(:axis)
    expect(@table).to respond_to(:axis=)
    expect{ @table.axis }.not_to raise_error
    expect{ @table.axis = 'foo' }.not_to raise_error
  end

  example 'background_basic' do
    expect(@table).to respond_to(:background)
    expect(@table).to respond_to(:background=)
  end

  example 'background' do
    expect{ @table.background }.not_to raise_error
    expect(@table.background).to be_nil
    expect{ @table.background = 'foo' }.not_to raise_error
    expect( @table.background).to eq('foo')
  end

  example 'background_expected_errors' do
    expect{ @table.background = 1 }.to raise_error(TypeError)
  end

  example 'bgcolor_basic' do
    expect(@table).to respond_to(:bgcolor)
    expect(@table).to respond_to(:bgcolor=)
  end

  example 'bgcolor' do
    expect{ @table.bgcolor }.not_to raise_error
    expect(@table.bgcolor).to be_nil
    expect{ @table.bgcolor = 'foo' }.not_to raise_error
    expect( @table.bgcolor).to eq('foo')
  end

  example 'border_basic' do
    expect(@table).to respond_to(:border)
    expect(@table).to respond_to(:border=)
  end

  example 'border' do
    expect{ @table.border }.not_to raise_error
    expect{ @table.border = 2 }.not_to raise_error
    expect{ @table.border = true }.not_to raise_error
    expect{ @table.border = false }.not_to raise_error
  end

  example 'bordercolor_basic' do
    expect(@table).to respond_to(:bordercolor)
    expect(@table).to respond_to(:bordercolor=)
  end

  example 'bordercolor' do
    expect{ @table.bordercolor }.not_to raise_error
    expect(@table.bordercolor).to be_nil
    expect{ @table.bordercolor = 'foo' }.not_to raise_error
    expect( @table.bordercolor).to eq('foo')
  end

  example 'bordercolordark_basic' do
    expect(@table).to respond_to(:bordercolordark)
    expect(@table).to respond_to(:bordercolordark=)
  end

  example 'bordercolordark' do
    expect{ @table.bordercolordark }.not_to raise_error
    expect(@table.bordercolordark).to be_nil
    expect{ @table.bordercolordark = 'foo' }.not_to raise_error
    expect( @table.bordercolordark).to eq('foo')
  end

  example 'bordercolorlight' do
    expect(@table).to respond_to(:bordercolorlight)
    expect(@table).to respond_to(:bordercolorlight=)
    expect{ @table.bordercolorlight }.not_to raise_error
    expect{ @table.bordercolorlight = 'foo' }.not_to raise_error
  end

  example 'cellpadding' do
    expect(@table).to respond_to(:cellpadding)
    expect(@table).to respond_to(:cellpadding=)
    expect{ @table.cellpadding }.not_to raise_error
    expect{ @table.cellpadding = 1 }.not_to raise_error
  end

  example 'cellpadding_expected_errors' do
    expect{ @table.cellpadding = -1 }.to raise_error(ArgumentError)
  end

  example 'cellspacing' do
    expect(@table).to respond_to(:cellspacing)
    expect(@table).to respond_to(:cellspacing=)
    expect{ @table.cellspacing }.not_to raise_error
    expect{ @table.cellspacing = 1 }.not_to raise_error
  end

  example 'cellspacing_expected_errors' do
    expect{ @table.cellspacing = -1 }.to raise_error(ArgumentError)
  end

  example 'char' do
    expect(@table).to respond_to(:char)
    expect(@table).to respond_to(:char=)
    expect{ @table.char }.not_to raise_error
    expect{ @table.char = 'x' }.not_to raise_error
  end

  example 'char_expected_errors' do
    expect{ @table.char = 'xx' }.to raise_error(ArgumentError)
  end

  example 'charoff' do
    expect(@table).to respond_to(:charoff)
    expect(@table).to respond_to(:charoff=)
    expect{ @table.charoff }.not_to raise_error
    expect{ @table.charoff = 1 }.not_to raise_error
  end

  example 'charoff_expected_errors' do
    expect{ @table.charoff = -1 }.to raise_error(ArgumentError)
  end

  example 'class' do
    expect(@table).to respond_to(:class_)
    expect(@table).to respond_to(:class_=)
    expect{ @table.class_ }.not_to raise_error
    expect{ @table.class_ = 'myclass' }.not_to raise_error
  end

  example 'col' do
    expect(@table).to respond_to(:col)
    expect(@table).to respond_to(:col=)
    expect{ @table.col }.not_to raise_error
    expect{ @table.col = 1 }.not_to raise_error
  end

  example 'col_expected_errors' do
    expect{ @table.col = -1 }.to raise_error(ArgumentError)
  end

  example 'colspan' do
    expect(@table).to respond_to(:colspan)
    expect(@table).to respond_to(:colspan=)
    expect{ @table.colspan }.not_to raise_error
    expect{ @table.colspan = 1 }.not_to raise_error
  end

  example 'colspan_expected_errors' do
    expect{ @table.colspan = -1 }.to raise_error(ArgumentError)
  end

  example 'configure' do
    expect(@table).to respond_to(:configure)
    expect{ @table.configure(0){}.not_to raise_error }
    expect{ @table.configure(0, 0){}.not_to raise_error }
  end

  example 'configure_expected_errors' do
    expect{ @table.configure(0, 0, 0){}.to raise_error(ArgumentError) }
  end

  ########################################################################
  # This test could probably be broken out into separate tests for each
  # type that we want to add as content.
  ########################################################################
  example 'content' do
    expect(@table).to respond_to(:content)
    expect(@table).to respond_to(:content=)
    expect{ @table.content = 'foo' }.not_to raise_error
    expect{ @table.content = 123 }.not_to raise_error
    expect{ @table.content = ['one', 2, 'three'] }.not_to raise_error
    expect{ @table.content = [['foo', 'bar'], [1, 2, 3]] }.not_to raise_error
    expect{ @table.content = HTML::Table::Row.new }.not_to raise_error
    expect{ @table.content = HTML::Table::Row::Data.new }.not_to raise_error
    expect{ @table.content = HTML::Table::Row::Header.new }.not_to raise_error
    expect{ @table.content = HTML::Table::Head.create }.not_to raise_error
    expect{ @table.content = HTML::Table::Foot.create }.not_to raise_error
    expect{ @table.content = HTML::Table::Body.new }.not_to raise_error
  end

  example 'frame' do
    expect(@table).to respond_to(:frame)
    expect(@table).to respond_to(:frame=)
    expect{ @table.frame }.not_to raise_error
    expect{ @table.frame = 'below' }.not_to raise_error
  end

  example 'frame_expected_errors' do
    expect{ @table.frame = 'foo' }.to raise_error(ArgumentError)
  end

  example 'height' do
    expect(@table).to respond_to(:height)
    expect(@table).to respond_to(:height=)
    expect{ @table.height }.not_to raise_error
    expect{ @table.height = 1 }.not_to raise_error
  end

  example 'height_expected_errors' do
    expect{ @table.height = -1 }.to raise_error(ArgumentError)
  end

  example 'hspace' do
    expect(@table).to respond_to(:hspace)
    expect(@table).to respond_to(:hspace=)
    expect{ @table.hspace }.not_to raise_error
    expect{ @table.hspace = 1 }.not_to raise_error
  end

  example 'hspace_expected_errors' do
    expect{ @table.hspace = -1 }.to raise_error(ArgumentError)
  end

  example 'nowrap' do
    expect(@table).to respond_to(:nowrap)
    expect(@table).to respond_to(:nowrap=)
    expect{ @table.nowrap }.not_to raise_error
    expect{ @table.nowrap = false }.not_to raise_error
  end

  example 'nowrap_expected_errors' do
    expect{ @table.nowrap = 'foo' }.to raise_error(TypeError)
  end

  example 'rowspan' do
    expect(@table).to respond_to(:rowspan)
    expect(@table).to respond_to(:rowspan=)
    expect{ @table.rowspan }.not_to raise_error
    expect{ @table.rowspan = 1 }.not_to raise_error
  end

  example 'rowspan_expected_errors' do
    expect{ @table.rowspan = -1 }.to raise_error(ArgumentError)
  end

  example 'rules' do
    expect(@table).to respond_to(:rules)
    expect(@table).to respond_to(:rules=)
    expect{ @table.rules }.not_to raise_error
    expect{ @table.rules = 'all' }.not_to raise_error
  end

  example 'rules_expected_errors' do
    expect{ @table.rules = 'foo' }.to raise_error(ArgumentError)
  end

  example 'span' do
    expect(@table).to respond_to(:span)
    expect(@table).to respond_to(:span=)
    expect{ @table.span }.not_to raise_error
    expect{ @table.span = 1 }.not_to raise_error
  end

  example 'span_expected_errors' do
    expect{ @table.span = -1 }.to raise_error(ArgumentError)
  end

  example 'style' do
    expect(@table).to respond_to(:style)
    expect(@table).to respond_to(:style=)
    expect{ @table.style }.not_to raise_error
    expect{ @table.style = 'color: blue' }.not_to raise_error
  end

  example 'summary' do
    expect(@table).to respond_to(:summary)
    expect(@table).to respond_to(:summary=)
    expect{ @table.summary }.not_to raise_error
    expect{ @table.summary = 'foo' }.not_to raise_error
    expect{ @table.summary = 1 }.not_to raise_error
  end

  example 'valign' do
    expect(@table).to respond_to(:valign)
    expect(@table).to respond_to(:valign=)
    expect{ @table.valign }.not_to raise_error
    expect{ @table.valign = 'center' }.not_to raise_error
  end

  example 'valign_expected_errors' do
    expect{ @table.valign = 'foo' }.to raise_error(ArgumentError)
  end

  example 'vspace' do
    expect(@table).to respond_to(:vspace)
    expect(@table).to respond_to(:vspace=)
    expect{ @table.vspace }.not_to raise_error
    expect{ @table.vspace = 1 }.not_to raise_error
  end

  example 'vspace_expected_errors' do
    expect{ @table.vspace = -1 }.to raise_error(ArgumentError)
  end

  example 'width' do
    expect(@table).to respond_to(:width)
    expect(@table).to respond_to(:width=)
    expect{ @table.width}.not_to raise_error
    expect{ @table.width = 10 }.not_to raise_error
  end

  example 'width_with_percent' do
    expect{ @table.width = '5%' }.not_to raise_error
    expect( @table.width).to eq('5%')
  end

  example 'width_expected_errors' do
    expect{ @table.width = -1 }.to raise_error(ArgumentError)
  end

  after(:all) do
    NonStandardExtensionWarning.enable
  end
end
