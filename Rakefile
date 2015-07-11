require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "hexflex"

RSpec::Core::RakeTask.new(:spec)

task :default => [:spec, :color_smoketest, :image_smoketest]

task :color_smoketest do
  Hexflex.make_template_image(
    output_file_name: "color_test.png",
    side_fills: [:blue, :green, :yellow]
  )
  puts "Color test output to color_test.png."
end

task :image_smoketest do
  Hexflex.make_template_image(
    output_file_name: "image_test.png",
    side_fills: ["1.png", "2.png", "3.png"]
  )
  puts "Image test output to image_test.png."
end
