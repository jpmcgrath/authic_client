module Authic
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      def copy_initializers
        template "authic.rb", "config/initializers/authic.rb"
        template "omniauth.rb", "config/initializers/omniauth.rb"
      end

    end
  end
end