require 'rspec/core/rake_task'

task :default => :run

desc "Run Chess Game"
task :run do 
  ruby "-w lib/chess.rb"
end

desc "Run tests Chess"
RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = "-c -w"
  task.verbose = false
end