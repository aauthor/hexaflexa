require 'spec_helper'

describe Hexflex::Triangle do

  it "can have a background" do
    subject.background = :red
    expect(subject.background).to eq :red
  end

end
