# frozen_string_literal: true
#
module DeClutter
  class DefaultFileExtensionJsonFile
    def self.[](key)
      @initialize ||= new
      @initialize.data[key] || 'others'
    end

    def initialize
      @data = JSON.parse(File.read("./data/file_extensions.json"))
    end

    attr_accessor :data
  end
end
