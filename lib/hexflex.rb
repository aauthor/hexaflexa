require "active_support"
require "active_support/core_ext"
require "yaml"
require "rvg/rvg"

require "hexflex/hexaflexagon"

module Hexflex

  R = 1.0
  X = Math::sqrt(3) / 2.0
  Y = 0.5

  Magick::RVG::dpi = 72

  class << self
    def make_template_image
      template = Hexaflexagon.new.as_template
      template.save
    end
  end
end
