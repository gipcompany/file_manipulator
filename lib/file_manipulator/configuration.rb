module FileManipulator
  class Configuration
    attr_accessor :prefix, :file_name, :split_files_directory, :merged_file_directory, :size

    def initialize
      @prefix ||= 'file_manipulator'
    end
  end
end
