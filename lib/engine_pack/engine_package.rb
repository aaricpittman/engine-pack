require_relative 'adaptors/io'
require_relative 'package_config'

module EnginePack
  class EnginePackage
    def initialize(
      engine,
      io: Adaptors::IO.new,
      package_config: PackageConfig.new(EnginePack.gem_specs.find { |s| s.name == engine }&.full_gem_path)
    )
      @engine = engine
      @io = io
      @package_config = package_config
    end

    def with_path
      io.mkdir(path: tmp_path)
      copy_specified_files(tmp_path)

      yield tmp_path
    end

    private

    attr_reader :engine, :gem_specs, :io, :package_config

    def copy_specified_files(dir)
      io.copy_files(
        files: package_config.package_files_paths,
        to: dir
      )
    end

    def package_json?
      io.exist?(path: "#{engine_path}/package.json")
    end

    def tmp_path
      "#{io.tmpdir}/enginepack/#{engine}"
    end
  end
end
