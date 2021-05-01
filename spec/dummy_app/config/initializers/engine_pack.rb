require 'engine_pack'

EnginePack.configure do |config|
  config.package_manager = :yarn
  config.engines = %w[dummy_engine]
end
