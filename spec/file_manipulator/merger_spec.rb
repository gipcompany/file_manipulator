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
        config.prefix = 'file_manipulator'
        config.file_name = dummy_txt.path
        config.split_files_directory = File.join(Dir.pwd, 'tmp')
        config.size = 1000
      end
    end

    after do
      Dir::glob(File.join(File.join(Dir.pwd, 'tmp'), "file_manipulator_*")).each { |_| File.delete(_) }
    end

    it '#initialize' do
      expect(merger.config.class).to eq(Configuration)
    end
  end
end
