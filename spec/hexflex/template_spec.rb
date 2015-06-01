require "spec_helper"
require "hexflex/template"

describe Hexflex::Template do
  let(:canvas) { double("canvas") }
  it "has a viewboxed canvas" do
    expect(Magick::RVG).to receive(:new).with(3.in, 3.in).and_return(canvas)
    expect(canvas).to receive(:viewbox).and_return(canvas)
    allow(canvas).to receive(:background_fill=)
    expect(subject.canvas).to be canvas
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
      allow(canvas).to receive(:use).with(triangle_vector).and_return(use)
      expect(use).to receive(:translate).with(Hexflex::X, Hexflex::Y)
      subject.place_triangle(triangle, 0)
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
