require "hexflex/triangle_vector"

module Hexflex
  class Triangle

    attr_accessor :fill, :index

    # make a new triangle
    # @param [Hash] opts options hash with properties for new triangle
    # @option opts [Mixed] :fill the fill of the triangle, can be a
    #   symbol, string, or hex number representing a color
    def initialize(opts = {})
      @fill = opts[:fill]
      @index = opts[:index]
    end

    # turns the triangle into a group that can be used by RVG
    def vector
      TriangleVector.new(self)
    end

    class << self
      def place_holder
        new(fill: "grey")
      end
    end

  end
end
