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

    attr_reader :hexaflexagon, :sides

    def initialize(hexaflexagon)
      @hexaflexagon = hexaflexagon
      @sides = hexaflexagon.sides
    end

    def make_vector
      fail InterfaceViolation
    end

  end
end
