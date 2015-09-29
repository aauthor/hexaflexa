describe Hexflex do

  describe '#make_template' do

    matcher :render_to do |fixture|

      match do |vector|
        render_similar(fixture, vector)
      end

      failure_message do |vector|
        "expected that the generated output be the same as template" +
          debug_output(fixture, vector)
      end

      def render_similar(fixture, vector)
        image_difference(fixture, vector)[1] < 0.01
      end

      def image_difference(fixture, vector)
        fixture.difference(vector.draw)
      end

      def debug_output(fixture, vector)
        debug_image_path =
          "tmp/" +
          RSpec.current_example.full_description.parameterize('_') +
          "_#{Time.current.to_i}.png"
        vector.draw.write(debug_image_path)

        "\nDEBUG OUTPUT:\n" +
          "[mean_error_per_pixel, normalized_mean_error, normalized_maximum_error]\n" +
          image_difference(fixture, vector).inspect + "\n" +
          "Take a look for yourself:\n" +
          debug_image_path
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
      let(:expected_image_path) { 'spec/fixtures/default_out.png' }

      it_behaves_like 'a properly prepared template vector'
    end

    context 'with simple color options' do
      subject do
        described_class.make_template_vector(
          side_fills: [ 'blue', 'green', 'yellow' ]
        )
      end
      let(:expected_image_path) { 'spec/fixtures/color_out.png' }

      it_behaves_like 'a properly prepared template vector'
    end

    context 'with perfectly scaled image sides' do
      subject do
        described_class.make_template_vector(
          side_fills: [
            'spec/fixtures/images/1.png',
            'spec/fixtures/images/2.png',
            'spec/fixtures/images/3.png'
          ]
        )
      end
      let(:expected_image_path) { 'spec/fixtures/image_out.png' }

      it_behaves_like 'a properly prepared template vector'
    end

    context 'with arbitrary photo sides' do
      subject do
        described_class.make_template_vector(
          side_fills: [
            'spec/fixtures/photos/1.jpg',
            'spec/fixtures/photos/2.jpg',
            'spec/fixtures/photos/3.jpg'
          ]
        )
      end
      let(:expected_image_path) { 'spec/fixtures/photo_out.png' }

      it_behaves_like 'a properly prepared template vector'
    end
  end

end
