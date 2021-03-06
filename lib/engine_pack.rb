require 'dry/configurable'

require 'engine_pack/version'
require 'engine_pack/preinstall'

module EnginePack
  extend Dry::Configurable

  setting :package_manager, :npm
  setting :engines
end

require 'engine_pack/railtie' if defined?(Rails)
