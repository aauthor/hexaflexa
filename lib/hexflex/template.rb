require "rvg/rvg"
require "hexflex/triangle_placer"

module Hexflex
  class Template

    ::Magick::RVG::dpi = 72

    attr_reader :vector

    def initialize(hexaflexagon)
      @hexaflexagon = hexaflexagon
    end

    def width
      10.in
    end

    def height
      width * Math::sqrt(3)/5.0
    end

    def vector
      @vector ||= make_graphic
    end

    def save(filename)
      vector.draw.write(filename)
    end

    private

    attr_reader :hexaflexagon

    def make_graphic
      Magick::RVG.new(width, height).tap do |graphic|
        @vector = graphic
        vector.background_fill = "white"
        place_triangles
      end
    end

    def place_triangles
      ordered_triangles.each_with_index do |triangle, index|
        TrianglePlacer.new(vector, triangle.vector, index).place!
      end
    end

    def ordered_triangles
      hexaflexagon.triangles_in_template_order
    end

  end
end
