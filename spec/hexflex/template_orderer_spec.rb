require "spec_helper"
require "hexflex/template_orderer"

describe Hexflex::TemplateOrderer do

  describe "#template_order" do
    let(:hexaflexagon) do
      Hexflex::Hexaflexagon.new(side_fills: [:red, :white, :blue])
    end
    it "returns an array of triangles in template order with placeholders" do
      place_holders = Array.new(2) { Hexflex::Triangle.place_holder }
      allow(Hexflex::Triangle).to receive(:place_holder).
        and_return( place_holders[0], place_holders[1])
      triangles = hexaflexagon.sides.map { |s| s.triangles.dup }
      ordered = Hexflex::TemplateOrderer.new(hexaflexagon).triangles
      expect(ordered).to eq [
        triangles[2].shift,
        triangles[0].shift, triangles[0].shift,
        triangles[1].shift, triangles[1].shift,
        triangles[2].shift, triangles[2].shift,
        triangles[0].shift, triangles[0].shift,
        triangles[1].shift, place_holders[0], triangles[1].shift,
        triangles[2].shift, triangles[2].shift,
        triangles[0].shift, triangles[0].shift,
        triangles[1].shift, triangles[1].shift,
        triangles[2].shift,
        place_holders[1]
      ]
    end

    it "does not mutate the original list of triangles" do
      pre_triangles = hexaflexagon.sides.map { |s| s.triangles.dup }
      Hexflex::TemplateOrderer.new(hexaflexagon).triangles
      post_triangles = hexaflexagon.sides.map { |s| s.triangles.dup }
      expect(pre_triangles).to eq post_triangles
    end

  end

end
