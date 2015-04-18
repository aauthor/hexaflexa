require "hexflex/templater"

module Hexflex
  class Hexaflexagon

    attr_accessor :sides

    def initialize
      @sides = []
      @sides << Side.new(face: "cyan")
      @sides << Side.new(face: "yellow")
      @sides << Side.new(face: "magenta")
    end

    def as_template
      Templater.new(self).make_template
    end

    def triangles
      self.sides.map(&:triangles).flatten
    end

  end
end
