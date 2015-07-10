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

  describe "#vector" do
    subject { described_class.new(face: :red) }
    it "returns an RVG group" do
      expect(subject.vector).to be_a Magick::RVG::Group
    end
  end

  describe "#vector" do
    let(:triangle) { Hexflex::Triangle.new }
    it "returns an rvg vector group" do
      expect(triangle.vector).to be_a Magick::RVG::Group
    end

    it "uses TriangleVector to create group" do
      triangle_vector_assembler = instance_double(Hexflex::TriangleVectorAssembler)
      group = instance_double(Magick::RVG::Group)
      expect(Hexflex::TriangleVectorAssembler).to receive(:new)
        .with(triangle)
        .and_return(triangle_vector_assembler)
      expect(triangle_vector_assembler).to receive(:assemble!).and_return(group)
      expect(triangle.vector).to eq group
    end
  end

  describe ".place_holder" do
    it "returns a triangle with a grey background" do
      template = Hexflex::Triangle.place_holder
      expect(template.face).to eq "grey"
    end
  end

end
