module FolderCleaner
  def self.Clean(dir, dir_deleter)
    path = dir.path
    dir_deleter.delete(path)
  end
end
