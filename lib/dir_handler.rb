class DirHandler
  def delete(path)
    Dir.chdir()
    FileUtils.remove_dir(path)
  end

  def find_mp3_files(path)
    Dir.chdir(path)
    Dir.glob("*.mp3")
  end
end
