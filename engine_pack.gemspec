# frozen_string_literal: true

require_relative 'lib/engine_pack/version'

Gem::Specification.new do |spec|
  spec.name          = 'engine_pack'
  spec.version       = EnginePack::VERSION
  spec.authors       = ['Aaric Pittman']
  spec.email         = ['aaricpittman@gmail.com']

  spec.summary       = 'Simplifies including JavaScript packages in your Rails Engines.'
  spec.homepage      = 'https://github.com/aaricpittman/engine-pack'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/aaricpittman/engine-pack'
  spec.metadata['changelog_uri'] = 'https://github.com/aaricpittman/engine-pack/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'dry-configurable', '~> 0.12', '>= 0.12.0'
  spec.add_runtime_dependency 'railties', '>= 6.0.0'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
end
