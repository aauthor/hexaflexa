require 'spec_helper'
require "hexflex/triangle_vector"

describe Hexflex::TriangleVector do

  let(:triangle) { Hexflex::Triangle.new(fill: :red) }
  subject { Hexflex::TriangleVector.new(triangle) }

  describe ".new" do
    it "takes a triangle" do
      expect(subject.triangle).to eq (triangle)
    end

    describe "creating the vector" do
      let(:group) { instance_double(Magick::RVG::Group) }

      before do
        allow(Magick::RVG::Group).to receive(:new).and_return(group)
      end

      describe "delegating to the rvg group" do
        let(:group) { instance_double(Magick::RVG::Group).as_null_object }
        it "delegates to the vector" do
          expect(group).to receive(:title)
          subject.title
        end
      end

      context "with a color fill" do
        it "adds a triangle with the color to the group" do
          polygon = instance_double(Magick::RVG::Polygon)
          expect(group).to receive(:polygon)
            .with( 0, 1,   Math::sqrt(3)/2, -1.0/2,   -Math::sqrt(3)/2,-1.0/2)
            .and_return(polygon)
          expect(polygon).to receive(:styles).with(fill: triangle.fill.to_s)
          subject
        end
      end

      context "with an image fill" do
        let(:fill) { 'in.png' }
        let(:index) { 4 }
        let(:triangle) { Hexflex::Triangle.new(fill: fill, index: index) }
        let(:image_width) { 200 }
        let(:image_height) { 87 }
        let(:image_list) { [instance_double(Magick::Image , columns: image_width, rows: image_height)] }
        let(:image) { image_list.first }
        let(:image_use) { instance_double(Magick::RVG::Use) }
        let(:clip_path) { instance_double(Magick::RVG::ClipPath) }

        it "reads cuts the image out into the appropriate triangle" do
          triangle_base = image_width / 2
          triangle_half_base = triangle_base / 2
          triangle_height = image_height / 2
          triangle_base_to_center = 1.0/3.0 * triangle_height
          triangle_center_to_top = 2.0/3.0 * triangle_height

          expected_rotation = 60 * triangle.index

          expect(Magick::Image).to receive(:read).and_return(image_list)
          expect(Magick::RVG::ClipPath).to receive(:new).and_return(clip_path)
          expect(clip_path).to receive(:polygon).with(
            0,                   triangle_center_to_top,
            triangle_half_base, -triangle_base_to_center,
            -triangle_half_base, -triangle_base_to_center
          )
          expect(group).to receive(:image).with(image).and_return(image_use)
          expect(image_use).to receive(:translate)
            .with(-triangle_base, -triangle_base_to_center)
            .and_return(image_use)
          expect(image_use).to receive(:rotate)
            .with(expected_rotation, triangle_base, triangle_height)
            .and_return(image_use)
          expect(group).to receive(:styles).with(clip_path: clip_path)

          subject
        end
      end
    end
  end
end
