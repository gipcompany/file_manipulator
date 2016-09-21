require "file_manipulator/splitter"
require "file_manipulator/merger"
require "file_manipulator/configuration"
require "file_manipulator/version"

module FileManipulator
  class << self
    attr_accessor :configuration

    def configure
      @configuration ||= Configuration.new
      yield(configuration)
    end

    def reset
      @configuration = Configuration.new
    end

    def split
      Splitter.new.run
    end

    def merge
      Merger.new.run
    end
  end
end
