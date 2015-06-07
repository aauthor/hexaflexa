require "spec_helper"
require "hexflex/template"

describe Hexflex::Template do
  let(:canvas) { double("canvas") }
  describe ".new" do
    before do
      allow(Magick::RVG).to receive(:new).and_return(canvas)
      allow(canvas).to receive(:viewbox).and_return(canvas)
      allow(canvas).to receive(:background_fill=)
    end
    it "it has a canvas" do
      expect(subject.canvas).to be canvas
    end
  end

  describe "#place_triangle" do
    let(:triangle) { double("triangle") }
    let(:triangle_vector) { double(:triangle_vector) }
    let(:use) { double(:use).as_null_object }
    let(:index) { (0..19).to_a.sample }
    before do
      subject.canvas = canvas
      expect(triangle).to receive(:to_vector_group).and_return(triangle_vector)
      allow(canvas).to receive(:use).with(triangle_vector).and_return(use)
    end

    it "puts the triangle on the canvas" do
      expect(canvas).to receive(:use).with(triangle_vector)
      subject.place_triangle(triangle, index)
    end

    it "it calls to place the triangle on the canvas" do
      triangle_placer = instance_double(Hexflex::TrianglePlacer)
      expect(Hexflex::TrianglePlacer).to receive(:new).
        with(use , index).
        and_return(triangle_placer)
      expect(triangle_placer).to receive(:place!)
      subject.place_triangle(triangle, index)
    end

  end

  describe "#save" do
    it "writes the canvas to a file" do
      canvas = double("canvas")
      subject.canvas = canvas
      drawing = double("drawing")
      expect(canvas).to receive(:draw).and_return(drawing)
      expect(drawing).to receive(:write).with("out.gif")
      subject.save
    end
  end
end
