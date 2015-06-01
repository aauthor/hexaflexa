require "spec_helper"
require "hexflex/templater"

describe Hexflex::Templater do
  describe "#new" do
    it "takes a hexaflexagon" do
      hexaflexagon = double("hexaflexagon")
      templater = Hexflex::Templater.new(hexaflexagon)
      expect(templater.hexaflexagon).to eq hexaflexagon
    end
  end

  describe "#make_template" do
    let(:hexaflexagon) { Hexflex::Hexaflexagon.new }
    let(:orderer) { instance_double(Hexflex::TriangleOrderer) }
    let(:template_triangles) do
      Array.new(18) { |index| double("triangle_#{index}") }
    end
    before do
      expect(Hexflex::TriangleOrderer).to receive(:new)
        .with(hexaflexagon)
        .and_return(orderer)
      expect(orderer).to receive(:template_order).and_return(template_triangles);
    end
    it "returns a template with all the hexaflexagon's triangles placed therein" do
      templater = Hexflex::Templater.new(hexaflexagon)

      template = double("template")
      expect(Hexflex::Template).to receive(:new).and_return(template)
      template_triangles.each_with_index do |triangle, index|
        expect(template).to receive(:place_triangle).with(triangle, index)
      end

      expect(templater.make_template).to eq template
    end
  end

end
