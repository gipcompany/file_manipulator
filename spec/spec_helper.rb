require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
SimpleCov.start

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require 'rails/generators'

require 'file_manipulator'
require 'generators/file_manipulator/install/install_generator'
