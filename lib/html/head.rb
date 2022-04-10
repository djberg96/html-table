require 'singleton'

# The HTML module serves only as a namespace.
module HTML

  # This class represents an HTML table head (<thead>).  It is a
  # subclass of Table::TableSection.  It is a singleton class.
  #
  class Table::Head < Table::TableSection
    include Singleton

    @indent_level = 3
    @end_tags     = true

    # This is our constructor for Head objects because it is a singleton
    # class.  Optionally, a block may be provided.  If an argument is
    # provided it is treated as content.
    #
    def self.create(arg = nil, &block)
      @head ||= new(arg, &block)
    end

    def self.instance(arg = nil, &block)
      @head ||= create(arg, &block)
    end

    # Called by create() instead of new().  This initializes the Head class.
    #
    def initialize(arg, &block)
      @html_begin = '<thead'
      @html_end   = '</thead>'
      super(&block)
      self.content = arg if arg
    end

    # Returns a boolean indicating whether or not end tags, </thead>, are
    # included for each Head object in the final HTML output.  The
    # default is true.
    #
    def self.end_tags?
      @end_tags
    end

    # Sets whether or not end tags are included for each Head object in
    # the final HTML output.  The default is true.  Only true or false are
    # valid arguments.
    #
    def self.end_tags=(bool)
      expect(bool, [TrueClass, FalseClass])
      @end_tags = bool
    end
  end
end
