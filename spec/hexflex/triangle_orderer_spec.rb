require "spec_helper"
require "hexflex/triangle_orderer"
describe Hexflex::TriangleOrderer do

  describe "#template_order" do
    it "returns an array of triangles in template order" do
      hexaflexagon = Hexflex::Hexaflexagon.new
      triangles = hexaflexagon.sides.map { |s| s.triangles.dup }
      ordered = Hexflex::TriangleOrderer.new(hexaflexagon).template_order
      expect(ordered).to eq [
        triangles[2].shift,
        triangles[0].shift, triangles[0].shift,
        triangles[1].shift, triangles[1].shift,
        triangles[2].shift, triangles[2].shift,
        triangles[0].shift, triangles[0].shift,
        triangles[1].shift, triangles[1].shift,
        triangles[2].shift, triangles[2].shift,
        triangles[0].shift, triangles[0].shift,
        triangles[1].shift, triangles[1].shift,
        triangles[2].shift
      ]
    end
  end

end

# Generalization?
#
# 3 + (i % 2) + 6 * floor(i/2)
#
# [3,4,9,10,15,16]
#
# 1 + (i % 2) + 6 * floor(i/2)
# 6 * floor( (i+2)/2 ) - (5 - ( i % 2 ))
# [1,2,7,8,13,14]
#
# 5 + (i % 2) + 6 * floor(i/2)
# 6 * floor( (i+1)/2 ) - (i % 2)
#
# [0,5,6,11,12,17]
