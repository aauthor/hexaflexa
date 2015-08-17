require "rvg/rvg"

module Hexflex
  class BaseTemplate

    ::Magick::RVG::dpi = 72

    def initialize(hexaflexagon)
      @hexaflexagon = hexaflexagon
    end

    def width
      raise '#width must be implemented by the child class.'
    end

    def height
      raise '#height must be implemented by the child class.'
    end

    def make_vector
      make_graphic
    end

    private

    attr_reader :hexaflexagon

    def make_graphic
      Magick::RVG.new(width, height).tap do |vector|
        vector.background_fill = "white"
        place_triangles(vector)
      end
    end

    def place_triangles(vector)
      ordered_triangles.each_with_index do |triangle, index|
        placer.new(vector, triangle.vector, index).place!
      end
    end

    def ordered_triangles
      hexaflexagon.triangles_in_template_order
    end

    def placer
      raise '#placer must be implemented by the child class.'
    end

  end
end
