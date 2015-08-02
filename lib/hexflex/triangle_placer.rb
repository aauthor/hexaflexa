module Hexflex
  class TrianglePlacer
    attr_reader :canvas, :triangle_vector, :index

    def initialize(canvas, triangle_vector, index)
      @canvas = canvas
      @triangle_vector = triangle_vector
      @index = index.to_i

      @triangle_base = @canvas.width / 5.5
      @triangle_half_base = @triangle_base / 2.0
      @triangle_height = @canvas.height / 2.0
      @triangle_height_after_radius = @triangle_height / 3.0
    end

    def place!
      @canvas.use(triangle_vector)
        .translate(*origin_shift)
        .translate(*lateral_placement)
        .translate(*vertical_placement)
        .translate(*pre_rotation_vertical_adjustment)
        .rotate(*rotation)
        .scale(*normalize_triangle_scale)
    end

    private

    def origin_shift
      [@triangle_half_base, @triangle_height_after_radius]
    end

    def lateral_placement
      [(@triangle_half_base * index) % (@triangle_half_base * 10), 0]
    end

    def vertical_placement
      [0, (@index/10) * @triangle_height]
    end

    def rotation
      if rotate?
        -60
      else
        0
      end
    end

    def pre_rotation_vertical_adjustment
      if rotate?
        [0, @triangle_height_after_radius]
      else
        [0, 0]
      end
    end

    def normalize_triangle_scale
      [
        @triangle_base / triangle_vector.triangle_base,
        @triangle_height / triangle_vector.triangle_height
      ]
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
