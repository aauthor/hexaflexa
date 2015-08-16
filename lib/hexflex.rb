require "active_support"
require "active_support/core_ext"
require "yaml"

require "hexflex/hexaflexagon"

module Hexflex

  class << self
    def make_template(side_fills: [:red, :red, :red])
      Hexaflexagon.new(side_fills).as_template
    end

    def make_template_image(opts = {})
      output_file_name = opts.delete(:output_file_name)
      template = make_template(opts)
      template.save(output_file_name)
    end

    private

    def defaults_template_options
      {
        side_fills: [:red, :red, :red]
      }
    end
  end
end
