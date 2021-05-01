# frozen_string_literal: true

require 'rails/generators/named_base'

module EnginePack
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __dir__)

      desc 'Generates configuration for EnginePack.'

      class_option :package_manager,
                   desc: 'Specify the JavaScript package manager to configure. (yarn, npm)',
                   type: :string,
                   default: 'npm'

      def copy_initializer
        template 'initializer.rb', 'config/initializers/engine_pack.rb'
      end

      def show_post_install
        readme 'POST_INSTAll'
      end
    end
  end
end
