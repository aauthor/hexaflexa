require "rvg/rvg"
require "hexflex/triangle_placer"


module Hexflex
  class Template

    ::Magick::RVG::dpi = 72

    attr_accessor :vector_graphic

    def initialize
      width = 10.in
      height = width * Math::sqrt(3)/5.5
      self.vector_graphic = Magick::RVG.new(width, height)
      self.vector_graphic.background_fill = "white"
    end

    def place_triangle(triangle, index)
      Hexflex::TrianglePlacer.new(self.vector_graphic, triangle.vector, index).place!
    end

    def save
      drawing = vector_graphic.draw
      drawing.write("out.gif")
    end

  end
end
