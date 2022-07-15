require 'rake'
require 'rake/clean'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'rdoc/task'

CLEAN.include("**/*.gem", "**/*.rbc", "**/*.lock")

namespace :gem do
  desc 'Build the html-table gem'
  task :create => [:clean] do
    require 'rubygems/package'
    spec = Gem::Specification.load('html-table.gemspec')
    spec.signing_key = File.join(Dir.home, '.ssh', 'gem-private_key.pem')
    Gem::Package.build(spec)
  end

  desc "Install the html-table package as a gem"
  task :install => [:create] do
    file = Dir["*.gem"].first
    sh "gem install -l #{file}"
  end
end

namespace 'example' do
  desc "Run the first simple html-table example"
  task :simple1 do
    sh 'ruby -Ilib examples/simple1.rb'
  end

  desc "Run the second simple html-table example"
  task :simple2 do
    sh 'ruby -Ilib examples/simple2.rb'
  end

  desc "Run the third simple html-table example"
  task :simple3 do
    sh 'ruby -Ilib examples/simple3.rb'
  end

  desc "Run the first intermediate html-table example"
  task :intermediate1 do
    sh 'ruby -Ilib examples/intermediate1.rb'
  end

  desc "Run the second intermediate html-table example"
  task :intermediate2 do
    sh 'ruby -Ilib examples/intermediate2.rb'
  end

  desc "Run the advanced html-table example"
  task :advanced do
    sh 'ruby -Ilib examples/advanced.rb'
  end
end

RDoc::Task.new do |rdoc|
  rdoc.main = 'README.md'
  rdoc.rdoc_files.include('README.md', 'lib/**/*.rb')
end

RuboCop::RakeTask.new

namespace :spec do
  RSpec::Core::RakeTask.new(:attribute_handler) do |t|
    t.pattern = 'spec/attribute_handler_spec.rb'
  end

  RSpec::Core::RakeTask.new(:body) do |t|
    t.pattern = 'spec/body_spec.rb'
  end

  RSpec::Core::RakeTask.new(:caption) do |t|
    t.pattern = 'spec/caption_spec.rb'
  end

  RSpec::Core::RakeTask.new(:col) do |t|
    t.pattern = 'spec/col_spec.rb'
  end

  RSpec::Core::RakeTask.new(:colgroup) do |t|
    t.pattern = 'spec/colgroup_spec.rb'
  end

  RSpec::Core::RakeTask.new(:data) do |t|
    t.pattern = 'spec/data_spec.rb'
  end

  RSpec::Core::RakeTask.new(:foot) do |t|
    t.pattern = 'spec/foot_spec.rb'
  end

  RSpec::Core::RakeTask.new(:head) do |t|
    t.pattern = 'spec/head_spec.rb'
  end

  RSpec::Core::RakeTask.new(:header) do |t|
    t.pattern = 'spec/header_spec.rb'
  end

  RSpec::Core::RakeTask.new(:html_handler) do |t|
    t.pattern = 'spec/html_handler_spec.rb'
  end

  RSpec::Core::RakeTask.new(:row) do |t|
    t.pattern = 'spec/row_spec.rb'
  end

  RSpec::Core::RakeTask.new(:table) do |t|
    t.pattern = 'spec/table_spec.rb'
  end

  RSpec::Core::RakeTask.new(:tablesection) do |t|
    t.pattern = 'spec/tablesection_spec.rb'
  end

  RSpec::Core::RakeTask.new(:tag_handler) do |t|
    t.pattern = 'spec/tag_handler_spec.rb'
  end

  RSpec::Core::RakeTask.new(:all) do |t|
    t.pattern = 'spec/*_spec.rb'
  end
end

task :default => ['spec:all', :clean]
