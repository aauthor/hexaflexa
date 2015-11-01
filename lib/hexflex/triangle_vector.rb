require "rvg/rvg"
require 'hexflex/image_rvg_triangle_assembler'

module Hexflex
  class TriangleVector < SimpleDelegator

    SIMPLE_TRIANGLE_BASE = Math::sqrt(3)
    SIMPLE_TRIANGLE_HEIGHT = 1.5

    attr_reader :triangle, :base, :height

    def initialize(triangle)
      @triangle = triangle
      @triangle_fill = @triangle.fill
      if image_fill?
        assembler = ImageRvgTriangleAssembler.new(@triangle_fill, @triangle.index)
        @rvg_vector = assembler.assemble!
        @base = assembler.triangle_base
        @height = assembler.triangle_height
      else
        @rvg_vector = assemble_simple_triangle!
      end
      super(@rvg_vector)
    end

    private

    def image_fill?
      @triangle_fill.is_a? Magick::Image
    end

    def assemble_simple_triangle!
      @base = SIMPLE_TRIANGLE_BASE
      @height = SIMPLE_TRIANGLE_HEIGHT
      Magick::RVG::Group.new.tap do |group|
        group.polygon(
          0, @height,
          @base, @height,
          @base/2, 0
        )
          .styles(fill: @triangle_fill)
      end
    end

    private

  end
end
