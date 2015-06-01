module Hexflex
  class Template
    attr_accessor :canvas

    def initialize
      self.canvas = Magick::RVG.new(3.in, 3.in).viewbox(0,0,15,4)
      self.canvas.background_fill = "white"
    end

    def place_triangle(triangle, index)
      triangle_use = canvas.use(triangle.to_vector_group)
        .translate(Hexflex::X,Hexflex::Y)
      if(index > 0)
        triangle_use.translate(index * Hexflex::R, 0)
      end
      if(index.odd?)
        triangle_use.translate(0, Hexflex::Y)
        triangle_use.rotate(60)
      end
    end

    def save
      drawing = canvas.draw
      drawing.write("out.gif")
    end

  end
end
