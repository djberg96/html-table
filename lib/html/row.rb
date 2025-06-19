# The HTML module is a namespace only.
module HTML
  # The Table::Row class is a subclass of array that encapsulates an
  # html table row, i.e. <tr> element.
  class Table::Row < Array
    include HTML::Mixin::AttributeHandler
    include HTML::Mixin::HtmlHandler
    include HTML::Mixin::StrongTyping
    extend HTML::Mixin::StrongTyping

    @indent_level = 3
    @end_tags     = true

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
    def initialize(arg = nil, header = false, &block)
      @html_begin = '<tr'
      @html_end   = '</tr>'
      @header = header
      instance_eval(&block) if block_given?
      self.content = arg if arg
    end

    # Returns whether or not content is converted into a Row::Header object
    # (as opposed to a Row::Data object).
    #
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
    # row.content = [['foo,'bar']]
    # row.html => <tr><td>foo</td><td>bar</td></tr>
    #
    # row.content = Table::Row::Data.new('foo')
    # row.html => <tr><td>foo</td></tr>
    #
    # row.content = Table::Row::Header.new('foo')
    # row.html => <tr><th>foo</th></tr>
    #
    def content=(arg)
      Array(arg).each do |e|
        push_content(e)
      end
    end

    # Returns the number of spaces that tags for this class are indented.
    # For the Row class, the indention level defaults to 3.
    #
    def self.indent_level
      @indent_level
    end

    # Sets the number of spaces that tags for this class are indented.
    #
    def self.indent_level=(num)
      expect(num, Integer)
      raise ArgumentError, "Indent level must be non-negative" if num < 0
      @indent_level = num
    end

    # Returns true or false, depending on whether or not the end tags for
    # this class, </tr>, are included for each row or not. By default, this
    # is set to true.
    #
    def self.end_tags?
      @end_tags
    end

    # Sets the behavior for whether or not the end tags for this class,
    # </tr>, are included for each row or not. Only true and false are
    # valid arguments.
    #
    def self.end_tags=(bool)
      expect(bool, [TrueClass, FalseClass])
      @end_tags = bool
    end

    # This method has been redefined to only allow certain classes to be
    # accepted as arguments.  Specifically, they are Data and Header. An
    # Array is also valid, but only if it only includes Data or Header objects.
    #
    def []=(index, obj)
      objs = obj.is_a?(Array) ? obj : [obj]
      objs.each { |o| expect(o, [Data, Header]) }
      super
    end

    # This method has been redefined to only allow certain classes to be
    # accepted as arguments. Specifically, they are String, Integer, Data,
    # and Header.
    #
    # A plain string or number pushed onto a Row is automatically
    # converted to a Data object.
    #
    def push(*args)
      args.each { |obj| super(convert_content(obj)) }
    end

    # This method has been redefined to only allow certain classes to be
    # accepted as arguments. The rules are the same as they are for Row#push.
    #
    def <<(obj)
      super(convert_content(obj))
    end

    # This method has been redefined to only allow certain classes to be
    # accepted as arguments. The rules are the same as they are for Row#push.
    #
    def unshift(obj)
      super(convert_content(obj))
    end

    alias to_s html
    alias to_str html

    private

    def push_content(e)
      if e.is_a?(Table::Row::Data) || e.is_a?(Table::Row::Header)
        push(e)
      else
        push(@header ? Table::Row::Header.new(e) : Table::Row::Data.new(e))
      end
    end

    def convert_content(obj)
      if obj.is_a?(String) || obj.is_a?(Integer)
        Table::Row::Data.new(obj.to_s)
      else
        expect(obj, [Data, Header])
        obj
      end
    end
  end
end
