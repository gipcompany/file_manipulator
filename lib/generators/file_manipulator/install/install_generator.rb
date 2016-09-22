module FileManipulator
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def copy_initializer_file
        copy_file "initializer.rb", "config/initializers/file_manipulator.rb"
      end
    end
  end
end
