require 'hexflex/base_template'
require 'hexflex/triangle_grid'
require 'hexflex/rvg_template_vectorizer'
require 'hexflex/triangle'

module Hexflex
  class GlueTemplate < BaseTemplate

    def make_vector
      RvgTemplateVectorizer.new(triangle_grid).vectorize
    end

    private

    def triangle_grid
      TriangleGrid.new.tap do |grid|
        grid.place(blank_triangle, 0, 0)
        grid.place(blank_triangle, 0, 9)

        grid.place(sides[0].triangles[0], 0, 1)
        grid.place(sides[0].triangles[1], 1, 3)
        grid.place(sides[0].triangles[2], 1, 4)
        grid.place(sides[0].triangles[3], 0, 6)
        grid.place(sides[0].triangles[4], 0, 7)
        grid.place(sides[0].triangles[5], 1, 9)

        grid.place(sides[2].triangles[0], 0, 3)
        grid.place(sides[2].triangles[1], 1, 5)
        grid.place(sides[2].triangles[2], 1, 6)
        grid.place(sides[2].triangles[3], 0, 8)
        grid.place(sides[2].triangles[4], 1, 0)
        grid.place(sides[2].triangles[5], 0, 2)

        grid.place(sides[1].triangles[0], 0, 5)
        grid.place(sides[1].triangles[1], 1, 7)
        grid.place(sides[1].triangles[2], 1, 8)
        grid.place(sides[1].triangles[3], 1, 1)
        grid.place(sides[1].triangles[4], 1, 2)
        grid.place(sides[1].triangles[5], 0, 4)
      end
    end

    def blank_triangle
      Triangle.place_holder
    end

  end
end
