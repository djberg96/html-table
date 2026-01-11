# typed: strict
require_relative 'mixin/tag_handler'

# The HTML module is a namespace only.
module HTML
  # The Table::Content class handles content for Table::Row::Data,
  # Table::Row::Header, and Table::Row::Caption objects.
  class Table::Content < String
    include HTML::Mixin::TagHandler

    def initialize(string, &block)
      super(string)
      instance_eval(&block) if block_given?
    end
  end
end
