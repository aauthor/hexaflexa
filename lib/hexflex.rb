require "active_support"
require "active_support/core_ext"
require "yaml"
require "rvg/rvg"

require "hexflex/hexaflexagon"

module Hexflex

  RADIUS = 1.0
  BASE = Math::sqrt(3)
  HEIGHT = 1.5
  HEIGHT_AFTER_RADIUS = HEIGHT - RADIUS
  HALF_BASE = BASE / 2

  Magick::RVG::dpi = 72

  class << self
    def make_template_image
      template = Hexaflexagon.new.as_template
      template.save
    end
  end
end
