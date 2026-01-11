# typed: strict
# The HTML module serves as a namespace only.
module HTML

  # Superclass for THEAD, TBODY, TFOOT
  #
  class Table::TableSection < Array
    include HTML::Mixin::AttributeHandler
    include HTML::Mixin::HtmlHandler
    # Sorbet type signatures can be added here

    def initialize(&block)
      super
      instance_eval(&block) if block_given?
    end

    # Adds a Table::Row object as content. The +arg+ is passed as the value
    # to the Table::Row constructor.
    #
    def content=(arg)
      tr = Table::Row.new(arg)
      push(tr)
    end

    def self.indent_level
      @indent_level
    end

    def self.indent_level=(num)
      raise TypeError, 'Expected Integer' unless num.is_a?(Integer)
      raise ArgumentError, 'indent_level must be >= 0' if num < 0
      @indent_level = num
    end

    def []=(index, obj)
      raise TypeError, 'Expected Table::Row' unless obj.is_a?(Table::Row)
      super
    end

    def push(*args)
      args.each { |obj| raise TypeError, 'Expected Table::Row' unless obj.is_a?(Table::Row) }
      super
    end

    def unshift(obj)
      raise TypeError, 'Expected Table::Row' unless obj.is_a?(Table::Row)
      super
    end

    alias to_s html
    alias to_str html
  end
end
