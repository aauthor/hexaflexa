require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "hexflex"

task :default => [:color_test, :image_test, :photo_test, :help]

task :color_test do
  Hexflex.make_template_image(
    output_file_name: "test/color_test/color_test.png",
    side_fills: [:blue, :green, :yellow]
  )
  puts "Color test output to color_test.png."
end

task :image_test do
  Hexflex.make_template_image(
    output_file_name: "test/image_test/image_test.png",
    side_fills: [
      "test/image_test/1.png",
      "test/image_test/2.png",
      "test/image_test/3.png"
    ]
  )
  puts "Image test output to image_test.png."
end

task :photo_test do
  Hexflex.make_template_image(
    output_file_name: "test/photo_test/photo_test.png",
    side_fills: [
      "test/photo_test/1.jpg",
      "test/photo_test/2.jpg",
      "test/photo_test/3.jpg"
    ]
  )
  puts "Photo test output to photo_test.png."
end

task :help do
  `bin/hexflex --help`
end
