require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "hexflex"

RSpec::Core::RakeTask.new(:spec)

task :default => [:spec, :flex]

task :flex do
  puts "Let's flex, shall we?"
  Hexflex.make_template_image
end
