require "rvg/rvg"
require 'hexflex/image_rvg_triangle_assembler'

module Hexflex
  class TriangleVector < SimpleDelegator


    attr_reader :triangle, :triangle_base, :triangle_height

    def initialize(triangle)
      @triangle = triangle
      @triangle_fill = @triangle.fill
      if image_fill?
        assembler = ImageRvgTriangleAssembler.new(@triangle_fill, @triangle.index)
        @rvg_vector = assembler.assemble!
        @triangle_base = assembler.triangle_base
        @triangle_height = assembler.triangle_height
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
      @triangle_base = BASE
      @triangle_height = HEIGHT
      Magick::RVG::Group.new.tap do |group|
        group.polygon(
          0,                 @triangle_height,
          @triangle_base,    @triangle_height,
          @triangle_base/2,  0
        )
          .styles(fill: @triangle_fill)
      end
    end

    private

  end
end
