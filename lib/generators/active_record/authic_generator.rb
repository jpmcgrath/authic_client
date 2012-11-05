require 'rails/generators/active_record'
require 'generators/authic/orm_helpers'

module ActiveRecord
  module Generators
    class AuthicGenerator < ActiveRecord::Generators::Base
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"

      include Authic::Generators::OrmHelpers
      source_root File.expand_path("../templates", __FILE__)

      def copy_authic_migration
        if (behavior == :invoke && model_exists?) || (behavior == :revoke && migration_exists?(table_name))
          migration_template "migration_existing.rb", "db/migrate/add_authic_to_#{table_name}"
        else
          migration_template "migration.rb", "db/migrate/authic_create_#{table_name}"
        end
      end

      def generate_model
        invoke "active_record:model", [name], :migration => false unless model_exists? && behavior == :invoke
      end

      def inject_authic_content
        content = <<CONTENT
  include AuthicUserMixin
CONTENT

        class_path = if namespaced?
          class_name.to_s.split("::")
        else
          [class_name]
        end

        indent_depth = class_path.size - 1
        content = content.split("\n").map { |line| "  " * indent_depth + line } .join("\n") << "\n"

        inject_into_class(model_path, class_path.last, content) if model_exists?
      end

      def migration_data
<<RUBY
 
RUBY
      end
    end
  end
end