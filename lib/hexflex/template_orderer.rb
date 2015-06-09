module Hexflex
  class TemplateOrderer

    SIDE_PATTERN = [2,0,0,1,1,2]

    attr_reader :hexaflexagon

    def initialize(hexaflexagon)
      @hexaflexagon = hexaflexagon
    end

    def triangles
      side_triangles = hexaflexagon.sides.map { |side| side.triangles.dup }
      template_order = Array.new
      SIDE_PATTERN.cycle(3) do |side_index|
        template_order << side_triangles[side_index].shift
      end
      template_order.insert(10, Triangle.place_holder)
      template_order << Triangle.place_holder
    end

  end
end
