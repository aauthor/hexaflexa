require 'spec_helper'

describe Hexflex::Triangle do

  it "can be initialized with a background" do
    backgrounded = Hexflex::Triangle.new(background: :red)
    expect(backgrounded.background).to eq :red
  end

  it "can have a background" do
    subject.background = :red
    expect(subject.background).to eq :red
  end

end
