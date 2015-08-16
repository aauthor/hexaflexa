require "active_support"
require "active_support/core_ext"
require "yaml"

require "hexflex/hexaflexagon"

module Hexflex

  class << self
    def make_template(side_fills: [:red, :red, :red])
      Hexaflexagon.new(side_fills).as_template
    end

    def create_template_image!(output_file_name: 'out.png', side_fills: nil)
      template_opts = side_fills.present? ? {side_fills: side_fills} : {}
      template = make_template(template_opts)
      template.save(output_file_name)
    end

  end
end
