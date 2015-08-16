require "bundler/gem_tasks"
require 'rspec/core/rake_task'
require "hexflex"

RSpec::Core::RakeTask.new(:spec)

task :default => [:default_test, :color_test, :image_test, :photo_test, :spec]

TEST_FIXTURES= "spec/fixtures"

task :default_test do
  Hexflex.create_template_image!
  puts "Default test output to out.png."
end

task :color_test do
  fixture_path = "#{TEST_FIXTURES}/color_test"
  Hexflex.create_template_image!(
    output_file_name: "#{fixture_path}/color_test.png",
    side_fills: [:blue, :green, :yellow]
  )
  puts "Color test output to #{fixture_path}/color_test.png."
end

task :image_test do
  fixture_path = "#{TEST_FIXTURES}/image_test"
  Hexflex.create_template_image!(
    output_file_name: "#{fixture_path}/image_test.png",
    side_fills: [
      "#{fixture_path}/1.png",
      "#{fixture_path}/2.png",
      "#{fixture_path}/3.png"
    ]
  )
  puts "Image test output to #{fixture_path}/image_test.png."
end

task :photo_test do
  fixture_path = "#{TEST_FIXTURES}/photo_test"
  Hexflex.create_template_image!(
    output_file_name: "#{fixture_path}/photo_test.png",
    side_fills: [
      "#{fixture_path}/1.jpg",
      "#{fixture_path}/2.jpg",
      "#{fixture_path}/3.jpg"
    ]
  )
  puts "Photo test output to #{fixture_path}/photo_test.png."
end
