require_relative './base'
require_relative '../to_organize_file'
require_relative '../to_organize_folder'

module DeClutter
  class OrganizeFolder < Base
    desc "Organize Folder ./de_clutter.rb organize_folder --help"

    argument :folder_path, required: true, desc: "Path to the folder"
    argument :prefix, required: false, desc: "prefix to new folders created"

    def call(folder_path:, prefix: nil, **options)
      folder_path = File.expand_path(folder_path)

      if !Dir.exist?(folder_path)
        exit_with_message("The file does not exist", 0)
      end

      to_organize_folder = ToOrganizeFolder.new(folder_path)
      sorted_data = to_organize_folder.files.group_by(&:classifier)

      new_folders = sorted_data.keys

      new_folders.each do |folder|
        new_folder_name = folder
        new_folder_name = "#{prefix}_#{folder}" if prefix
        new_folder_path = "#{folder_path}/#{new_folder_name}"
        FileUtils.mkdir_p(new_folder_path)
        sorted_data[folder].each do |file|
          puts "moving #{file.path} -> #{new_folder_path}"
          FileUtils.mv(file.path, new_folder_path)
        end
      end
    end
  end
end
