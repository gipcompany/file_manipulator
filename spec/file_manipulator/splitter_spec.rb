require "spec_helper"

module FileManipulator
  describe Splitter do
    # one line
    let(:line) { "123456789\n" } # 10 bytes

    # basename
    let(:basename) { "foo" } # 10 bytes

    # extname
    let(:extname) { "txt" } # 10 bytes

    # tempfile
    let(:tempfile) do
      name = File.join(Dir.pwd, 'tmp', "#{basename}.#{extname}")
      File.new(name, 'w')
    end

    # small_file
    let(:small_content) { line } # 10 bytes
    let(:small_file) do
      tempfile.write(small_content)
      tempfile.rewind
      tempfile
    end

    # large_file
    let(:large_content) { line * 1_000 } # 10,000 bytes
    let(:large_file) do
      tempfile.write(large_content)
      tempfile.rewind
      tempfile
    end

    # output_directory
    let(:output_directory) { File.join(Dir.pwd, 'tmp') }

    # splitters
    let(:splitter_small_1) { Splitter.new(small_file.path, output_directory, 1) }
    let(:splitter_small_2) { Splitter.new(small_file.path, output_directory, 10) }
    let(:splitter_large_1) { Splitter.new(large_file.path, output_directory, 10) }
    let(:splitter_large_2) { Splitter.new(large_file.path, output_directory, 100) }

    after do
      Dir::glob(File.join(output_directory, "*.#{extname}")).each do |_file|
        File.delete(_file)
      end
    end

    it '#new' do
      expect(splitter_small_2.file_name).to eq(small_file.path)
      expect(splitter_small_2.output_directory).to eq(output_directory)
      expect(splitter_small_2.size).to eq(10)
    end

    describe '#run' do
      it 'small_1' do
        splitter_small_1.run
      end

      it 'small_2' do
        splitter_small_2.run
      end

      it 'large_1' do
        splitter_large_1.run
      end

      it 'large_2' do
        splitter_large_2.run
      end
    end

    it '#basename' do
      expect(splitter_small_1.send(:basename)).to eq(basename)
    end

    it '#extname' do
      expect(splitter_small_1.send(:extname)).to eq(extname)
    end

    it '#number_of_digits' do
      expect(splitter_small_1.send(:number_of_digits)).to eq(2)
      expect(splitter_large_1.send(:number_of_digits)).to eq(4)
    end

    it '#output_file_name' do
      index = 1
      expect(splitter_small_1.send(:output_file_name, index)).to eq("foo_0#{index}.txt")
    end
  end
end
