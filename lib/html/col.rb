# typed: strict
# The HTML module serves as a namespace only.
module HTML

  # This class represents an HTML ColGroup column (<col>).  Despite the
  # name, it is not a subclass of ColGroup or Table.
  #
  class Table::ColGroup::Col
    include HTML::Mixin::AttributeHandler
    include HTML::Mixin::HtmlHandler
    # Sorbet type signatures can be added here

    undef_method :configure, :content
    @indent_level = 6

    # Creates and returns a new ColGroup object.  Optionally takes a block.
    # Note that it does not accept an argument - col tags do not have content.
    #
    def initialize(&block)
      @html_begin = '<col'
      @html_body  = ''
      @html_end   = ''
      instance_eval(&block) if block_given?
    end

    # Returns the indentation level for the tags of this class.  The
    # default is 6.
    #
    def self.indent_level
      @indent_level
    end

    # Sets the indentation level for the tags of this class.  The default
    # is 6.
    #
    def self.indent_level=(num)
      raise TypeError, 'indent_level must be an Integer' unless num.is_a?(Integer)
      raise ArgumentError, 'num must be >= 0' if num < 0
      @indent_level = num
    end

    alias to_s html
    alias to_str html
  end
end
