module Hexflex
  class Triangle
    BASE = 1.0
    HEIGHT = 0.5 * BASE * Math.sqrt(3.0)

    attr_accessor :face

    # make a new triangle
    # @param [Hash] opts options hash with properties for new triangle
    # @option opts [Mixed] :face the fill of the triangle, can be a
    #   symbol, string, or hex number representing a color
    def initialize(opts = {})
      @face = opts[:face]
    end
  end
end
