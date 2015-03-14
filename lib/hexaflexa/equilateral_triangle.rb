module Hexaflexa
  class EquilateralTriangle

    attr_accessor :side

    def height
      (side / 2.0) * 3.0**(1.0/2.0)
    end

  end
end
