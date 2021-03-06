# frozen_string_literal: true

require 'open3'

module EnginePack
  class Preinstall
    ENV_VARIABLE_NAME = 'EP_PREINSTALL'
    PACKAGE_MANAGER_COMMANDS = {
      npm: 'npm install %<engine_path>s',
      yarn: 'yarn add file:%<engine_path>s'
    }.freeze

    class << self
      def call
        new.call
      end
    end

    def initialize(command_runner: Open3, gem_spec_set: Bundler.load.specs)
      @command_runner = command_runner
      @gem_spec_set = gem_spec_set
    end

    def call
      return if ENV.fetch(ENV_VARIABLE_NAME, nil)

      EnginePack.config.engines.each(&method(:install_engine))
    end

    private

    attr_reader :command_runner, :gem_spec_set

    def install_engine(engine)
      command = package_manager_command(engine)

      return unless command

      command_runner.popen3(
        { ENV_VARIABLE_NAME => '1' },
        command
      ) do |stdin, stdout, stderr, _thread|
        stdin.close_write

        while line = stdout.gets
          puts line
        end

        while line = stderr.gets
          puts line
        end
      end
    end

    def package_manager_command(engine)
      engine_path = gem_spec_set.find { |s| s.name == engine }&.full_gem_path

      return unless engine_path

      format(PACKAGE_MANAGER_COMMANDS[EnginePack.config.package_manager], engine_path: engine_path)
    end
  end
end
