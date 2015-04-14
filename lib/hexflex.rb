require "active_support"
require "active_support/core_ext"
require "yaml"

require "hexflex/builder"
require "hexflex/side"
require "hexflex/triangle"
require "hexflex/hexaflexagon"
require "hexflex/hexaflexaguru"

module Hexflex
  class << self
    def build(yaml_file)
      opts = YAML.load_file(yaml_file).deep_symbolize_keys
      builder = Builder.new(opts)
      require 'pp'; pp builder
      builder.build!
    end
  end
end
