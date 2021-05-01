# frozen_string_literal: true

require 'open3'

require_relative 'command_runner'
require_relative 'engine_package'
require_relative 'package_manager_factory'

module EnginePack
  class Preinstall
    ENV_VARIABLE_NAME = 'EP_PREINSTALL'

    class << self
      def call(engines:)
        new.call(engines: engines)
      end
    end

    def initialize(
      command_runner: CommandRunner.new,
      package_manager: PackageManagerFactory.build(EnginePack.config.package_manager)
    )
      @command_runner = command_runner
      @package_manager = package_manager
    end

    def call(engines:)
      return if ENV.fetch(ENV_VARIABLE_NAME, nil)

      engines.each(&method(:install_engine))
    end

    private

    attr_reader :command_runner, :package_manager

    def install_engine(engine)
      engine_package = EnginePackage.new(engine)

      engine_package.with_path do |path|
        command_runner.run(
          package_manager.install_command(path),
          { ENV_VARIABLE_NAME => '1' }
        )
      end
    end
  end
end
