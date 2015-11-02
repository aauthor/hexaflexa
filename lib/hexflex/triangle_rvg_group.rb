require "rvg/rvg"

module Hexflex
  class TriangleRvgGroup < SimpleDelegator

    SIMPLE_TRIANGLE_BASE = Math::sqrt(3)
    SIMPLE_TRIANGLE_HEIGHT = 1.5

    attr_reader :base, :height

    def initialize(rvg_group, base:, height:)
      @base = base
      @height = height
      super(rvg_group)
    end

  end
end
