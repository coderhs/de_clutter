module DeClutter
  class ToOrganizeFolder
    def initialize(path)
      @path = path
      files
    end

    attr_accessor :path

    def files
      @files ||= Dir.glob("#{path}/*").select { File.file?(_1) }.map { ToOrganizeFile.new(path: _1) }
    end
  end
end
