require 'spec_helper'

describe Hexflex::Side do

  it "always has six triangles" do
    expect(subject.triangles.count).to eq 6
    expect(subject.triangles).to all(be_a(Hexflex::Triangle))
  end

end
