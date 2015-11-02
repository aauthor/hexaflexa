require 'rvg/rvg'

module Hexflex
  class Triangle

    attr_accessor :fill, :index

    # make a new triangle
    # @param [Hash] opts options hash with properties for new triangle
    # @option opts [Mixed] :fill the fill of the triangle, can be a
    #   symbol, string, or hex number representing a color
    def initialize(opts = {})
      @fill = opts[:fill]
      @index = opts[:index]
    end

    def image_fill?
      @fill.is_a? Magick::Image
    end

    def color_fill?
      !image_fill?
    end

    class << self
      def place_holder
        new(fill: "grey")
      end
    end

  end
end
