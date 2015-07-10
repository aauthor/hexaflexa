require 'spec_helper'
require 'hexflex/side'

describe Hexflex::Side do

  it "always has six triangles" do
    expect(subject.triangles.count).to eq 6
    expect(subject.triangles).to all(be_a(Hexflex::Triangle))
  end

  it "has a face" do
    side = Hexflex::Side.new
    side.face = :red
    expect(side.face).to eq :red
  end

  it "can be initialized with a face" do
    side = Hexflex::Side.new(face: :red)
    expect(side.face).to eq :red
  end

  it "passes on a simple color face to its triangles" do
    side = Hexflex::Side.new(face: :red)
    side.triangles.each do |triangle|
      expect(triangle.face).to eq :red
    end
  end

end
