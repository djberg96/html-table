# typed: strict
# The HTML module serves as a namespace only.
module HTML
  # This class represents an HTML table body (<tbody>).  It is a
  # subclass of Table::TableSection.
  #
  class Table::Body < Table::TableSection
    extend T::Sig
    # Sorbet type signatures
    @indent_level = T.let(3, Integer)
    @end_tags     = T.let(true, T::Boolean)

    # Returns a new Table::Body object.  Optionally takes a block.  If
    # an argument is provided, it is treated as content.
    #
    sig { params(arg: T.untyped, block: T.untyped).void }
    def initialize(arg = nil, &block)
      @html_begin = T.let('<tbody', String)
      @html_end   = T.let('</tbody>', String)
      super(&block)
      self.content = arg if arg
    end

    # Returns a boolean indicating whether or not end tags, </tbody>, are
    # included for each Body object in the final HTML output.  The
    # default is true.
    #
    sig { returns(T::Boolean) }
    def self.end_tags?
      @end_tags = T.let(@end_tags, T::Boolean)
      @end_tags
    end

    # Sets whether or not end tags are included for each Body object in
    # the final HTML output.  The default is true.  Only true or false are
    # valid arguments.
    #
    sig { params(bool: T::Boolean).void }
    def self.end_tags=(bool)
      @end_tags = T.let(bool, T::Boolean)
    end
  end
end
