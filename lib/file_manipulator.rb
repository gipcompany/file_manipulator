require "file_manipulator/splitter"
require "file_manipulator/merger"
require "file_manipulator/configuration"
require "file_manipulator/version"

module FileManipulator
  class << self
    attr_accessor :configuration

    def configure
      yield(@configuration ||= Configuration.new)
    end

    def merge
      Merger.new.run
    end

    def reset
      @configuration = Configuration.new
    end

    def split
      Splitter.new.run
    end
  end
end
