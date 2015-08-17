require "rvg/rvg"
require "hexflex/glue_placer"
require 'hexflex/base_template'


module Hexflex
  class GlueTemplate < BaseTemplate

    def width
      10.in
    end

    def height
      width * Math::sqrt(3)/5.5
    end

    private

    def placer
      GluePlacer
    end

  end
end
