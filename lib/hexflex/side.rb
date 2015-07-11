require "hexflex/triangle"

module Hexflex
  class Side
    attr_accessor :fill, :triangles

    # make a new side of a hexaflexagon
    # @param [Hash] opts options hash with properties for new side
    # @option opts [Mixed] :face the fill of the triangle, can be a
    #   symbol, string, or hex number representing a color
    def initialize(opts = {})
      self.fill = opts[:fill]
      self.triangles = Array.new(6) do |index|
        Triangle.new(fill: fill, index: index)
      end
    end

  end
end
