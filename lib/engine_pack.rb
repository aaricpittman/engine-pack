require 'dry/configurable'

require 'engine_pack/version'
require 'engine_pack/preinstall'

module EnginePack
  extend Dry::Configurable

  setting :package_manager, :npm
  setting :engines, []

  def self.gem_specs
    @gem_specs ||= Bundler.load.specs
  end
end

require 'engine_pack/railtie' if defined?(Rails)
