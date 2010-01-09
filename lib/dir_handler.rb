class DirHandler
  def delete(path)
    Dir.chdir()
    FileUtils.remove_dir(path)
  end

  def find_mp3_files(path)
    Dir.chdir(path)
    mp3_files_recursively = File.join("**", "*.mp3")
    Dir.glob(mp3_files_recursively)
  end
end
