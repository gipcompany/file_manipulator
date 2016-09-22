require "spec_helper"

module FileManipulator
  describe Merger do
    let(:merger) { Merger.new }

    let!(:dummy_txt) do
      path = File.join(Dir.pwd, 'spec/files/dummy.txt')
      File.new(path)
    end

    before do
      FileManipulator.configure do |config|
        config.file_name = dummy_txt.path
        config.split_files_directory = File.join(Dir.pwd, 'tmp')
        config.merged_file_directory = File.join(Dir.pwd, 'tmp')
        config.size = 1000
      end

      FileManipulator.split
    end

    after do
      Dir::glob(File.join(File.join(Dir.pwd, 'tmp'), "*")).each { |_| File.delete(_) }
    end

    it '#initialize' do
      expect(merger.config.class).to eq(Configuration)
    end

    it '#run' do
      merger.run
      expect(File.read(merger.config.file_name)).to eq(File.read(merger.merged_file))
    end
  end
end
