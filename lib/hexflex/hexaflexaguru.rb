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

    # returns a map of indices where triangles of a side can be found on an
    # exploded hexaflexagon
    def self.exploded_side_map(side_number)
     EXPLODED_SIDES_MAP[side_number] 
    end

    # creates a new Hexaflexaguru
    def initialize(hexaflexagon)
      self.hexaflexagon = hexaflexagon
    end

  end
end
