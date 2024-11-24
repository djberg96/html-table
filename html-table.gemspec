require 'rubygems'

Gem::Specification.new do |spec|
  spec.name       = 'html-table'
  spec.version    = '1.7.0'
  spec.author     = 'Daniel J. Berger'
  spec.license    = 'Apache-2.0'
  spec.email      = 'djberg96@gmail.com'
  spec.homepage   = 'http://github.com/djberg96/html-table'
  spec.summary    = 'A Ruby interface for generating HTML tables'
  spec.test_files = Dir['spec/*.rb']
  spec.files      = Dir['**/*'].reject{ |f| f.include?('git') }
  spec.cert_chain = ['certs/djberg96_pub.pem']

  spec.extra_rdoc_files  = ['README.md', 'CHANGES.md', 'MANIFEST.md'] + Dir['doc/*.md']

  spec.add_dependency('structured_warnings', '~> 0.4.0')

  spec.add_development_dependency('rspec', '~> 3.9')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rubocop')
  spec.add_development_dependency('rubocop-rspec')

  spec.metadata = {
    'homepage_uri'          => 'https://github.com/djberg96/html-table',
    'bug_tracker_uri'       => 'https://github.com/djberg96/html-table/issues',
    'changelog_uri'         => 'https://github.com/djberg96/html-table/blob/main/CHANGES.md',
    'documentation_uri'     => 'https://djberg96.github.io/html-table',
    'source_code_uri'       => 'https://github.com/djberg96/html-table',
    'wiki_uri'              => 'https://github.com/djberg96/html-table/wiki',
    'rubygems_mfa_required' => 'true',
    'github_repo'           => 'https://github.com/djberg96/html-table',
    'funding_uri'           => 'https://github.com/sponsors/djberg96'
  }

  spec.description = <<-EOF
    The html-table library provides an interface for generating HTML tables
    in a syntax comfortable to Ruby programmers, but with some enforcement
    of where certain elements can be placed.
  EOF
end
