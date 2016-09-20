require "spec_helper"

describe FileManipulator do
  let(:files) { Dir.entries('tmp') - [".", "..", ".keep"] }

  after do
    files.each do |_|
      File.delete(File.join('tmp', _))
    end
  end

  describe 'class methods' do
    before do
      FileManipulator.configure do |config|
        config.prefix = 'file_manipulator'
        config.file_name = 'LICENSE.txt'
        config.split_file_directory = 'tmp'
        config.size = 1
      end
    end

    it ".configuration" do
      configuration = FileManipulator.configuration

      expect(configuration.file_name).to eq('LICENSE.txt')
      expect(configuration.split_file_directory).to eq('tmp')
      expect(configuration.size).to eq(1)
    end

    it ".reset" do
      configuration = FileManipulator.reset

      expect(configuration.file_name).to eq(nil)
      expect(configuration.split_file_directory).to eq(nil)
      expect(configuration.size).to eq(nil)
    end

    it ".split" do
      FileManipulator.split
      splitted_files = Dir.glob("tmp/*.txt")
      expect(splitted_files).not_to eq([])
    end
  end
end
