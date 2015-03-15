require 'rvg/rvg'
require "hexflex/triangle"

module Hexflex
  class Rhombus

    attr_accessor :text

    def initialize(opts)
      @text = opts[:text]
    end

    def triangles

      b = Hexflex::Triangle::BASE
      h = Hexflex::Triangle::HEIGHT

      t = Magick::RVG::Group.new do |grp|
        grp.polygon(0.5*b, 0, b, h, 0, h)
      end

      Array.new(2, t)

    end

  end
end
