require "hexflex/side"
require "hexflex/templater"

module Hexflex
  class Hexaflexagon

    attr_accessor :sides

    def initialize(opts)
      @raw_fills = opts.fetch(:side_fills)
      @sides = Array.new(3) do |index|
        Side.new(fill: fills[index])
      end
    end

    def as_template
      Templater.new(self).make_template
    end

    def triangles
      self.sides.map(&:triangles).flatten
    end

    private

    attr_reader :raw_fills

    def fills
      @fills ||=
        raw_fills.map(&:to_s).map do |raw_fill|
          if raw_fill.include? '.'
            Magick::Image.read(raw_fill).first
          else
            raw_fill
          end
        end
    end

  end
end
