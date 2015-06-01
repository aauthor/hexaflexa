require "hexflex/template"

module Hexflex
  class Templater
    attr_accessor :hexaflexagon

    def initialize(hexaflexagon)
      self.hexaflexagon = hexaflexagon
    end

    def make_template
      Hexflex::Template.new.tap do |template|
        hexaflexagon.triangles.each_with_index do |triangle, index|
          template.place_triangle(triangle, index)
        end
      end
    end
  end
end
