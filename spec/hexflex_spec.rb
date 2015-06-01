require "spec_helper"
require "hexflex"

describe Hexflex do
  describe "constants setup" do
    it "sets the global dpi" do
      expect(Magick::RVG::dpi).to eq (72)
    end
    it "sets the radius" do
      expect(Hexflex::R).to eq 1
    end
    it "sets the x offset for half of a triangle" do
      expect(Hexflex::X).to eq(Math::sqrt(3)/2)
    end
    it "sets the y offset below the center of mass of the triangle" do
      expect(Hexflex::Y).to eq(1.0/2.0)
    end
  end

  describe "#make_template_image" do
    let(:hexaflexagon) { double("hexaflexagon") }
    let(:template) { double("template") }
    it "creates a and save a hexaflexagon template" do
      expect(Hexflex::Hexaflexagon).to receive(:new).and_return(hexaflexagon)
      expect(hexaflexagon).to receive(:as_template).and_return(template)
      expect(template).to receive(:save)
      subject.make_template_image
    end

  end
end
