module Hexflex
  class TrianglePlacer
    attr_reader :triangle_use, :index
    def initialize(triangle_use, index)
      @triangle_use = triangle_use
      @index = index.to_i
    end

    def place!
      triangle_use.translate(*origin_shift)
      triangle_use.translate(*lateral_placement)
      triangle_use.translate(*vertical_placement)
      triangle_use.translate(*pre_rotation_vertical_adjustment)
      triangle_use.rotate(*rotation)
    end

    private

    def origin_shift
      [Hexflex::X, Hexflex::Y]
    end

    def lateral_placement
      [(Hexflex::R * index) % (Hexflex::R * 10) , 0]
    end

    def vertical_placement
      [0, (index/10) * (Hexflex::Y + Hexflex::R)]
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
        [0, Hexflex::Y]
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
