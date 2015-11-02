module Hexflex
  class Triangle

    attr_accessor :fill, :index

    def initialize(opts = {})
      @fill = opts[:fill]
      @index = opts[:index]
    end

    def image_fill?
      @fill.to_s.include? '.'
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
