require "hexflex/side"

module Hexflex
  class Hexaflexagon

    attr_accessor :sides

    def initialize(side_fills)
      @raw_fills = side_fills
      @sides = Array.new(3) do |index|
        Side.new(fill: side_fills[index])
      end
    end

    def triangles
      self.sides.map(&:triangles).flatten
    end

  end
end
