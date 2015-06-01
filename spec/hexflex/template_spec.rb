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
    before do
      subject.canvas = canvas
      expect(triangle).to receive(:to_vector_group).and_return(triangle_vector)
      allow(canvas).to receive(:use).with(triangle_vector).and_return(use)
    end

    it "puts the triangle on the canvas" do
      expect(canvas).to receive(:use).with(triangle_vector)
      subject.place_triangle(triangle, 0)
    end

    it "translates the triangle to a viewable region" do
      expect(use).to receive(:translate).with(Hexflex::X, Hexflex::Y)
      subject.place_triangle(triangle, 0)
    end

    it "translates the second triangle over a radius length" do
      expect(use).to receive(:translate)
      expect(use).to receive(:translate).with(Hexflex::R, 0)
      subject.place_triangle(triangle, 1)
    end

    it "translates subsequent triangles over a multiple of radius length" do
      expect(use).to receive(:translate)
      expect(use).to receive(:translate).with(2*Hexflex::R, 0)
      subject.place_triangle(triangle, 2)
    end

    it "rotates odd triangle 60 degrees" do
      expect(use).to receive(:rotate).with(60)
      subject.place_triangle(triangle,1)
    end

    it "does not rotate even triangles 60 degrees" do
      expect(use).to_not receive(:rotate).with(60)
      subject.place_triangle(triangle,2)
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
