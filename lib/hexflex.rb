require "active_support"
require "active_support/core_ext"
require "yaml"

require "hexflex/hexaflexagon"

module Hexflex

  class << self
    def make_template_vector(side_fills: [:cyan, :magenta, :yellow], template: :tape)
      template = Hexaflexagon.new(side_fills).as_template(template)
      template.make_vector
    end

    def create_template_image!(output_file_name: 'out.png', side_fills: nil, template: nil)
      hexflex_opts = {}
      hexflex_opts[:side_fills] = side_fills unless side_fills.nil?
      hexflex_opts[:template] = template unless template.nil?
      vector = make_template_vector(hexflex_opts)
      vector.draw.write(output_file_name)
    end

  end
end
