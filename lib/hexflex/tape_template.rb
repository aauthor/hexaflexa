require "rvg/rvg"
require "hexflex/tape_placer"
require 'hexflex/base_template'


module Hexflex
  class TapeTemplate < BaseTemplate

    def width
      10.in
    end

    def height
      width * Math::sqrt(3)/5.0
    end

    def make_vector
      Magick::RVG.new(width, height).tap do |vector|
        vector.background_fill = "white"
        place_triangles(vector)
      end
    end

    private

    def place_triangles(vector)
      ordered_triangles.each_with_index do |triangle, index|
        placer.new(vector, triangle.vector, index).place!
      end
    end

    def ordered_triangles
      hexaflexagon.triangles_in_template_order
    end

    def placer
      TapePlacer
    end

  end
end
