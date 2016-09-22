require "spec_helper"

module FileManipulator
  describe Configuration do
    it "has default values" do
      expect(subject.prefix).to eq('file_manipulator')
    end
  end
end
