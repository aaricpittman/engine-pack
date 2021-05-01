require 'json'

module EnginePack
  class PackageConfig
    attr_reader :path

    def initialize(package_path)
      @path = package_path

      raise ArgumentError, "#{package_path} does not have a package.json file." unless File.exist?(config_path)

      @config = JSON.parse(File.read(config_path))
    end

    def package_files_paths
      specified_files.map { |f| "#{path}/#{f}" }.tap do |paths|
        paths << config_path unless paths.include?(config_path)
      end
    end

    private

    attr_reader :config

    def config_path
      "#{path}/package.json"
    end

    def specified_files
      config.fetch('files', [])
    end
  end
end
