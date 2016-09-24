require 'spec_helper'
require 'rails/generators'
require 'generators/file_manipulator/install/install_generator'

module FileManipulator
  module Generators
    describe InstallGenerator do
      after do
        FileUtils.rm_rf('tmp/config')
      end

      it '#copy_initializer_file' do
        subject.copy_initializer('tmp/config/initializers/file_manipulator.rb')
      end
    end
  end
end
