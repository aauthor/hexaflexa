require 'spec_helper'

describe Hexflex::Triangle do

  it "can be initialized with a face" do
    triangle = Hexflex::Triangle.new(face: :red)
    expect(triangle.face).to eq :red
  end

  it "can have a face" do
    triangle = Hexflex::Triangle.new
    triangle.face = :red
    expect(triangle.face).to eq :red
  end

end
