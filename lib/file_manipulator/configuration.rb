module FileManipulator
  class Configuration
    attr_accessor :prefix, :file_name, :split_files_directory, :merged_file_directory, :size

    def initialize
      @prefix ||= 'file_manipulator'
      @split_files_directory = 'tmp'
      @merged_file_directory = 'tmp'
      @size ||= 10_485_760
    end

    def directories
      [split_files_directory, merged_file_directory]
    end
  end
end
