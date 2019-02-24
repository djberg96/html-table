########################################################################
# content.rb
#
# This class handles content for Table::Row::Data, Table::Row::Header,
# and Table::Row::Caption objects.
########################################################################
require_relative 'mixin/tag_handler'

module HTML
  class Table::Content < String
    include HTML::Mixin::TagHandler

    def initialize(string, &block)
      super(string)
      instance_eval(&block) if block_given?
    end
  end
end
