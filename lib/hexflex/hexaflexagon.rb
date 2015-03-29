module Hexflex
  class Hexaflexagon

    attr_accessor :sides

    def initialize
      @sides = []
      @sides << Side.new(face: :cyan)
      @sides << Side.new(face: :yellow)
      @sides << Side.new(face: :magenta)
    end


  end
end
