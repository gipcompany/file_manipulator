module FileManipulator
  class Splitter
    attr_accessor :file_name, :output_directory, :size

    def initialize(file_name, output_directory, size = 10_485_760)
      @file_name = file_name
      @output_directory = output_directory
      @size = size
    end

    def run
      index = 0

      File.open(file_name, 'r') do |input|
        until input.eof?
          File.open(File.join(output_directory, output_file_name(index)), 'w') do |output|
            line = ""

            while output.size <= (size - line.length) && !input.eof?
              line = input.readline
              output << line
            end
          end

          index += 1
        end
      end
    end

    private

    def basename
      File.basename(file_name, File.extname(file_name))
    end

    def extname
      File.extname(file_name).delete('.')
    end

    def number_of_digits
      @number_of_digits ||= Math.log10(File.size(file_name).to_f / size).ceil + 1
    end

    def output_file_name(index)
      output_file_basename = sprintf("#{basename}_%0#{number_of_digits}d", index)

      extname == '' ? output_file_basename : "#{output_file_basename}.#{extname}"
    end
  end
end
