require 'engine_pack'

EnginePack.configure do |config|
  config.package_manager = :<%= options[:package_manager] %>
  config.engines = %w[]
end
