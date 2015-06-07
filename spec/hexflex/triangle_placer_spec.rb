require "spec_helper"
require "hexflex/triangle_placer"

describe Hexflex::TrianglePlacer do
  subject do
    Hexflex::TrianglePlacer.new(triangle_use, index)
  end
  let(:triangle_use) { double("triangle_use") }
  let(:index) { indexes.to_a.sample }
  let(:indexes) { (0..19) }
  describe "#place!" do
    before do
      allow(triangle_use).to receive(:translate)
      allow(triangle_use).to receive(:rotate)
    end
    it "translates the triangle to a viewable region" do
      expect(triangle_use).to receive(:translate).with(Hexflex::X, Hexflex::Y)
      subject.place!
    end

    it "translates the triangle latterally base off of the index" do
      expect(triangle_use).to receive(:translate)
      expect(triangle_use).to receive(:translate).with(Hexflex::R * index, 0)
      subject.place!
    end

    context "odd placement" do
      let(:indexes) { (1..19).step(2) }

      it "rotates triangles 60 degrees" do
        expect(triangle_use).to receive(:rotate).with(60)
        subject.place!
      end

      it "move the triangle down to be in line with the others" do
        expect(triangle_use).to receive(:translate).with(0, Hexflex::Y)
        subject.place!
      end
    end

    context "event placements" do
      let(:indexes) { (2..18).step(2) }
      it "does not rotate triangles" do
        expect(triangle_use).to_not receive(:rotate).with(60)
        subject.place!
      end
    end
  end
end
