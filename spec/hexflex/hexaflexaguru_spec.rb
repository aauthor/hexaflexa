require "spec_helper.rb"

describe Hexflex::Hexaflexaguru do

  it "takes a hexaflexagon" do
    hexaflexagon = Hexflex::Hexaflexagon.new
    guru = Hexflex::Hexaflexaguru.new(hexaflexagon)
    expect(guru.hexaflexagon).to eq hexaflexagon
  end

  describe "#unfolded_side" do
    it "places triangles from each side in the correct order" do


    end
  end

[1]
[2]
[7]
[8]
[13]
[14]


[3]
[4]
[9]
[10]
[15]
[16]


[0]
[5]
[6]
[11]
[12]
[17]

end
