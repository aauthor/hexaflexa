require 'spec_helper'
require "hexflex/triangle_vector"
require "hexflex/triangle"

describe Hexflex::TriangleVector do

  let(:triangle) { Hexflex::Triangle.new }
  subject { Hexflex::TriangleVector.new(triangle) }

  describe ".new" do
    it "takes a triangle" do
      expect(subject.triangle).to eq (triangle)
    end
    it "optionally take a group" do
      group = double("group")
      subject = Hexflex::TriangleVector.new(triangle, group)
      expect(subject.group).to eq group
    end
  end
  describe "#fill_group" do
    it "returns an rvg group" do
      expect(subject.fill_group).to be_a Magick::RVG::Group
    end
    it "adds a triangle with the color to the group" do
      group = double("group")
      polygon = double("polygon")
      subject = Hexflex::TriangleVector.new(triangle,group)
      expect(group).to receive(:polygon).
        with( 0,               1,
              Math::sqrt(3)/2, -1.0/2,
              -Math::sqrt(3)/2, -1.0/2).
        and_return(polygon)
      expect(polygon).to receive(:styles).with(fill: triangle.face)
      subject.fill_group
    end
  end

end
