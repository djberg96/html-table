require 'singleton'

# The HTML module serves as a namespace only.
module HTML

  # This class represents an HTML table foot (<tfoot>). It is a
  # subclass of Table::TableSection. It is a singleton class.
  #
  class Table::Foot < Table::TableSection
    include Singleton
    extend HTML::Mixin::StrongTyping

    @indent_level = 3
    @end_tags     = true

    # This is our constructor for Foot objects because it is a singleton
    # class. Optionally, a block may be provided. If an argument is
    # provided it is treated as content.
    #
    def self.create(arg = nil, &block)
      instance(arg, &block)
    end

    # Part of the singleton interface.
    #
    def self.instance(arg = nil, &block)
      @instance ||= new(arg, &block)
    end

    # Called by create() instead of new(). This initializes the Foot class.
    #
    def initialize(arg, &block)
      @html_begin = '<tfoot'
      @html_end   = '</tfoot>'
      super(&block)
      self.content = arg if arg
    end

    # Returns a boolean indicating whether or not end tags, </tfoot>, are
    # included for each Foot object in the final HTML output.  The
    # default is true.
    #
    def self.end_tags?
      @end_tags
    end

    # Sets whether or not end tags are included for each Foot object in
    # the final HTML output.  The default is true.  Only true or false are
    # valid arguments.
    #
    def self.end_tags=(bool)
      expect(bool, [TrueClass, FalseClass])
      @end_tags = bool
    end
  end

end
