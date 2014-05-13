require "alloader/version"

module Alloader

  class << self

    def require_all(dirpath, mode = :require)
      case mode
      when :require
        filelist_in(dirpath).each do |f|
          require f
        end
      when :load
        filelist_in(dirpath).each do |f|
          load f
        end
      end
    end

    def r
      load caller_head
    end

    private

    def caller_files
      caller.map { |str| File::expand_path(str.split(":")[0]) }
    end

    def caller_head
      caller_files[-1]
    end

    def filelist_in(dir_path)
      list = (Dir::entries(dir_path) - [".", "..", $0]).map {|path|
        File::expand_path(dir_path) + "/" + path
	    } - caller_files
      dirs = list.select { |x| FileTest::directory?(x) }
      files = list - dirs
      files_in_dirs = dirs.inject([]) { |acc, dir| acc + filelist_in(dir) }

      files + files_in_dirs
    end

  end

end
