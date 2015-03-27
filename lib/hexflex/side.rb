module Hexflex
  class Side
    attr_accessor :triangles

    def initialize
      @triangles = Array.new(6, Triangle.new)
    end

  end
end
