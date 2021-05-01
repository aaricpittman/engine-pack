require_relative 'lib/dummy_engine/version'

Gem::Specification.new do |spec|
  spec.name        = 'dummy_engine'
  spec.version     = DummyEngine::VERSION
  spec.authors     = 'Aaric Pittman'
  spec.email       = 'aaricpittman@gmail.com'
  spec.summary     = 'This is just a test engine.'
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  spec.files = Dir['{lib}/**/*']
end
