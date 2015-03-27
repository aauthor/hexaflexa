module Hexflex
  class Triangle
    BASE = 1.0
    HEIGHT = 0.5 * BASE * Math.sqrt(3.0)

    attr_accessor :background

    # make a new triangle
    # @param [Hash] opts options hash with properties for new triangle
    # @option opts [Mixed] :background the background of the triangle, can be a
    #   symbol, string, or hex number
    def initialize(opts = {})
      @background = opts[:background]
    end
  end
end
