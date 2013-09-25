# encoding: utf-8

module Adamantium

  # Key type used for memoized methods
  #
  # @private
  #
  class SendKey

    # Initialize a key
    #
    # @return [undefined]
    #
    def initialize(method_name, args)
      @hash = method_name.hash ^ args.hash
      freeze
    end

    # @return [Fixnum]
    attr_reader :hash


    # Compare with another key
    #
    # @param [SendKey] other
    #
    # @return [Boolean]
    #
    def eql?(other)
      other.is_a?(self.class) && other.hash.eql?(hash)
    end
  end # SendKey

end # Adamantium