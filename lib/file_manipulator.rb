require "file_manipulator/splitter"
require "file_manipulator/merger"
require "file_manipulator/configuration"
require "file_manipulator/version"

module FileManipulator
  class << self
    attr_accessor :configuration

    def configure
      yield(@configuration ||= Configuration.new)
      FileUtils.mkdir_p(configuration.split_files_directory)
      FileUtils.mkdir_p(configuration.merged_file_directory)
    end

    def merge
      Merger.new.run
    end

    def split
      Splitter.new.run
    end
  end
end
