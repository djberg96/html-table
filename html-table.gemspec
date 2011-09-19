require 'rubygems'

Gem::Specification.new do |gem|
  gem.name       = 'html-table'
  gem.version    = '1.3.6'
  gem.author     = 'Daniel J. Berger'
  gem.license    = 'Artistic 2.0'
  gem.email      = 'djberg96@gmail.com'
  gem.homepage   = 'http://shards.rubyforge.org'
  gem.summary    = 'A Ruby interface for generating HTML tables'
  gem.test_files = Dir['test/*.rb']
  gem.files      = Dir['**/*'].reject{ |f| f.include?('git') }

  gem.rubyforge_project = 'shards'
  gem.extra_rdoc_files  = ['README', 'CHANGES'] + Dir['doc/*.rdoc']

  gem.add_dependency('strongtyping')
  gem.add_dependency('structured_warnings')

  gem.add_development_dependency('test-unit')

  gem.description = <<-EOF
    The html-table library provides an interface for generating HTML tables
    in a syntax comfortable to Ruby programmers, but with some enforcement
    of where certain elements can be placed.
  EOF
end
