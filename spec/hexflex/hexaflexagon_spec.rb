require 'spec_helper'

describe Hexflex::Hexaflexagon do

  it "has three sides" do
    sided = Hexflex::Hexaflexagon.new
    expect(sided.sides.count).to eq 3
  end

end
