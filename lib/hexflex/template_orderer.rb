module Hexflex
  class TemplateOrderer

    SIDE_PATTERN = [2,0,0,1,1,2]

    attr_reader :hexaflexagon

    def initialize(hexaflexagon)
      @hexaflexagon = hexaflexagon
    end

    def triangles
      side_triangles = hexaflexagon.sides.map { |side| side.triangles.dup }
      Array.new.tap do |template_order|
        SIDE_PATTERN.cycle(3) do |side_index|
          template_order << side_triangles[side_index].shift
        end
      end
    end

  end
end
