require 'hexflex/grid_triangle'

module Hexflex
  class TriangleGrid

    attr_reader :grid_triangles

    def initialize
      @grid_triangles = []
    end

    def place(triangle, row, position)
      @grid_triangles << GridTriangle.new(
        triangle: triangle,
        row: row,
        position: position
      )
    end

    def triangles_per_row
      grid_triangles.group_by(&:row).values.map(&:count).max
    end

  end
end
