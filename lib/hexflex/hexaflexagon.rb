require "hexflex/side"
require "hexflex/tape_template"
require "hexflex/glue_template"
require "hexflex/template_orderer"

module Hexflex
  class Hexaflexagon

    attr_accessor :sides

    def initialize(side_fills)
      @raw_fills = side_fills
      @sides = Array.new(3) do |index|
        Side.new(fill: side_fills[index])
      end
    end

    def as_template(template)
      case template
      when :glue
        GlueTemplate.new(self)
      when :tape
        TapeTemplate.new(sides)
      end
    end

    def triangles
      self.sides.map(&:triangles).flatten
    end

  end
end
