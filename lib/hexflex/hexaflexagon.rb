module Hexflex
  class Hexaflexagon

    attr_accessor :sides

    def initialize
      @sides = Array.new(3, Side.new)
    end


  end
end
