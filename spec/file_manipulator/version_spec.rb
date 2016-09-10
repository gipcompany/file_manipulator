require "spec_helper"

module FileManipulator
  describe VERSION do
    it "has a version number" do
      expect(VERSION).not_to be nil
    end
  end
end
