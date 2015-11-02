require 'forwardable'

module Hexflex
  class GridTriangle
    extend Forwardable

    attr_reader :triangle, :row, :position

    def_delegators :@triangle, :fill, :image_fill?, :color_fill?, :index

    def initialize(triangle:, row:, position:)
      @triangle = triangle
      @row = row
      @position = position
    end

    def first_row?
      row == 0
    end

    def second_row?
      row == 1
    end

  end
end
