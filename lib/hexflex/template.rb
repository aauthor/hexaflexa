require "hexflex/triangle_placer"

module Hexflex
  class Template
    attr_accessor :canvas

    def initialize
      viewbox_width = Hexflex::HALF_BASE * 11
      viewbox_height = Hexflex::HEIGHT * 2
      self.canvas = Magick::RVG.new(10.in, 4.in).
        viewbox(0, 0, viewbox_width, viewbox_height)
      self.canvas.background_fill = "white"
    end

    def place_triangle(triangle, index)
      triangle_use = canvas.use(triangle.to_vector_group)
      Hexflex::TrianglePlacer.new(triangle_use, index).place!
    end

    def save
      drawing = canvas.draw
      drawing.write("out.gif")
    end

  end
end
