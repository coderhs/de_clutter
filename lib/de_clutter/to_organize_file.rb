# frozen_string_literal: true
require_relative './default_file_extension_json_file'
require_relative './default_file_type_json_file'

module DeClutter
  class ToOrganizeFile < OpenStruct
    def initialize(...)
      super(...)
      populate_data
    end

    def populate_data
      self.name = File.basename(path)
      self.extension = File.extname(path).to_s
      self.type = MimeMagic.by_extension(extension)&.type.to_s
      self.size = File.size(path)
      self.type_head = type.split('/')&.first
      self.size_mb = (file_size.to_f / 1_048_576).round(2)
      self.creation_time = File.ctime(path)
      self.modification_time = File.mtime(path)
      self.access_time = File.atime(path)
      self.classifier = DeClutter::DefaultFileTypeJsonFile[type]
      if classifier.eql?('others') || classifier.nil? || classifier.eql?('')
        self.classifier = DeClutter::DefaultFileExtensionJsonFile[extension]
      end
    end
  end
end
