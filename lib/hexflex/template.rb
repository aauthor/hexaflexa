require "hexflex/triangle_placer"

module Hexflex
  class Template
    attr_accessor :canvas

    def initialize
      self.canvas = Magick::RVG.new(3.in, 3.in).viewbox(0,0,15,4)
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
