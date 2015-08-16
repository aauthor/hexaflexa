require "active_support"
require "active_support/core_ext"
require "yaml"

require "hexflex/hexaflexagon"

module Hexflex

  class << self
    def make_template(opts = {})
      Hexaflexagon.new(opts).as_template
    end

    def make_template_image(opts = {})
      output_file_name = opts.delete(:output_file_name)
      template = make_template(opts)
      template.save(output_file_name)
    end
  end
end
