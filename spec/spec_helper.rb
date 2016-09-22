require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
SimpleCov.start

require 'pry'

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'file_manipulator'
