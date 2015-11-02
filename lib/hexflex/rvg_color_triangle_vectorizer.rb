require 'hexflex/triangle_rvg_group'

module Hexflex
  class RvgColorTriangleVectorizer

    SIMPLE_TRIANGLE_BASE = Math::sqrt(3)
    SIMPLE_TRIANGLE_HEIGHT = 1.5

    def initialize(triangle)
      @triangle = triangle
    end

    def vectorize
      @vector ||= make_vector
    end

    private

    def make_vector
      TriangleRvgGroup.new(
        make_simple_triangle,
        base: SIMPLE_TRIANGLE_BASE,
        height: SIMPLE_TRIANGLE_HEIGHT
      )
    end

    def make_simple_triangle
      base = SIMPLE_TRIANGLE_BASE
      height = SIMPLE_TRIANGLE_HEIGHT
      Magick::RVG::Group.new.tap do |group|
        group.polygon(
          0, height,
          base, height,
          base/2, 0
        ).styles(fill: @triangle.fill.to_s)
      end
    end
  end
end
