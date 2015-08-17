describe Hexflex do

  describe '#make_template' do

    RSpec::Matchers.define :render_to do |expected|
      match do |actual|
        expected.difference(actual.draw)[1] < 0.001
      end
    end

    shared_examples 'a properly prepared template vector' do
      let(:expected_image) { Magick::Image.read(expected_image_path).first }

      it 'makes a ruby vector graphic vector template' do
        expect(subject).to be_a Magick::RVG
      end

      it 'generates the template with reasonable defaults' do
        expect(subject).to render_to(expected_image)
      end
    end

    context 'with no opts passed in' do
      subject { described_class.make_template_vector }
      let(:expected_image_path) { 'out.png' }

      it_behaves_like 'a properly prepared template vector'
    end

    context 'with simple color options' do
      subject do
        described_class.make_template_vector(
          side_fills: [ 'blue', 'green', 'yellow' ]
        )
      end
      let(:expected_image_path) { 'spec/fixtures/color_test/color_test.png' }

      it_behaves_like 'a properly prepared template vector'
    end

    context 'with perfectly scaled image sides' do
      subject do
        described_class.make_template_vector(
          side_fills: [
            'spec/fixtures/image_test/1.png',
            'spec/fixtures/image_test/2.png',
            'spec/fixtures/image_test/3.png'
          ]
        )
      end
      let(:expected_image_path) { 'spec/fixtures/image_test/image_test.png' }

      it_behaves_like 'a properly prepared template vector'
    end

    context 'with arbitrary photo sides' do
      subject do
        described_class.make_template_vector(
          side_fills: [
            'spec/fixtures/photo_test/1.jpg',
            'spec/fixtures/photo_test/2.jpg',
            'spec/fixtures/photo_test/3.jpg'
          ]
        )
      end
      let(:expected_image_path) { 'spec/fixtures/photo_test/photo_test.png' }

      it_behaves_like 'a properly prepared template vector'
    end
  end

end
