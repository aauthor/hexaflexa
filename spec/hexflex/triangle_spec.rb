require "spec_helper"
require "hexflex/triangle"

describe Hexflex::Triangle do

  it "can be initialized with a face" do
    triangle = Hexflex::Triangle.new(face: :red)
    expect(triangle.face).to eq :red
  end

  it "can have a face" do
    triangle = Hexflex::Triangle.new
    triangle.face = :red
    expect(triangle.face).to eq :red
  end

  describe "#to_vector_group" do
    let(:triangle) { Hexflex::Triangle.new }
    it "returns an rvg vector group" do
      expect(triangle.to_vector_group).to be_a Magick::RVG::Group
    end

    it "uses TriangleVector to create group" do
      triangle_vector = double("triangle_vector")
      group = double("group")
      expect(Hexflex::TriangleVector).to receive(:new)
        .with(triangle)
        .and_return(triangle_vector)
      expect(triangle_vector).to receive(:fill_group).and_return(group)
      expect(triangle.to_vector_group).to eq group
    end
  end

  describe ".place_holder" do
    it "returns a triangle with a grey background" do
      template = Hexflex::Triangle.place_holder
      expect(template.face).to eq :grey
    end
  end

end
