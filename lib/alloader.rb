require "alloader/version"

module Alloader

  class << self

    def load_dir(dirpath)
      load_filepaths(filepaths_in_dir(dirpath))
    end

    def require_dir(dirpath)
      require_filepaths(filepaths_in_dir(dirpath))
    end

    private

    # ----------------------------------------

    def is_dir(path)
      FileTest::directory?(path)
    end

    def filepaths_in_dir(dirpath)
      filelist = (Dir::entries(dirpath) - [".", ".."]).map { |file|
        File::expand_path(dirpath + "/" + file)
      }
      dirpaths = filter(method(:is_dir), filelist)
      filepaths_in_dirpaths = dirpaths.inject([]) { |acc, dirpath|
        acc + filepaths_in_dir(dirpath)
      }

      filelist - dirpaths + filepaths_in_dirpaths
    end

    def require_filepaths(filepaths)
      result = {}
      filepaths.each do |filepath|
        result[filepath] = require filepath
      end
      result
    end

    def load_filepaths(filepaths)
      result = {}
      filepaths.each do |filepath|
        result[filepath] = load filepath
      end
      result
    end

    # ----------------------------------------

    def filter(pred, lst)
      lst.select { |itm| pred.(itm) }
    end

  end

end
