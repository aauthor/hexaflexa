require "spec_helper"
require "hexflex"

describe Hexflex do
  describe "environment setup" do
    it "sets the global dpi" do
      expect(Magick::RVG::dpi).to eq (72)
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
