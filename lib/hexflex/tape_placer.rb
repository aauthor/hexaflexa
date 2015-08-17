module Hexflex
  class TapePlacer
    attr_reader :canvas, :triangle_vector, :index

    def initialize(canvas, triangle_vector, index)
      @canvas = canvas
      @triangle_vector = triangle_vector
      @index = index.to_i

      @triangle_base = @canvas.width / 5.0
      @triangle_half_base = @triangle_base / 2.0
      @triangle_height = @canvas.height / 2.0
      @triangle_height_after_radius = @triangle_height / 3.0
    end

    def place!
      @canvas.use(triangle_vector)
        .translate(*lateral_placement)
        .translate(*vertical_placement)
        .rotate(*rotation)
        .scale(*normalize_triangle_scale)
    end

    private

    def lateral_placement
      if first_row?
        [@triangle_base * (index_on_row/2).floor, 0]
      else
        [(@triangle_base * ((index_on_row+1)/2).floor) - @triangle_base/2.0, 0]
      end
    end

    def vertical_placement
      [0, (@index/9) * @triangle_height]
    end

    def rotation
      if rotate?
        [60, @triangle_base, @triangle_height]
      else
        [0]
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
      index.odd?
    end

    def first_row?
      index < 9
    end

    def second_row?
      !second_row?
    end

    def index_on_row
      index % 9
    end

  end
end
