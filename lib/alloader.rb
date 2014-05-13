#require "alloader/version"

module Alloader

  def required_from; $0 end

  def is_directory(path)
    FileTest::directory?(path)
  end

  def filelist_in(dir_path)
    list = (Dir::entries(dir_path) - [".", "..", required_from]).map {|path|
      File::expand_path(dir_path) + "/" + path
	  }
    dirs = list.select { |x| FileTest::directory?(x) }
    files = list - dirs
    files_in_dirs = dirs.inject([]) { |acc, dir| acc + filelist_in(dir) }

    files + files_in_dirs
  end

  def require_dir(dirpath, mode = :require)
    case mode
    when :require
      filelist_in(dirpath).each do |path|
        require path
      end
    when :load
      filelist_in(dirpath).each do |path|
        load path
      end
    end
  end

  def r; load required_from end

  module_function :require_dir, :r

end
