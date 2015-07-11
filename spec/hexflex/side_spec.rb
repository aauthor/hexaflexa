require 'spec_helper'
require 'hexflex/side'

describe Hexflex::Side do

  it "always has six triangles" do
    expect(subject.triangles.count).to eq 6
    expect(subject.triangles).to all(be_a(Hexflex::Triangle))
  end

  it "has a fill" do
    side = Hexflex::Side.new
    side.fill = :red
    expect(side.fill).to eq :red
  end

  it "can be initialized with a fill" do
    side = Hexflex::Side.new(fill: :red)
    expect(side.fill).to eq :red
  end

  it "passes on a simple color fill to its triangles" do
    side = Hexflex::Side.new(fill: :red)
    side.triangles.each do |triangle|
      expect(triangle.fill).to eq :red
    end
  end

end
