require "spec_helper"

describe FileManipulator do
  let(:files) { Dir.entries('tmp') - [".", "..", ".keep"] }

  after do
    files.each do |_|
      File.delete(File.join('tmp', _))
    end
  end

  describe '#configure' do
    before do
      FileManipulator.configure do |config|
        config.prefix = 'file_manipulator'
        config.file_name = 'Gemfile.lock'
        config.output_directory = 'tmp'
        config.size = 1
      end
    end

    it "configure can set the configuration values" do
      splitter = FileManipulator::Splitter.new

      expect(splitter.config.file_name).to eq('Gemfile.lock')
      expect(splitter.config.output_directory).to eq('tmp')
      expect(splitter.config.size).to eq(1)
    end
  end
end
