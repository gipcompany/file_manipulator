require "spec_helper"

module FileManipulator
  describe Splitter do
    let(:output_directory) { File.join(Dir.pwd, 'tmp') }
    let(:splitter) { Splitter.new }

    let!(:file) do
      path = File.join(Dir.pwd, 'tmp', "foo.txt")
      _ = File.new(path, 'w')
      _.write("123456789\n" * 1_000)
      _.rewind
      _
    end

    before do
      FileManipulator.configure do |config|
        config.prefix = 'file_manipulator'
        config.file_name = File.join(Dir.pwd, 'tmp', "foo.txt")
        config.output_directory = File.join(Dir.pwd, 'tmp')
        config.size = 10
      end
    end

    after do
      Dir::glob(File.join(output_directory, "file_manipulator_*")).each { |_| File.delete(_) }
      File.delete(FileManipulator.configuration.file_name)
    end

    it '#initialize' do
      expect(splitter.config.class).to eq(Configuration)
    end

    it '#run' do
      count = Dir.entries('tmp').count
      splitter.run
      count_diff = Dir.entries('tmp').count - count
      expect(count_diff).to eq(1000)
    end

    it '#basename' do
      expect(splitter.send(:basename)).to eq('foo')
    end

    it '#extname' do
      expect(splitter.send(:extname)).to eq('txt')
    end

    it '#file_name' do
      expect(splitter.send(:file_name)).to eq(file.path)
    end

    it '#number_of_digits' do
      expect(splitter.send(:number_of_digits)).to eq(4)
    end

    it '#output_file_name, with extension' do
      index = 1
      expect(splitter.send(:output_file_name, index)).to eq("file_manipulator_foo_000#{index}.txt")
    end

    it '#output_file_name, with no extension' do
      basename = File.basename(splitter.config.file_name, '.txt')
      filename = File.join(Dir.pwd, 'tmp', basename)
      FileUtils.mv(splitter.config.file_name, filename)
      splitter.config.file_name = filename
      index = 1
      expect(splitter.send(:output_file_name, index)).to eq("file_manipulator_foo_000#{index}")
    end

    it '#size' do
      expect(splitter.send(:size)).to eq(10)
    end
  end
end
