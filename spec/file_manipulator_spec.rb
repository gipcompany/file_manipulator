require "spec_helper"

describe FileManipulator do
  let(:files) { Dir.entries('tmp') - [".", "..", ".keep"] }

  after do
    files.each do |_|
      File.delete(File.join('tmp', _))
    end
  end

  it "#split" do
    file_name = 'Gemfile.lock'
    FileManipulator.split(file_name, 'tmp', 1)
    count = File.foreach(file_name).inject(0) { |_count| _count + 1 }
    expect(files.count).to eq(count)
  end
end
