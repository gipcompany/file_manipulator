module FileManipulator
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def copy_initializer(destination_path = 'config/initializers/file_manipulator.rb')
        copy_file 'initializer.rb', destination_path
      end
    end
  end
end
