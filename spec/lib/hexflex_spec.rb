describe Hexflex do

  describe '#make_template' do
    let(:opts) { {
      side_fills: [ 'blue', 'green', 'yellow' ]
    } }
    it 'makes a hexaflexagon template' do
      expect(described_class.make_template(opts)).to be_a Hexflex::Template
    end
  end

end
