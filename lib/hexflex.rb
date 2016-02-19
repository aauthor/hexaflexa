require 'active_support'
require 'active_support/core_ext'
require 'yaml'

require 'hexflex/hexaflexagon'
require 'hexflex/tape_template'
require 'hexflex/glue_template'

module Hexflex

  class << self

    DEFAULT_SIDE_FILLS = [:cyan, :magenta, :yellow]
    DEFAULT_TEMPLATE_STYLE = :tape

    def make_template_vector(side_fills: DEFAULT_SIDE_FILLS, template_style: DEFAULT_TEMPLATE_STYLE)
      hexaflexagon = Hexaflexagon.new(side_fills)
      make_template(hexaflexagon, template_style).make_vector
    end

    def create_template_image!(output_file_name: 'out.png', **options)
      vector = make_template_vector(options)
      vector.draw.write(output_file_name)
    end

    def make_template(hexaflexagon, template_style)
      case template_style.to_sym
      when :glue
        GlueTemplate.new(hexaflexagon)
      when :tape
        TapeTemplate.new(hexaflexagon)
      end
    end

  end
end
