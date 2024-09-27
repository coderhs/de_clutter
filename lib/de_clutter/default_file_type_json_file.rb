# frozen_string_literal: true
#
module DeClutter
  class DefaultFileTypeJsonFile
    def self.[](key)
      @initialize ||= new
      @initialize.data[key] || 'unknown'
    end

    def initialize
      @data = JSON.parse(File.read('./data/file_type.json'))
    end

    attr_accessor :data
  end
end
