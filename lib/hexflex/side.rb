require "hexflex/rhombus"

module Hexflex
  class Side
    attr_accessor :background_color
    attr_accessor :text_color
    attr_accessor :rhombi

    def initialize(opts)
      @background_color = opts[:background_color]
      @text_color = opts[:text_color]
      @rhombi = []
      opts[:rhombi].each do |rhombus|
        @rhombi << Rhombus.new(rhombus)
      end
    end

    def triangles
      rhombi.map(&:triangles).flatten
    end

  end
end
