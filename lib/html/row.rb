# typed: strict
# The HTML module is a namespace only.
module HTML
  # The Table::Row class is a subclass of array that encapsulates an
  # html table row, i.e. <tr> element.
  class Table::Row < Array
    extend T::Sig
    include HTML::Mixin::AttributeHandler
    include HTML::Mixin::HtmlHandler
    @indent_level = T.let(3, Integer)
    @end_tags     = T.let(true, T::Boolean)

    # Gets and sets whether or not content is converted into a Row::Header
    # object or a Row::Data object.
    attr_accessor :header

    # Returns a new Table::Row object. Optionally takes a block. If +arg+
    # is provided it is treated as content. If +header+ is false, that
    # content is transformed into a Row::Data object. Otherwise, it is
    # converted into a Row::Header object.
    #
    # See the # Table::Row#content= method for more information.
    #--
    # Note that, despite the name, Row is a subclass of Array, not Table.
    #
    sig { params(arg: T.untyped, header: T.nilable(T::Boolean), block: T.untyped).void }
    def initialize(arg = nil, header = false, &block)
      @html_begin = T.let('<tr', String)
      @html_end   = T.let('</tr>', String)
      @header = T.let(header, T.nilable(T::Boolean))
      super()
      instance_eval(&block) if block_given?
      self.content = arg if arg
    end

    # Returns whether or not content is converted into a Row::Header object
    # (as opposed to a Row::Data object).
    #
    sig { returns(T.nilable(T::Boolean)) }
    def header?
      @header
    end

    # Adds content to the Row object.
    #
    # Because a Row object doesn't store any of its own content, the
    # arguments to this method must be a Row::Data object, a Row::Header
    # object, or a String (or an array of any of these).  In the latter case,
    # a single Row::Data object is created for each string.
    #
    # Examples (with whitespace and newlines removed):
    #
    # row = Table::Row.new
    #
    # # Same as Table::Row.new('foo')
    # row.content = 'foo'
    # row.html => <tr><td>foo</td></tr>
    #
    # row.content = [['foo','bar']]
    # row.html => <tr><td>foo</td><td>bar</td></tr>
    #
    # row.content = Table::Row::Data.new('foo')
    # row.html => <tr><td>foo</td></tr>
    #
    # row.content = Table::Row::Header.new('foo')
    # row.html => <tr><th>foo</th></tr>
    #
    sig { params(arg: T.untyped).returns(T::Array[T.untyped]) }
    def content=(arg)
      Array(arg).each do |e|
        push_content(e)
      end
    end

    # Returns the number of spaces that tags for this class are indented.
    # For the Row class, the indention level defaults to 3.
    #
    sig { returns(Integer) }
    def self.indent_level
      @indent_level = T.let(@indent_level, Integer)
      @indent_level
    end

    sig { params(num: Integer).void }
    def self.indent_level=(num)
      raise ArgumentError, "Indent level must be non-negative" if num < 0
      @indent_level = T.let(num, Integer)
    end

    # Returns true or false, depending on whether or not the end tags for
    # this class, </tr>, are included for each row or not. By default, this
    # is set to true.
    #
    sig { returns(T::Boolean) }
    def self.end_tags?
      @end_tags = T.let(@end_tags, T::Boolean)
      @end_tags
    end

    sig { params(bool: T::Boolean).void }
    def self.end_tags=(bool)
      unless [true, false].include?(bool)
        raise TypeError, 'Expected true or false'
      end
      @end_tags = T.let(bool, T::Boolean)
    end

    # This method has been redefined to only allow certain classes to be
    # accepted as arguments.  Specifically, they are Data and Header. An
    # Array is also valid, but only if it only includes Data or Header objects.
    #
    sig { params(index: Integer, obj: T.untyped).returns(T.untyped) }
    def []=(index, obj)
      objs = obj.is_a?(Array) ? obj : [obj]
      unless objs.all? { |o| o.is_a?(Table::Row::Data) || o.is_a?(Table::Row::Header) }
        raise TypeError, 'Only Data or Header objects allowed in Row assignment'
      end
      super(index, obj)
    end

    # This method has been redefined to only allow certain classes to be
    # accepted as arguments. Specifically, they are String, Integer, Data,
    # and Header.
    #
    # A plain string or number pushed onto a Row is automatically
    # converted to a Data object.
    #
    sig { params(args: T.untyped).returns(T::Array[T.untyped]) }
    def push(*args)
      args.each do |obj|
        converted = convert_content(obj)
        unless converted.is_a?(Table::Row::Data) || converted.is_a?(Table::Row::Header)
          raise TypeError, 'Only Data or Header or convertible types allowed in Row#push'
        end
        super(converted)
      end
    end

    # This method has been redefined to only allow certain classes to be
    # accepted as arguments. The rules are the same as they are for Row#push.
    #
    sig { params(obj: T.untyped).returns(T::Array[T.untyped]) }
    def <<(obj)
      converted = convert_content(obj)
      unless converted.is_a?(Table::Row::Data) || converted.is_a?(Table::Row::Header)
        raise TypeError, 'Only Data or Header or convertible types allowed in Row#<<'
      end
      super(converted)
    end

    # This method has been redefined to only allow certain classes to be
    # accepted as arguments. The rules are the same as they are for Row#push.
    #
    sig { params(obj: T.untyped).returns(T::Array[T.untyped]) }
    def unshift(obj)
      converted = convert_content(obj)
      unless converted.is_a?(Table::Row::Data) || converted.is_a?(Table::Row::Header)
        raise TypeError, 'Only Data or Header or convertible types allowed in Row#unshift'
      end
      super(converted)
    end

    alias to_s html
    alias to_str html

    private

    sig { params(e: T.untyped).void }
    def push_content(e)
      if e.is_a?(Table::Row::Data) || e.is_a?(Table::Row::Header)
        push(e)
      else
        push(@header ? Table::Row::Header.new(e) : Table::Row::Data.new(e))
      end
    end

    sig { params(obj: T.untyped).returns(T.untyped) }
    def convert_content(obj)
      if obj.is_a?(String) || obj.is_a?(Integer)
        Table::Row::Data.new(obj.to_s)
      else
        # Type check omitted for Sorbet strict compliance
        obj
      end
    end
  end
end
