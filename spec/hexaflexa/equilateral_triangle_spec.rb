require 'spec_helper'

describe Hexaflexa::EquilateralTriangle do

  describe "sides" do
    it "can get and set side" do
      subject.side = 5
      expect(subject.side).to eq 5
    end
  end

  describe "height" do
    it "can tell you it's height" do
      subject.side = 10
      expect(subject.height).to eq(5 * Math.sqrt(3))
    end
  end


end
