require "spec_helper"

describe FileManipulator do
  describe 'class methods' do
    let(:files) { Dir.entries('tmp') - [".", "..", ".keep"] }
    let!(:dummy_txt) do
      path = File.join(Dir.pwd, 'spec/files/dummy.txt')
      File.new(path)
    end
    let(:tmp_dir) { File.join(Dir.pwd, 'tmp') }

    after do
      files.each do |_|
        File.delete(File.join('tmp', _))
      end
    end

    before do
      FileManipulator.configure do |config|
        config.file_name = dummy_txt.path
        config.split_files_directory = tmp_dir
        config.merged_file_directory = tmp_dir
        config.size = 1000
      end
    end

    it ".configuration" do
      configuration = FileManipulator.configuration

      expect(configuration.file_name).to eq(dummy_txt.path)
      expect(configuration.split_files_directory).to eq(tmp_dir)
      expect(configuration.size).to eq(1000)
    end

    it ".split" do
      FileManipulator.split
      splitted_files = Dir.glob("tmp/*.txt")
      expect(splitted_files).not_to eq([])
    end

    it ".merge" do
      FileManipulator.split
      FileManipulator.merge
      expect(File.exist?('tmp/dummy.txt')).to eq(true)
      expect(dummy_txt.read).to eq(File.read('tmp/dummy.txt').to_s)
    end
  end
end
