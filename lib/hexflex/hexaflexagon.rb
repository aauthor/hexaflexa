require "hexflex/side"
require "hexflex/templater"

module Hexflex
  class Hexaflexagon

    attr_accessor :sides

    def initialize(opts)
      fills = opts.fetch(:side_fills)
      @sides = Array.new(3) do |index|
        Side.new(fill: fills[index])
      end
    end

    def as_template
      Templater.new(self).make_template
    end

    def triangles
      self.sides.map(&:triangles).flatten
    end

  end
end
