require "hexflex/template"

module Hexflex
  class Templater
    attr_accessor :hexaflexagon

    def initialize(hexaflexagon)
      self.hexaflexagon = hexaflexagon
    end

    def make_template
      template = Hexflex::Template.new
      triangle = hexaflexagon.triangles.first
      template.place_triangle(triangle, 0)
      template
    end
  end
end
