require 'rvg/rvg'
require 'hexflex/rvg_image_triangle_vectorizer'
require 'hexflex/rvg_color_triangle_vectorizer'

module Hexflex
  class RvgTemplateVectorizer

    Magick::RVG::dpi = 72
    attr_reader :triangle_grid

    def initialize(triangle_grid)
      @triangle_grid = triangle_grid
    end

    def vectorize
      @vector ||= make_vector
    end

    private

    def vector_width
      10.in
    end

    def vector_height
      vector_width * Math::sqrt(3) / triangle_base_lengths_per_row
    end

    def triangle_base
      @triangle_base ||=
        vector_width / triangle_base_lengths_per_row
    end

    def triangle_height
      @triangle_height ||=
        vector_height / 2.0
    end

    def triangle_base_lengths_per_row
      (triangle_grid.triangles_per_row + 1) / 2.0
    end

    def make_vector
      Magick::RVG.new(vector_width, vector_height).tap do |vector|
        vector.background_fill = "white"

        triangle_grid.grid_triangles.each do |triangle|
          triangle_vector = triangle_vector(triangle)
          vector.use(triangle_vector)
            .translate(lateral_placement(triangle), vertical_placement(triangle))
            .rotate(rotation(triangle), triangle_base, triangle_height)
            .scale(horizonal_normalization(triangle_vector), vertical_normalization(triangle_vector))
        end
      end
    end

    def triangle_vector(triangle)
      if triangle.image_fill?
        RvgImageTriangleVectorizer.new(triangle).vectorize
      else
        RvgColorTriangleVectorizer.new(triangle).vectorize
      end
    end

    def lateral_placement(triangle)
      if triangle.first_row?
        lateral_placement = triangle_base * (triangle.position/2).floor
      else
        lateral_placement = (triangle_base * ((triangle.position+1)/2).floor) - triangle_base/2.0
      end
    end

    def vertical_placement(triangle)
      triangle.first_row? ? 0 : triangle_height
    end

    def rotation(triangle)
      if triangle.first_row? && triangle.position.odd? || triangle.second_row? && triangle.position.even?
        rotation = 60
      else
        rotation = 0
      end
    end

    def horizonal_normalization(triangle_vector)
      triangle_base / triangle_vector.base
    end

    def vertical_normalization(triangle_vector)
      triangle_height / triangle_vector.height
    end

  end
end
