require "rvg/rvg"

module Hexflex
  class BaseTemplate

    class InterfaceViolation < StandardError
      def message
        "##{method} must be defined by classes implementing BaseTemplate."
      end

      def method
        backtrace.first.split.last.delete("`'")
      end
    end

    ::Magick::RVG::dpi = 72

    attr_reader :hexaflexagon

    def initialize(hexaflexagon)
      @hexaflexagon = hexaflexagon
    end

    def width
      fail InterfaceViolation
    end

    def height
      fail InterfaceViolation
    end

    def make_vector
      fail InterfaceViolation
    end

  end
end
