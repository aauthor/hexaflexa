require "active_support"
require "active_support/core_ext"
require "yaml"

require "hexflex/hexaflexagon"

module Hexflex

  class << self

    DEFAULT_SIDE_FILLS = [:cyan, :magenta, :yellow]
    DEFAULT_TEMPLATE = :tape

    def make_template_vector(side_fills: DEFAULT_SIDE_FILLS, template: DEFAULT_TEMPLATE)
      template = Hexaflexagon.new(side_fills).as_template(template)
      template.make_vector
    end

    def create_template_image!(output_file_name: 'out.png', side_fills: DEFAULT_SIDE_FILLS, template: DEFAULT_TEMPLATE)
      vector = make_template_vector(side_fills: side_fills, template: template)
      vector.draw.write(output_file_name)
    end

  end
end
