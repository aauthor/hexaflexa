require "rvg/rvg"

module Hexflex
  class TriangleVectorAssembler

    attr_reader :triangle

    def initialize(triangle)
      @triangle = triangle
    end

    def assemble!
      Magick::RVG::Group.new.tap do |group|
        group.polygon(0, RADIUS, HALF_BASE, -HEIGHT_AFTER_RADIUS, -HALF_BASE, -HEIGHT_AFTER_RADIUS)
          .styles(fill: triangle.fill.to_s)
      end
    end

  end
end
