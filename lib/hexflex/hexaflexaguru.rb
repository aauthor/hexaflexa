module Hexflex
  # takes a hexaflexagon and generates an order of triangles to be renders in an
  # unfolded hexaflexagon
  class Hexaflexaguru

    attr_accessor :hexaflexagon

    EXPLODED_SIDES_MAP = [
      [1,2,7,8,13,14],
      [3,4,9,10,15,16],
      [0,5,6,11,12,17]
    ]

    # returns an array of maps (per side) of indices where triangles of a side
    # can be found on an exploded hexaflexagon
    # @todo can this be generalized with a formula?
    def self.exploded_side_map
     EXPLODED_SIDES_MAP
    end

    # creates a new Hexaflexaguru
    def initialize(hexaflexagon)
      self.hexaflexagon = hexaflexagon
    end

    # returns an array of triangles in order to be drawn as an unfolded
    # hexaflexagon
    def explode
      side_order = hexaflexagon.sides.map(&:triangles).flatten
      flat_map = EXPLODED_SIDES_MAP.flatten
      side_order.each_with_index.inject([]) do |ordered, (triangle, index)|
        ordered[ flat_map[index] ] = triangle
        ordered
      end
    end

  end
end
