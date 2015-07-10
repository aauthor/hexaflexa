require "hexflex/triangle_vector_assembler"

module Hexflex
  class Triangle

    attr_accessor :face

    # make a new triangle
    # @param [Hash] opts options hash with properties for new triangle
    # @option opts [Mixed] :face the fill of the triangle, can be a
    #   symbol, string, or hex number representing a color
    def initialize(opts = {})
      @face = opts[:face]
    end

    # turns the triangle into a group that can be used by RVG
    def vector
      TriangleVectorAssembler.new(self).assemble!
    end

    class << self
      def place_holder
        new(face: "grey")
      end
    end

  end
end
