module Authic
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      def copy_initializers
        template "authic.rb", "config/initializers/authic.rb"
        template "omniauth.rb", "config/initializers/omniauth.rb"
        template "sessions_controller.rb", "app/controllers/authic/sessions_controller.rb"
      end

    end
  end
end