require "hexflex/side"

module Hexflex
  class Hexaflexagon

    attr_accessor :sides

    def initialize(opts)
      @sides = opts[:sides].map do |side|
        Side.new(side)
      end
    end

    def triangles
      @sides.map(&:triangles)
    end

  end
end
