module FileManipulator
  class Merger
    attr_reader :config

    def initialize(config = FileManipulator.configuration)
      @config = config
    end

    def run
      string_io = StringIO.new

      Dir.glob("#{config.split_files_directory}/#{prefix}_*").sort.each do |file|
        string_io.write File.read(file)
      end

      File.write(merged_file, string_io.string)
    end

    def merged_file
      sample_split_file = Dir.glob("#{config.split_files_directory}/#{prefix}_*").first
      basename = File.basename(sample_split_file)
      extname = File.extname(sample_split_file)
      basename = basename.sub(/^#{prefix}_/, '').sub(/#{extname}$/, '').sub(/_\d*$/, '')
      File.join(config.merged_file_directory, "#{basename}#{extname}")
    end

    private

    def prefix
      config.prefix
    end
  end
end
