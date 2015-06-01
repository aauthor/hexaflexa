require "hexflex/template"
require "hexflex/triangle_orderer"

module Hexflex
  class Templater
    attr_accessor :hexaflexagon

    def initialize(hexaflexagon)
      self.hexaflexagon = hexaflexagon
    end

    def make_template
      Hexflex::Template.new.tap do |template|
        triangles = Hexflex::TriangleOrderer.new(hexaflexagon).template_order
        triangles.each_with_index do |triangle, index|
          template.place_triangle(triangle, index)
        end
      end
    end

  end
end
