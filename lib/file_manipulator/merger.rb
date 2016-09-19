module FileManipulator
  class Merger
    attr_reader :config

    def initialize(config = FileManipulator.configuration)
      @config = config
    end

    def run
    end
  end
end
