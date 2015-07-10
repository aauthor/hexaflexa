require "spec_helper"
require "hexflex/triangle_placer"

describe Hexflex::TrianglePlacer do
  subject do
    Hexflex::TrianglePlacer.new(canvas, triangle_vector, index)
  end
  let(:canvas) { double("canvas") }
  let(:triangle_vector) { instance_double(Magick::RVG::Group) }
  let(:triangle_vector_use) { instance_double(Magick::RVG::Use) }
  let(:indexes) { (0..19) }
  let(:index) { indexes.to_a.sample }
  before do
    allow(canvas).to receive(:viewbox).and_return(canvas)
    allow(canvas).to receive(:use).with(triangle_vector).and_return(triangle_vector_use)
  end

  describe "#new" do
    it "viewboxes the canvas" do
      viewboxed_canvas = double(:viewboxed_canvas)
      expect(canvas).to receive(:viewbox)
        .with(0, 0, 5.5*Hexflex::BASE, 2*Hexflex::HEIGHT)
        .and_return(viewboxed_canvas)
      expect(subject.canvas).to eq viewboxed_canvas
    end
  end
  describe "#place!" do
    before do
      allow(triangle_vector_use).to receive(:translate)
      allow(triangle_vector_use).to receive(:rotate)
    end

    it "translates the triangle to a viewable region" do
      expect(triangle_vector_use).to receive(:translate).with(Hexflex::HALF_BASE, Hexflex::HEIGHT_AFTER_RADIUS)
      subject.place!
    end

    context "placements 0 to 9" do
      let(:indexes) { (0..9) }
      it "translates the triangle latterally base off of the index" do
        expect(triangle_vector_use).to receive(:translate)
        expect(triangle_vector_use).to receive(:translate).with(Hexflex::HALF_BASE * index, 0)
        subject.place!
      end
      it "does not place the triangle an extra triangle height below" do
        expect(triangle_vector_use).to_not receive(:translate).with(0, Hexflex::HEIGHT_AFTER_RADIUS + Hexflex::RADIUS)
        subject.place!
      end
      context "even" do
        let(:indexes) { (0..8).step(2) }
        it "does not rotate the triangle" do
          expect(triangle_vector_use).to_not receive(:rotate).with(60)
          subject.place!
        end
      end
      context "odd" do
        let(:indexes) { (1..9).step(2) }
        it "rotates the triangle" do
          expect(triangle_vector_use).to receive(:rotate).with(60)
          subject.place!
        end
        it "move the triangle down to be in line with the others" do
          expect(triangle_vector_use).to receive(:translate).with(0, Hexflex::HEIGHT_AFTER_RADIUS)
          subject.place!
        end
      end
    end

    context "placements 10..19" do
      let(:indexes) { (10..19) }
      it "resets the lateral placement from the begining" do
        expect(triangle_vector_use).to receive(:translate)
          .with(float_close_to(Hexflex::HALF_BASE * (index - 10)), 0)
        subject.place!
      end
      it "places the triangle a triangle height below" do
        expect(triangle_vector_use).to receive(:translate)
          .with(0, float_close_to(Hexflex::HEIGHT_AFTER_RADIUS + Hexflex::RADIUS))
        subject.place!
      end
      context "odd" do
        let(:indexes) { (11..19).step(2) }
        it "does not rotate the triangle" do
          expect(triangle_vector_use).to receive(:rotate).with(0)
          subject.place!
        end
        it "does not move the triangle down to be in line with the others" do
          expect(triangle_vector_use).to_not receive(:translate)
            .with(0, float_close_to(Hexflex::HEIGHT_AFTER_RADIUS))
          subject.place!
        end
      end
      context "even" do
        let(:indexes) { (0..8).step(2) }
        it "rotates the triangle" do
          expect(triangle_vector_use).to_not receive(:rotate).with(60)
          subject.place!
        end
      end
    end
  end
end
