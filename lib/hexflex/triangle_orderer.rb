module Hexflex
  class TriangleOrderer

    attr_accessor :hexaflexagon

    # MAP = [
    #   [1,2,7,8,13,14],
    #   [3,4,9,10,15,16],
    #   [0,5,6,11,12,17]
    # ]

    SIDE_PATTERN = [2,0,0,1,1,2]

    def initialize(hexaflexagon)
      self.hexaflexagon = hexaflexagon
    end

    def template_order
      side_triangles = hexaflexagon.sides.map { |side| side.triangles.dup }
      Array.new.tap do |template_order|
        SIDE_PATTERN.cycle(3) do |side_index|
          template_order << side_triangles[side_index].shift
        end
      end
    end

  end
end
