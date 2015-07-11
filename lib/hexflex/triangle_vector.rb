require "rvg/rvg"

module Hexflex
  class TriangleVector < SimpleDelegator

    attr_reader :triangle, :triangle_base, :triangle_height

    def initialize(triangle)
      @triangle = triangle
      @rvg_vector = assemble!
      super(@rvg_vector)
    end

    private

    def assemble!
      if @triangle.fill =~ /\.png$/i
        make_cut_image_triangle
      else
        make_simple_color_triangle
      end
    end

    def make_simple_color_triangle
      @triangle_base = BASE
      @triangle_height = HEIGHT
      Magick::RVG::Group.new.tap do |group|
        group.polygon(0, RADIUS, HALF_BASE, -HEIGHT_AFTER_RADIUS, -HALF_BASE, -HEIGHT_AFTER_RADIUS)
          .styles(fill: @triangle.fill.to_s)
      end
    end

    def make_cut_image_triangle
      image = Magick::Image.read(@triangle.fill).first

      image_width = image.columns
      image_height = image.rows
      @triangle_base = image_width / 2
      triangle_half_base = @triangle_base / 2
      @triangle_height = image_height / 2
      triangle_base_to_center = 1.0/3.0 * @triangle_height
      triangle_center_to_top = 2.0/3.0 * @triangle_height

      clip_path = Magick::RVG::ClipPath.new.tap do |path|
        path.polygon(
          0,                   triangle_center_to_top,
          triangle_half_base, -triangle_base_to_center,
          -triangle_half_base, -triangle_base_to_center
        )
      end
      Magick::RVG::Group.new.tap do |group|
        group.image(image).translate(-@triangle_base, -triangle_base_to_center)
        group.styles(clip_path: clip_path)
      end
    end

  end
end
