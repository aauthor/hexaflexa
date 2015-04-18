require "rvg/rvg"

module Hexflex
  class TriangleVector

    attr_reader :triangle, :group
    def initialize(triangle, group = Magick::RVG::Group.new)
      @triangle = triangle
      @group = group
    end

    def fill_group
      @group.tap do |group|
        group.polygon(0,1, Math::sqrt(3)/2, -1.0/2, -Math::sqrt(3)/2, -1.0/2).
          styles(fill: triangle.face)
      end
    end

  end
end
