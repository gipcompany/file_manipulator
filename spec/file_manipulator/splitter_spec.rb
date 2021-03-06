require "spec_helper"

module FileManipulator
  describe Splitter do
    let(:splitter) { Splitter.new }

    let!(:dummy_txt) do
      path = File.join(Dir.pwd, 'spec/files/dummy.txt')
      File.new(path)
    end

    before do
      FileManipulator.configure do |config|
        config.file_name = dummy_txt.path
        config.split_files_directory = File.join(Dir.pwd, 'tmp')
        config.size = 10
      end
    end

    after do
      Dir::glob(File.join(File.join(Dir.pwd, 'tmp'), "file_manipulator_*")).each { |_| File.delete(_) }
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
      expect(splitter.send(:basename)).to eq('dummy')
    end

    it '#extname' do
      expect(splitter.send(:extname)).to eq('txt')
    end

    it '#file_name' do
      expect(splitter.send(:file_name)).to eq(dummy_txt.path)
    end

    it '#number_of_digits' do
      expect(splitter.send(:number_of_digits)).to eq(4)
    end

    it '#output_file_name, with extension' do
      index = 1
      expect(splitter.send(:output_file_name, index)).to eq("file_manipulator_dummy_000#{index}.txt")
    end

    it '#output_file_name, with no extension' do
      splitter.config.file_name = File.join(Dir.pwd, 'spec/files/dummy')
      index = 1
      expect(splitter.send(:output_file_name, index)).to eq("file_manipulator_dummy_000#{index}")
    end

    it 'When size in config is too larger than one of the file, split file name for index 0 should suffixed with _0.' do
      splitter.config.size = 10485760
      index = 0
      expect(splitter.send(:output_file_name, index)).to eq("file_manipulator_dummy_#{index}.txt")
    end
  end
end
