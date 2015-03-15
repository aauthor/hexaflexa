require "rvg/rvg"
require "hexflex/hexaflexagon"

module Hexflex
  class Builder

    attr_accessor :hexaflexagon
    def initialize(opts)
      @hexaflexagon = Hexaflexagon.new(opts)
    end

    def build!
      Magick::RVG.dpi = 90

      triangles = @hexaflexagon.triangles

      height = Hexflex::Triangle::HEIGHT
      base = Hexflex::Triangle::BASE
      width = base * 5.5

      out = Magick::RVG.new(1.in, 1.in).viewbox(0,0,width, height) do |canvas|
        canvas.background_fill = 'white'

        canvas.use(triangles[0][0], 0, 0, base, height)
        canvas.use(triangles[0][0], base, 0, base, height)

      end
      out.draw.write('out.gif')
    end

  end
end
