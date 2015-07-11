require "spec_helper"
require "hexflex/triangle"

describe Hexflex::Triangle do

  it "can be initialized with a fill" do
    triangle = Hexflex::Triangle.new(fill: :red)
    expect(triangle.fill).to eq :red
  end

  it "can have a fill" do
    triangle = Hexflex::Triangle.new
    triangle.fill = :red
    expect(triangle.fill).to eq :red
  end

  describe "#vector" do
    it "creates a TriangleVector from itself" do
      triangle_vector = instance_double(Hexflex::TriangleVector)
      group = instance_double(Magick::RVG::Group)
      expect(Hexflex::TriangleVector).to receive(:new)
        .with(subject)
        .and_return(triangle_vector)
      expect(subject.vector).to eq triangle_vector
    end
  end

  describe ".place_holder" do
    it "returns a triangle with a grey background" do
      template = Hexflex::Triangle.place_holder
      expect(template.fill).to eq "grey"
    end
  end

end
