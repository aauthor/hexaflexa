require "spec_helper"

describe Hexflex::Hexaflexagon do

  it "has three sides" do
    sided = Hexflex::Hexaflexagon.new
    expect(sided.sides.count).to eq 3
  end

  context "created with no specified faces" do
    it "creates sides with magenta, cyan, and yellow" do
      hexaflexagon = Hexflex::Hexaflexagon.new
      expect(hexaflexagon.sides.select{ |s| s.face == "magenta"}.count).to eq 1
      expect(hexaflexagon.sides.select{ |s| s.face == "cyan"}.count).to eq 1
      expect(hexaflexagon.sides.select{ |s| s.face == "yellow"}.count).to eq 1
    end
  end

  describe "#triangles" do
    it "returns the triangles in side order" do
      side_order = subject.sides.inject([]) do |memo, side|
        memo + side.triangles
      end
      expect(subject.triangles).to eq side_order
    end
  end

  describe "#as_template" do
    it "creates a template of itself" do
      templater = double("templater")
      template = double("template")
      expect(Hexflex::Templater).to receive(:new).with(subject).and_return(templater)
      expect(templater).to receive(:make_template).and_return template
      expect(subject.as_template).to eq template
    end
  end

end
