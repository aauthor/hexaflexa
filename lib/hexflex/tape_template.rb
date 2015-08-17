require "rvg/rvg"
require "hexflex/tape_placer"
require 'hexflex/base_template'


module Hexflex
  class TapeTemplate < BaseTemplate

    def width
      10.in
    end

    def height
      width * Math::sqrt(3)/5.0
    end

    private

    def placer
      TapePlacer
    end

  end
end
