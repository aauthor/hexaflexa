require 'spec_helper'

describe Hexflex::Hexaflexagon do

  it "has three sides" do
    sided = Hexflex::Hexaflexagon.new
    expect(sided.sides.count).to eq 3
  end

  context "created with no specified faces" do
    it "creates sides with magenta, cyan, and yellow" do
      hexaflexagon = Hexflex::Hexaflexagon.new
      expect(hexaflexagon.sides.select{ |s| s.face == :magenta}.count).to eq 1
      expect(hexaflexagon.sides.select{ |s| s.face == :cyan}.count).to eq 1
      expect(hexaflexagon.sides.select{ |s| s.face == :yellow}.count).to eq 1
    end
  end

end
