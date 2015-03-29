module Hexflex
  class Side
    attr_accessor :face, :triangles

    # make a new side of a hexaflexagon 
    # @param [Hash] opts options hash with properties for new side
    # @option opts [Mixed] :face the fill of the triangle, can be a
    #   symbol, string, or hex number representing a color
    def initialize(opts = {})
      self.face = opts[:face]
      self.triangles = Array.new(6, Triangle.new(face: self.face))
    end

  end
end
