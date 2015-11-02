require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'hexflex'

RSpec::Core::RakeTask.new(:spec)

task :default =>
  [:spec, :default_test, :color_test, :image_test, :photo_test, :glue_test]

task :generate_fixtures =>
  [:default_test, :color_test, :image_test, :photo_test, :glue_test]

TEST_FIXTURES= 'spec/fixtures'

task :default_test do
  Hexflex.create_template_image!
  puts 'Default test output to out.png.'
end

task :color_test do
  Hexflex.create_template_image!(
    output_file_name: 'color_test.png',
    side_fills: [:blue, :green, :yellow]
  )
  puts 'Color test output to color_test.png.'
end

task :image_test do
  fixture_path = "#{TEST_FIXTURES}/images"
  Hexflex.create_template_image!(
    output_file_name: 'image_test.png',
    side_fills: [
      "#{fixture_path}/1.png",
      "#{fixture_path}/2.png",
      "#{fixture_path}/3.png"
    ]
  )
  puts 'Image test output to image_test.png.'
end

task :photo_test do
  fixture_path = "#{TEST_FIXTURES}/photos"
  Hexflex.create_template_image!(
    output_file_name: 'photo_test.png',
    side_fills: [
      "#{fixture_path}/1.jpg",
      "#{fixture_path}/2.jpg",
      "#{fixture_path}/3.jpg"
    ]
  )
  puts 'Photo test output to photo_test.png.'
end

task :glue_test do
  fixture_path = "#{TEST_FIXTURES}/photos"
  Hexflex.create_template_image!(
    output_file_name: 'glue_test.png',
    side_fills: [
      "#{fixture_path}/1.jpg",
      "#{fixture_path}/2.jpg",
      "#{fixture_path}/3.jpg"
    ],
    template_style: :glue
  )
  puts 'Photo test output to glue_test.png.'
end
