require 'spec_helper'
require "hexflex/triangle_vector_assembler"
require "hexflex/triangle"

describe Hexflex::TriangleVectorAssembler do

  let(:triangle) { Hexflex::Triangle.new }
  subject { Hexflex::TriangleVectorAssembler.new(triangle) }

  describe ".new" do
    it "takes a triangle" do
      expect(subject.triangle).to eq (triangle)
    end
  end
  describe "#assemble!" do
    it "returns an rvg group use" do
      expect(subject.assemble!).to be_a Magick::RVG::Group
    end
    it "adds a triangle with the color to the group" do
      group = instance_double(Magick::RVG::Group)
      polygon = instance_double(Magick::RVG::Polygon)
      expect(Magick::RVG::Group).to receive(:new).and_return(group)
      expect(group).to receive(:polygon)
        .with( 0, 1,   Math::sqrt(3)/2, -1.0/2,   -Math::sqrt(3)/2,-1.0/2)
        .and_return(polygon)
      expect(polygon).to receive(:styles).with(fill: triangle.face)
      subject.assemble!
    end
  end

end
