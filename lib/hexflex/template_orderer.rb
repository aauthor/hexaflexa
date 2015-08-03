module Hexflex
  class TemplateOrderer

    SIDE_PATTERN = [2,0,0,1,1,2]

    attr_reader :hexaflexagon

    def initialize(hexaflexagon)
      @hexaflexagon = hexaflexagon
    end

    def triangles
      # side_triangles = hexaflexagon.sides.map { |side| side.triangles.dup }
      # template_order = Array.new
      # SIDE_PATTERN.cycle(3) do |side_index|
      #   template_order << side_triangles[side_index].shift
      # end
      # template_order

      sides = hexaflexagon.sides
      [
        sides[0].triangles[0], sides[0].triangles[1],
        sides[2].triangles[2], sides[2].triangles[3],
        sides[1].triangles[2], sides[1].triangles[3],
        sides[0].triangles[4], sides[0].triangles[5],
        sides[2].triangles[0], sides[2].triangles[1],
        sides[1].triangles[0], sides[1].triangles[1],
        sides[0].triangles[2], sides[0].triangles[3],
        sides[2].triangles[4], sides[2].triangles[5],
        sides[1].triangles[4], sides[1].triangles[5],
      ]
    end

  end
end
