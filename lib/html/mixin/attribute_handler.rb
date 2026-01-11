# typed: strict
require 'sorbet-runtime'
##########################################################################
# The seemingly redundant writer methods were left here for backwards
# compatibility and for those who may not prefer the DSL.
##########################################################################

# The HTML module serves as a namespace only.
module HTML
  # The Mixin module serves as a namespace to prevent collisions.
  module Mixin
    # The AttributeHandler module creates methods for each of the various attributes
    # associated with HTML tables. In some cases validation is done on the setters.
    module AttributeHandler
        extend T::Sig
        include Kernel
        # Sorbet: add stubs for missing methods to avoid errors
        sig { params(attr: String, value: T.untyped).void }
        def modify_html(attr, value); end
        # abbr
      sig { params(string: T.nilable(String)).returns(T.nilable(String)) }
      def abbr(string = nil)
        @abbr = T.let(@abbr, T.nilable(String))
        self.abbr = string if string
        @abbr
      end

      sig { params(string: T.nilable(String)).returns(T.nilable(String)) }
      def abbr=(string)
        @abbr = T.let(string, T.nilable(String))
        modify_html('abbr', string)
      end
      # align

      sig { params(position: T.nilable(String)).returns(T.nilable(String)) }
      def align(position = nil)
        @align = T.let(@align, T.nilable(String))
        self.align = position if position
        @align
      end

      sig { params(position: T.nilable(String)).returns(T.nilable(String)) }
      def align=(position)
        valid = %w[top bottom left center right]
        Kernel.raise ArgumentError unless position && valid.include?(position.downcase)
        @align = T.let(position, T.nilable(String))
        modify_html('align', position)
      end
      # axis

      sig { params(string: T.nilable(String)).returns(T.nilable(String)) }
      def axis(string = nil)
        @axis = T.let(@axis, T.nilable(String))
        self.axis = string if string
        @axis
      end

      sig { params(string: T.nilable(String)).returns(T.nilable(String)) }
      def axis=(string)
        @axis = T.let(string, T.nilable(String))
        modify_html('axis', string)
      end
      # background
      sig { params(url: T.nilable(String)).returns(T.nilable(String)) }
      def background(url = nil)
        @background = T.let(@background, T.nilable(String))
        self.background = url if url
        @background
      end

      sig { params(url: T.nilable(String)).returns(T.nilable(String)) }
      def background=(url)
        Kernel.raise TypeError unless url.is_a?(String)
        msg = "'background' is a non-standard extension"
        Kernel.warn msg
        @background = T.let(url, T.nilable(String))
        modify_html('background', url)
      end
      # bgcolor
      sig { params(color: T.nilable(String)).returns(T.nilable(String)) }
      def bgcolor(color = nil)
        @bgcolor = T.let(@bgcolor, T.nilable(String))
        self.bgcolor = color if color
        @bgcolor
      end

      sig { params(color: T.nilable(String)).returns(T.nilable(String)) }
      def bgcolor=(color)
        @bgcolor = T.let(color, T.nilable(String))
        modify_html('bgcolor', color)
      end
      # border
      sig { params(num: T.untyped).returns(T.nilable(Integer)) }
      def border(num = nil)
        @border = T.let(@border, T.nilable(Integer))
        self.border = num if num
        @border
      end

      sig { params(num: T.untyped).void }
      def border=(num)
        case num
        when TrueClass
          modify_html('border', true)
        when FalseClass
          # Do nothing
        else
          @border = T.let(num.to_i, T.nilable(Integer))
          modify_html('border', num.to_i)
        end
      end
      # bordercolor
      sig { params(color: T.nilable(String)).returns(T.nilable(String)) }
      def bordercolor(color = nil)
        @bordercolor = T.let(@bordercolor, T.nilable(String))
        self.bordercolor = color if color
        @bordercolor
      end

      sig { params(color: T.nilable(String)).void }
      def bordercolor=(color)
        @bordercolor = T.let(color, T.nilable(String))
        msg = "'bordercolor' is a non-standard extension"
        Kernel.warn msg
        modify_html('bordercolor', color)
      end
      # bordercolordark
      sig { params(color: T.nilable(String)).returns(T.nilable(String)) }
      def bordercolordark(color = nil)
        @bordercolordark = T.let(@bordercolordark, T.nilable(String))
        self.bordercolordark = color if color
        @bordercolordark
      end

      sig { params(color: T.nilable(String)).void }
      def bordercolordark=(color)
        @bordercolordark = T.let(color, T.nilable(String))
        msg = "'bordercolordark' is a non-standard extension"
        Kernel.warn msg
        modify_html('bordercolordark', color)
      end
      # bordercolorlight
      sig { params(color: T.nilable(String)).returns(T.nilable(String)) }
      def bordercolorlight(color = nil)
        @bordercolorlight = T.let(@bordercolorlight, T.nilable(String))
        self.bordercolorlight = color if color
        @bordercolorlight
      end

      sig { params(color: T.nilable(String)).void }
      def bordercolorlight=(color)
        @bordercolorlight = T.let(color, T.nilable(String))
        msg = "'bordercolorlight' is a non-standard extension"
        Kernel.warn msg
        modify_html('bordercolorlight', color)
      end
      # cellpadding
      sig { params(num: T.untyped).returns(T.nilable(Integer)) }
      def cellpadding(num = nil)
        @cellpadding = T.let(@cellpadding, T.nilable(Integer))
        self.cellpadding = num if num
        @cellpadding
      end

      sig { params(num: T.untyped).void }
      def cellpadding=(num)
        Kernel.raise ArgumentError if num.to_i < 0
        @cellpadding = T.let(num.to_i, T.nilable(Integer))
        modify_html('cellpadding', @cellpadding)
      end
      # cellspacing
      sig { params(num: T.untyped).returns(T.nilable(Integer)) }
      def cellspacing(num = nil)
        @cellspacing = T.let(@cellspacing, T.nilable(Integer))
        self.cellspacing = num if num
        @cellspacing
      end

      sig { params(num: T.untyped).void }
      def cellspacing=(num)
        Kernel.raise ArgumentError if num.to_i < 0
        @cellspacing = T.let(num.to_i, T.nilable(Integer))
        modify_html('cellspacing', @cellspacing)
      end
      # char
      sig { params(character: T.nilable(String)).returns(T.nilable(String)) }
      def char(character = nil)
        @char = T.let(@char, T.nilable(String))
        self.char = character if character
        @char
      end

      sig { params(character: T.nilable(String)).void }
      def char=(character)
        Kernel.raise ArgumentError if character.to_s.length > 1
        @char = T.let(character.to_s, T.nilable(String))
        modify_html('char', character.to_s)
      end
      # charoff
      sig { params(offset: T.untyped).returns(T.untyped) }
      def charoff(offset = nil)
        @charoff = T.let(@charoff, T.untyped)
        self.charoff = offset if offset
        @charoff
      end

      sig { params(offset: T.untyped).void }
      def charoff=(offset)
        Kernel.raise ArgumentError if offset.to_i < 0
        @charoff = T.let(offset, T.untyped)
        modify_html('charoff', offset)
      end
      # class_
      sig { params(klass: T.untyped).returns(T.untyped) }
      def class_(klass = nil)
        @class = T.let(@class, T.untyped)
        self.class_ = klass if klass
        @class
      end

      sig { params(klass: T.untyped).void }
      def class_=(klass)
        modify_html('class', klass)
        @class = T.let(klass, T.untyped)
      end
      # col
      sig { params(num: T.untyped).returns(T.untyped) }
      def col(num = nil)
        @col = T.let(@col, T.untyped)
        self.col = num if num
        @col
      end

      sig { params(num: T.untyped).void }
      def col=(num)
        Kernel.raise ArgumentError if num.to_i < 0
        @col = T.let(num.to_i, T.untyped)
        modify_html('col', @col)
      end
      # colspan
      sig { params(span: T.untyped).returns(T.untyped) }
      def colspan(span = nil)
        @colspan = T.let(@colspan, T.untyped)
        self.colspan = span if span
        @colspan
      end

      sig { params(span: T.untyped).void }
      def colspan=(span)
        Kernel.raise ArgumentError if span.to_i < 0
        @colspan = T.let(span.to_i, T.untyped)
        modify_html('colspan', @colspan)
      end
      # frame
      sig { params(type: T.untyped).returns(T.untyped) }
      def frame(type = nil)
        @frame = T.let(@frame, T.untyped)
        self.frame = type if type
        @frame
      end

      sig { params(type: T.untyped).void }
      def frame=(type)
        valid = %w[border void above below hsides lhs rhs vsides box]
        Kernel.raise ArgumentError unless valid.include?(type.downcase)
        @frame = T.let(type, T.untyped)
        modify_html('frame', @frame)
      end
      # height
      sig { params(num: T.untyped).returns(T.untyped) }
      def height(num = nil)
        @height = T.let(@height, T.untyped)
        self.height = num if num
        @height
      end

      sig { params(num: T.untyped).void }
      def height=(num)
        Kernel.raise ArgumentError if num.to_i < 0
        @height = T.let(num.to_i, T.untyped)
        modify_html('height', @height)
      end
      # hspace
      sig { params(num: T.untyped).returns(T.untyped) }
      def hspace(num = nil)
        @hspace = T.let(@hspace, T.untyped)
        self.hspace = num if num
        @hspace
      end

      sig { params(num: T.untyped).void }
      def hspace=(num)
        Kernel.raise ArgumentError if num.to_i < 0
        @hspace = T.let(num.to_i, T.untyped)
        modify_html('hspace', @hspace)
      end
      # nowrap
      sig { params(bool: T.untyped).returns(T.untyped) }
      def nowrap(bool = nil)
        @nowrap = T.let(@nowrap, T.untyped)
        self.nowrap = bool if bool
        @nowrap
      end

      sig { params(bool: T.untyped).void }
      def nowrap=(bool)
        Kernel.raise TypeError unless bool.is_a?(TrueClass) || bool.is_a?(FalseClass)
        @nowrap = T.let(bool, T.untyped)
        modify_html('nowrap', @nowrap)
      end
      # rowspan
      sig { params(num: T.untyped).returns(T.untyped) }
      def rowspan(num = nil)
        @rowspan = T.let(@rowspan, T.untyped)
        self.rowspan = num if num
        @rowspan
      end

      sig { params(num: T.untyped).void }
      def rowspan=(num)
        Kernel.raise ArgumentError if num.to_i < 0
        @rowspan = T.let(num.to_i, T.untyped)
        modify_html('rowspan', @rowspan)
      end
      # rules
      sig { params(edges: T.untyped).returns(T.untyped) }
      def rules(edges = nil)
        @rules = T.let(@rules, T.untyped)
        self.rules = edges if edges
        @rules
      end

      sig { params(edges: T.untyped).void }
      def rules=(edges)
        valid = %w[all groups rows cols none]
        Kernel.raise ArgumentError unless valid.include?(edges.to_s.downcase)
        @rules = T.let(edges, T.untyped)
        modify_html('rules', @rules)
      end
      # span
      sig { params(num: T.untyped).returns(T.untyped) }
      def span(num = nil)
        @span = T.let(@span, T.untyped)
        self.span = num if num
        @span
      end

      sig { params(num: T.untyped).void }
      def span=(num)
        Kernel.raise ArgumentError if num.to_i < 0
        @span = T.let(num.to_i, T.untyped)
        modify_html('span', @span)
      end
      # style
      sig { params(string: T.nilable(String)).returns(T.nilable(String)) }
      def style(string = nil)
        @style = T.let(@style, T.nilable(String))
        self.style = string if string
        @style
      end

      sig { params(string: T.nilable(String)).void }
      def style=(string)
        @style = T.let(string.to_s, T.nilable(String))
        modify_html('style', @style)
      end
      # summary
      sig { params(string: T.nilable(String)).returns(T.nilable(String)) }
      def summary(string = nil)
        @summary = T.let(@summary, T.nilable(String))
        self.summary = string if string
        @summary
      end

      sig { params(string: T.nilable(String)).void }
      def summary=(string)
        @summary = T.let(string.to_s, T.nilable(String))
        modify_html('summary', @summary)
      end
      # valign
      sig { params(position: T.untyped).returns(T.untyped) }
      def valign(position = nil)
        @valign = T.let(@valign, T.untyped)
        self.valign = position if position
        @valign
      end

      sig { params(position: T.untyped).void }
      def valign=(position)
        valid = %w[top center bottom baseline]
        Kernel.raise ArgumentError unless valid.include?(position.to_s.downcase)
        @valign = T.let(position, T.untyped)
        modify_html('valign', @valign)
      end
      # vspace
      sig { params(num: T.untyped).returns(T.untyped) }
      def vspace(num = nil)
        @vspace = T.let(@vspace, T.untyped)
        self.vspace = num if num
        @vspace
      end

      sig { params(num: T.untyped).void }
      def vspace=(num)
        Kernel.raise ArgumentError if num.to_i < 0
        @vspace = T.let(num.to_i, T.untyped)
        modify_html('vspace', @vspace)
      end
      # width
      sig { params(num: T.untyped).returns(T.untyped) }
      def width(num = nil)
        @width = T.let(@width, T.untyped)
        self.width = num if num
        @width
      end

      sig { params(num: T.untyped).void }
      def width=(num)
        if num.to_s =~ /%/
          @width = T.let(num, T.untyped)
        else
          Kernel.raise ArgumentError if num.to_i < 0
          @width = T.let(num.to_i, T.untyped)
        end
        modify_html('width', @width)
      end

      def background(url = nil)
        @background ||= nil
        self.background = url if url
        @background
      end

      def background=(url)
        raise TypeError unless url.is_a?(String)
        msg = "'background' is a non-standard extension"
        warn NonStandardExtensionWarning, msg
        @background = url
        modify_html('background', url)
      end

      def bgcolor(color = nil)
        @bgcolor ||= nil
        self.bgcolor = color if color
        @bgcolor
      end

      def bgcolor=(color)
        @bgcolor = color
        modify_html('bgcolor', color)
      end

      def border(num = nil)
        @border ||= nil
        self.border = num if num
        @border
      end

      # Allow either true/false or an integer
      def border=(num)
        case num
          when TrueClass
            modify_html('border', true)
          when FalseClass
            # Do nothing
          else
            @border = num.to_i
            modify_html('border', num.to_i)
        end
      end

      def bordercolor(color = nil)
        @bordercolor ||= nil
        self.bordercolor = color if color
        @bordercolor
      end

      def bordercolor=(color)
        @bordercolor = color
        msg = "'bordercolor' is a non-standard extension"
        warn NonStandardExtensionWarning, msg
        modify_html('bordercolor', color)
      end

      def bordercolordark(color = nil)
        @bordercolordark ||= nil
        self.bordercolordark = color if color
        @bordercolordark
      end

      def bordercolordark=(color)
        @bordercolordark = color
        msg = "'bordercolordark' is a non-standard extension"
        warn NonStandardExtensionWarning, msg
        modify_html('bordercolordark', color)
      end

      def bordercolorlight(color = nil)
        @bordercolorlight ||= nil
        self.bordercolorlight = color if color
        @bordercolorlight
      end

      def bordercolorlight=(color)
        @bordercolorlight = color
        msg = "'bordercolorlight' is a non-standard extension"
        warn NonStandardExtensionWarning, msg
        modify_html('bordercolorlight', @bordercolorlight)
      end

      def cellpadding(num = nil)
        @cellpadding ||= nil
        self.cellpadding = num if num
        @cellpadding
      end

      def cellpadding=(num)
        raise ArgumentError if num.to_i < 0
        @cellpadding = num.to_i
        modify_html('cellpadding', @cellpadding)
      end

      def cellspacing(num = nil)
        @cellspacing ||= nil
        self.cellspacing = num if num
        @cellspacing
      end

      def cellspacing=(num)
        raise ArgumentError if num.to_i < 0
        @cellspacing = num.to_i
        modify_html('cellspacing', @cellspacing)
      end

      def char(character = nil)
        @char ||= nil
        self.char = character if character
        @char
      end

      def char=(character)
        raise ArgumentError if character.to_s.length > 1
        @char = character.to_s
        modify_html('char', character.to_s)
      end

      def charoff(offset = nil)
        @charoff ||= nil
        self.charoff = offset if offset
        @charoff
      end

      def charoff=(offset)
        raise ArgumentError if offset.to_i < 0
        @charoff = offset
        modify_html('charoff', offset)
      end

      # Returns the CSS class. The trailing underscore is necessary in order
      # to avoid conflict with the 'class' keyword.
      #
      def class_(klass = nil)
        @class ||= nil
        self.class_ = klass if klass
        @class
      end

      # Returns the CSS class.  The trailing underscore is necessary in order
      # to avoid conflict with the 'class' keyword.
      #
      def class_=(klass)
        modify_html('class', klass)
        @class = klass
      end

      def col(num = nil)
        @col ||= nil
        self.col = num if num
        @col
      end

      def col=(num)
        raise ArgumentError if num.to_i < 0
        @col = num.to_i
        modify_html('col', @col)
      end

      def colspan(span = nil)
        @colspan ||= nil
        self.colspan = span if span
        @colspan
      end

      def colspan=(span)
        raise ArgumentError if span.to_i < 0
        @colspan = span.to_i
        modify_html('colspan', @colspan)
      end

      # Allows you to configure various attributes by row or row + column.
      #
      def configure(row, col = nil)
        if col
          begin
            yield self[row][col]
          rescue NameError
            msg = "No column to configure in a #{self.class} class"
            raise ArgumentError, msg
          end
        else
          yield self[row]
        end
      end

      # Returns the HTML content (i.e. text).
      #
      def content(arg = nil, &block)
        case arg
          when String
            self.content = Table::Content.new(arg, &block)
          when Array
            arg.each do |e|
              if e.is_a?(Array)
                row = Table::Row.new
                e.each { |element| row.push(Table::Content.new(element, &block)) }
                push(row)
              else
                self.content = Table::Content.new(e, &block)
              end
            end
          else
            self.content = arg if arg
        end
        @html_body
      end

      alias data content

      def frame(type = nil)
        @frame ||= nil
        self.frame = type if type
        @frame
      end

      def frame=(type)
        valid = %w[border void above below hsides lhs rhs vsides box]
        raise ArgumentError unless valid.include?(type.downcase)
        @frame = type
        modify_html('frame', @frame)
      end

      def height(num = nil)
        @height ||= nil
        self.height = num if num
        @height
      end

      def height=(num)
        raise ArgumentError if num.to_i < 0
        @height = num.to_i
        modify_html('height', @height)
      end

      def hspace(num = nil)
        @hspace ||= nil
        self.hspace = num if num
        @hspace
      end

      def hspace=(num)
        raise ArgumentError if num.to_i < 0
        @hspace = num.to_i
        modify_html('hspace', @hspace)
      end

      def nowrap(bool = nil)
        @nowrap ||= nil
        self.nowrap = bool if bool
        @nowrap
      end

      def nowrap=(bool)
        unless bool.is_a?(TrueClass) || bool.is_a?(FalseClass)
          raise TypeError
        end
        @nowrap = bool
        modify_html('nowrap', @nowrap)
      end

      def rowspan(num = nil)
        @rowspan ||= nil
        self.rowspan = num if num
        @rowspan
      end

      def rowspan=(num)
        raise ArgumentError if num.to_i < 0
        @rowspan = num.to_i
        modify_html('rowspan', @rowspan)
      end

      def rules(edges = nil)
        @rules ||= nil
        self.rules = edges if edges
        @rules
      end

      def rules=(edges)
        valid = %w[all groups rows cols none]
        raise ArgumentError unless valid.include?(edges.to_s.downcase)
        @rules = edges
        modify_html('rules', @rules)
      end

      def span(num = nil)
        @span ||= nil
        self.span = num if num
        @span
      end

      def span=(num)
        raise ArgumentError if num.to_i < 0
        @span = num.to_i
        modify_html('span', @span)
      end

      def style(string = nil)
        @style ||= nil
        self.style = string if string
        @style
      end

      def style=(string)
        @style = string.to_s
        modify_html('style', @style)
      end

      def summary(string = nil)
        @summary ||= nil
        self.summary = string if string
        @summary
      end

      def summary=(string)
        @summary = string.to_s
        modify_html('summary', @summary)
      end

      def valign(position = nil)
        @valign ||= nil
        self.valign = position if position
        @valign
      end

      def valign=(position)
        valid = %w[top center bottom baseline]
        raise ArgumentError unless valid.include?(position.to_s.downcase)
        @valign = position
        modify_html('valign', @valign)
      end

      def vspace(num = nil)
        @vspace ||= nil
        self.vspace = num if num
        @vspace
      end

      def vspace=(num)
        raise ArgumentError if num.to_i < 0
        @vspace = num.to_i
        modify_html('vspace', @vspace)
      end

      def width(num = nil)
        @width ||= nil
        self.width = num if num
        @width
      end

      def width=(num)
        if num.to_s =~ /%/
          @width = num
        else
          raise ArgumentError if num.to_i < 0
          @width = num.to_i
        end
        modify_html('width', @width)
      end
    end
  end
end
