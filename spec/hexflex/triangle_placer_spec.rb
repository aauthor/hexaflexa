require "spec_helper"
require "hexflex/triangle_placer"

describe Hexflex::TrianglePlacer do
  subject do
    Hexflex::TrianglePlacer.new(canvas, triangle_vector, index)
  end
  let(:canvas) { double(:canvas, width: 5.5, height: 1.73) }

  let(:triangle_base) { canvas.width / 5.5 }
  let(:triangle_half_base) { triangle_base / 2.0 }
  let(:triangle_height) { canvas.height / 2.0 }
  let(:triangle_height_after_radius) { triangle_height / 3.0 }

  let(:triangle_vector) { instance_double(Hexflex::TriangleVector, triangle_base: 10, triangle_height: 8.66) }
  let(:triangle_vector_use) { instance_double(Magick::RVG::Use) }
  let(:indexes) { (0..19) }
  let(:index) { indexes.to_a.sample }
  before do
    allow(canvas).to receive(:use).with(triangle_vector).and_return(triangle_vector_use)
  end

  describe "#place!" do
    before do
      allow(triangle_vector_use).to receive(:translate).and_return(triangle_vector_use)
      allow(triangle_vector_use).to receive(:rotate).and_return(triangle_vector_use)
      allow(triangle_vector_use).to receive(:scale).and_return(triangle_vector_use)
    end

    it "translates the triangle to a viewable region" do
      expect(triangle_vector_use).to receive(:translate)
        .with(triangle_half_base, triangle_height_after_radius)
      subject.place!
    end

    context "placements 0 to 9" do
      let(:indexes) { (0..9) }
      it "translates the triangle latterally base off of the index" do
        expect(triangle_vector_use).to receive(:translate)
        expect(triangle_vector_use).to receive(:translate).with(triangle_half_base * index, 0)
        subject.place!
      end
      it "does not place the triangle an extra triangle height below" do
        expect(triangle_vector_use).to_not receive(:translate)
          .with(0, triangle_height)
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
          expect(triangle_vector_use).to receive(:translate).with(0, triangle_height_after_radius)
          subject.place!
        end
      end
    end

    context "placements 10..19" do
      let(:indexes) { (10..19) }
      it "resets the lateral placement from the begining" do
        expect(triangle_vector_use).to receive(:translate)
          .with(float_close_to(triangle_half_base * (index - 10)), 0)
        subject.place!
      end
      it "places the triangle a triangle height below" do
        expect(triangle_vector_use).to receive(:translate)
          .with(0, float_close_to(triangle_height))
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
            .with(0, float_close_to(triangle_height_after_radius))
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
    it "scales the triangle to fit the canvas" do
      expect(triangle_vector_use).to receive(:scale).with(
        triangle_base/triangle_vector.triangle_base,
        triangle_height/triangle_vector.triangle_height
      )
      subject.place!
    end
  end
end
