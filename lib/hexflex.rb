require "active_support"
require "active_support/core_ext"
require "yaml"

require "hexflex/hexaflexagon"

module Hexflex

  class << self
    def make_template_vector(side_fills: [:cyan, :magenta, :yellow])
      template = Hexaflexagon.new(side_fills).as_template
      template.make_vector
    end

    def create_template_image!(output_file_name: 'out.png', side_fills: nil)
      template_opts = side_fills.present? ? {side_fills: side_fills} : {}
      vector = make_template_vector(template_opts)
      vector.draw.write(output_file_name)
    end

  end
end
