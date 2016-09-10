require "file_manipulator/splitter"
require "file_manipulator/version"

module FileManipulator
  module_function

  def split(file_name, output_directory, size)
    Splitter.new(file_name, output_directory, size).run
  end
end
