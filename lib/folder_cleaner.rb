module FolderCleaner
  def self.Clean(path, dir_handler)
    mp3_files = dir_handler.find_mp3_files(path)
    if(mp3_files.size == 0)
      dir_handler.delete(path)
    end
  end
end
