# A pure-ruby replacement for strongtyping gem

module HTML
  module Mixin
    module StrongTyping
      class ArgumentTypeError < ArgumentError; end

      def expect(arg, allowed_types)
        return true if Array(allowed_types).any? do |klass|
          arg.is_a?(klass)
        end

        raise ArgumentTypeError.new("#{arg} must be of type #{allowed_types}")
      end
    end
  end
end
