require "spec_helper"
require "hexflex/template"

describe Hexflex::Template do
  describe "constant setup" do
    it "sets the RVG dpi" do
      expect(::Magick::RVG::dpi).to eq 72
    end
  end
  describe "#new" do
    it "initializes its public vector_graphic attribute" do
      expect(subject.vector_graphic).to be_a Magick::RVG
    end
    it "initializes the width of the vector graphic to 10 inches" do
      expect(subject.vector_graphic.width).to eq 10.in
    end
    it "initializes the vector graphic to have a 30.25:3 aspect ratio" do
      height = subject.vector_graphic.height
      width = subject.vector_graphic.width
      aspect_ratio = width/height
      expect(aspect_ratio).to be_within(1e-10).of(5.5/Math::sqrt(3))
    end
    it "sets its internal vector graphic background to white" do
      expect(subject.vector_graphic.background_fill.to_color).to eq "white"
    end
  end

  describe "#place_triangle" do
    let(:triangle) { instance_double(Hexflex::Triangle) }
    let(:triangle_vector) { double("triangle_vector") }
    let(:index) { 18 }
    let(:placer) { instance_double(Hexflex::TrianglePlacer) }

    it "puts the triangle on the vector_graphic" do
      allow(Hexflex::TrianglePlacer).to receive(:new)
        .with(subject.vector_graphic, triangle_vector, index)
        .and_return(placer)
      allow(triangle).to receive(:vector).and_return(triangle_vector)
      expect(placer).to receive(:place!)
      subject.place_triangle(triangle, index)
    end
  end

  describe "#save" do
    it "writes the canvas to a file" do
      vector_graphic = double("vector_graphic").as_null_object
      expect(Magick::RVG).to receive(:new).and_return(vector_graphic)
      drawing = double("drawing")
      expect(vector_graphic).to receive(:draw).and_return(drawing)
      expect(drawing).to receive(:write).with("out.gif")
      subject.save
    end
  end
end
