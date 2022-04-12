# The HTML module serves as a namespace only.
module HTML
  # The Mixin module serves as a namespace only to prevent collisions.
  module Mixin
    # The StrongTyping module is a pure Ruby replacement for the strongtyping gem.
    module StrongTyping
      def expect(arg, allowed_types)
        return true if Array(allowed_types).any? do |klass|
          arg.is_a?(klass)
        end

        # Defined in table.rb
        raise ArgumentTypeError, "#{arg} must be of type #{allowed_types}"
      end
    end
  end
end
