require "file_manipulator/splitter"
require "file_manipulator/configuration"
require "file_manipulator/version"

module FileManipulator
  class << self
    attr_accessor :configuration
  end

  def self.configure
    @configuration ||= Configuration.new
    yield(configuration)
  end

  def self.reset
    @configuration = Configuration.new
  end

  module_function

  def split(file_name, output_directory, size)
    Splitter.new(file_name, output_directory, size).run
  end
end
