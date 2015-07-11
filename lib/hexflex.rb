require "active_support"
require "active_support/core_ext"
require "yaml"

require "hexflex/hexaflexagon"

module Hexflex

  RADIUS = 1.0
  BASE = Math::sqrt(3)
  HEIGHT = 1.5
  HEIGHT_AFTER_RADIUS = HEIGHT - RADIUS
  HALF_BASE = BASE / 2

  class << self
    def make_template_image(opts = {})
      output_file_name = opts.delete(:output_file_name)
      template = Hexaflexagon.new().as_template
      template.save(output_file_name)
    end
  end
end
