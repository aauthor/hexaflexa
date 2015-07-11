require "spec_helper"

describe Hexflex::Hexaflexagon do
  let(:side_fills) { [:red, :white, :blue] }
  subject { described_class.new(side_fills: side_fills) }

  describe '.new' do
    it "has three sides" do
      expect(subject.sides.count).to eq 3
    end

    it "creates sides with magenta, cyan, and yellow" do
      expect(subject.sides.select{ |s| s.fill == side_fills[0]}.count).to eq 1
      expect(subject.sides.select{ |s| s.fill == side_fills[1]}.count).to eq 1
      expect(subject.sides.select{ |s| s.fill == side_fills[2]}.count).to eq 1
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
