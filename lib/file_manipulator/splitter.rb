module FileManipulator
  class Splitter
    attr_reader :config

    def initialize(config = FileManipulator.configuration)
      @config = config
    end

    def run
      index = 0
      encoding = File.read(file_name).encoding.to_s

      File.open(file_name, 'r') do |input|
        until input.eof?
          File.open(File.join(config.split_files_directory, output_file_name(index)), 'w') do |output|
            output << input.read(config.size).force_encoding(encoding)
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

    def file_name
      config.file_name
    end

    def number_of_digits
      @number_of_digits ||= (File.size(file_name).to_f / config.size).ceil.to_s.size
    end

    def output_file_name(index)
      output_file_basename = sprintf("#{basename}_%0#{number_of_digits}d", index)
      output_file_basename = "#{prefix}_#{output_file_basename}" unless prefix == ''
      extname == '' ? output_file_basename : "#{output_file_basename}.#{extname}"
    end

    def prefix
      config.prefix
    end
  end
end
