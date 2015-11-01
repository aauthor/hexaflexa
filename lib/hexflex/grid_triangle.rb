module Hexflex
  class GridTriangle

    attr_reader :triangle, :row, :position

    def initialize(triangle:, row:, position:)
      @triangle = triangle
      @row = row
      @position = position
    end

    def vector
      triangle.vector
    end

    def first_row?
      row == 0
    end

    def second_row?
      row == 1
    end

  end
end
