# typed: strict
# The HTML module serves as a namespace only.
module HTML

  # This class represents an HTML column group (<colgroup>).  It is a
  # subclass of Array.  The only elements it may contain are instances
  # of the ColGroup::Col class.
  #
  class Table::ColGroup < Array
    include HTML::Mixin::AttributeHandler
    include HTML::Mixin::HtmlHandler
    # Sorbet type signatures can be added here

    @indent_level = 3
    @end_tags     = true

    undef_method :content

    # Returns a new ColGroup object. Optionally takes a block. If an
    # argument is provided, it is treated as content.
    #
    def initialize(arg = nil, &block)
      @html_begin = '<colgroup'
      @html_body  = ''
      @html_end   = '</colgroup>'
      super(&block)
      push(arg) if arg
    end

    # Returns the indentation level for the tags of this class.  The
    # default is 3.
    #
    def self.indent_level
      @indent_level
    end

    # Sets the indentation level for the tags of this class.  The default
    # is 3.
    #
    def self.indent_level=(num)
      raise TypeError, 'indent_level must be an Integer' unless num.is_a?(Integer)
      raise ArgumentError, 'indent_level must be >= 0' if num < 0
      @indent_level = num
    end

    # This method has been redefined to only allow ColGroup::Col objects
    # to be assigned.
    #
    def []=(index, obj)
      if obj.nil?
        super
        return
      end
      if obj.is_a?(Array)
        raise TypeError, 'All elements must be Table::ColGroup::Col' unless obj.all? { |o| o.is_a?(Table::ColGroup::Col) }
      else
        raise TypeError, 'Object must be Table::ColGroup::Col' unless obj.is_a?(Table::ColGroup::Col)
      end
      # Ensure array is expanded if needed, then assign
      if index >= self.length
        (self.length..index-1).each { self << nil }
      end
      super
    end

    # This method has been redefined to only allow ColGroup::Col objects
    # to be pushed onto a ColGroup instance.
    #
    def push(*args)
      args.each do |obj|
        raise TypeError, 'Object must be Table::ColGroup::Col' unless obj.is_a?(Table::ColGroup::Col)
        super(obj)
      end
    end

    # This method has been redefined to only allow ColGroup::Col objects
    # to be pushed onto a ColGroup instance.
    #
    def <<(obj)
      raise TypeError, 'Object must be Table::ColGroup::Col' unless obj.is_a?(Table::ColGroup::Col)
      super
    end

    # This method has been redefined to only allow ColGroup::Col objects
    # to be unshifted onto a ColGroup instance.
    #
    def unshift(obj)
      raise TypeError, 'Object must be Table::ColGroup::Col' unless obj.is_a?(Table::ColGroup::Col)
      super
    end

    # Returns a boolean indicating whether or not end tags are included for
    # each ColGroup object in the final HTML output.  The default is true.
    #
    def self.end_tags?
      @end_tags
    end

    # Sets whether or not end tags are included for each ColGroup object in
    # the final HTML output.  The default is true.  Only true or false are
    # valid arguments.
    #
    def self.end_tags=(bool)
      unless [true, false].include?(bool)
        raise TypeError, 'Expected true or false'
      end
      @end_tags = bool
    end

    alias to_s html
    alias to_str html
  end
end
