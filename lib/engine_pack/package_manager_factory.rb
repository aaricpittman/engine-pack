require_relative 'package_managers/npm'
require_relative 'package_managers/yarn'

module EnginePack
  class PackageManagerFactory
    class << self
      def build(name)
        case name
        when :npm then PackageManagers::Npm.new
        when :yarn then PackageManagers::Yarn.new
        end
      end
    end
  end
end
