module Hexflex
  class TrianglePlacer
    attr_reader :canvas, :triangle_vector, :index

    def initialize(canvas, triangle_vector, index)
      @canvas = canvas.viewbox(0, 0, 5.5*BASE, 2*HEIGHT)
      @triangle_vector = canvas.use(triangle_vector)
      @index = index.to_i
    end

    def place!
      triangle_vector.translate(*origin_shift)
      triangle_vector.translate(*lateral_placement)
      triangle_vector.translate(*vertical_placement)
      triangle_vector.translate(*pre_rotation_vertical_adjustment)
      triangle_vector.rotate(*rotation)
    end

    private

    def origin_shift
      [HALF_BASE, HEIGHT_AFTER_RADIUS]
    end

    def lateral_placement
      [(HALF_BASE * index) % (HALF_BASE * 10) , 0]
    end

    def vertical_placement
      [0, (index/10) * (HEIGHT)]
    end

    def rotation
      if rotate?
        60
      else
        0
      end
    end

    def pre_rotation_vertical_adjustment
      if rotate?
        [0, HEIGHT_AFTER_RADIUS]
      else
        [0, 0]
      end
    end

    def rotate?
      if index < 10
        index.odd?
      else
        index.even?
      end
    end

  end
end
