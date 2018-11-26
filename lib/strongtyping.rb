# A pure-ruby replacement for strongtyping gem

module StrongTyping
  class ArgumentTypeError < ArgumentError; end

  def expect(arg, allowed_types)
    return true if Array(allowed_types).any? do |klass|
      arg.kind_of?(klass)
    end

    raise ArgumentTypeError.new("#{arg} must be of type #{allowed_types}")
  end
end
