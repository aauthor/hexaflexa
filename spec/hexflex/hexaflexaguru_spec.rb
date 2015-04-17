require "spec_helper.rb"

describe Hexflex::Hexaflexaguru do

  it "takes a hexaflexagon" do
    hexaflexagon = Hexflex::Hexaflexagon.new
    guru = Hexflex::Hexaflexaguru.new(hexaflexagon)
    expect(guru.hexaflexagon).to eq hexaflexagon
  end

  describe ".exploded_side_map" do
    it "returns the indices of the triangles of a side in an exploded hexaflexagon" do
      expect(Hexflex::Hexaflexaguru.exploded_side_map[0]).to eq [1,2,7,8,13,14]
      expect(Hexflex::Hexaflexaguru.exploded_side_map[1]).to eq [3,4,9,10,15,16]
      expect(Hexflex::Hexaflexaguru.exploded_side_map[2]).to eq [0,5,6,11,12,17]
    end
  end

  describe "#explode" do
    it "places triangles from each side in proper order" do
      hexaflexagon = Hexflex::Hexaflexagon.new
      triangles = hexaflexagon.sides.map { |s| s.triangles.dup }
      guru = Hexflex::Hexaflexaguru.new(hexaflexagon)
      exploded = guru.explode
      expect(exploded).to eq [
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
