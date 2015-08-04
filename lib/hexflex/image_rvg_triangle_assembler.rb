module Hexflex
  class ImageRvgTriangleAssembler

    def initialize(image_name, index)
      @image = Magick::Image.read(image_name).first
      @index = index
    end

    def assemble!
      Magick::RVG::Group.new.tap do |group|
        group.image(image)
          .rotate(-60 * index, base, height)
        group.styles(clip_path: clip_path)
      end
    end

    def triangle_base
      base
    end

    def triangle_height
      height
    end

    private

    attr_accessor :image, :index

    def height
      @height ||=
        if image_narrow?
          (base / 2.0) * Math.sqrt(3)
        else
          image.rows / 2.0
        end
    end

    def base
      @base ||=
        if image_wide?
          (height / Math.sqrt(3)) * 2.0
        else
          image.columns / 2.0
        end
    end

    private

    def clip_path
      Magick::RVG::ClipPath.new.tap do |path|
        path.polygon(
          0,      height,
          base,   height,
          base/2, 0
        )
      end
    end

    def image_wide?
      (image.columns / image.rows.to_f) > (2.0 / Math.sqrt(3))
    end

    def image_narrow?
      !image_wide?
    end
  end

end
