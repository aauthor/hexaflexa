module Hexflex
  class ImageRvgTriangleAssembler

    def initialize(image, index)
      @image = image
      @index = index
    end

    def assemble!
      Magick::RVG::Group.new.tap do |group|
        group.use(centered_background)
          .rotate(-60 * index, base, height)
        group.styles(clip_path: clip_path)
      end
    end

    def centered_background
      Magick::RVG::Group.new.tap do |group|
        group.image(image).tap do |img|
          if image_tall?
            img.translate(0, (hexagon_height - image_height) / 2.0)
          else
            img.translate((hexagon_width - image_width) / 2.0, 0)
          end
        end
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
        if image_tall?
          (base / 2.0) * Math.sqrt(3)
        else
          image_height / 2.0
        end
    end

    def base
      @base ||=
        if image_wide?
          (height / Math.sqrt(3)) * 2.0
        else
          image_width / 2.0
        end
    end

    def image_height
      image.rows.to_f
    end

    def image_width
      image.columns.to_f
    end

    def hexagon_height
      triangle_height * 2
    end

    def hexagon_width
      triangle_base * 2
    end

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

    def image_tall?
      !image_wide?
    end
  end

end
