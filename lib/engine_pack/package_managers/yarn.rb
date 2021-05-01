module EnginePack
  module PackageManagers
    class Yarn
      INSTALL_COMMAND = 'yarn add file:%<engine_path>s'.freeze

      def install_command(engine_path)
        format(INSTALL_COMMAND, engine_path: engine_path)
      end
    end
  end
end
