$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "..", "lib")
require 'folder_cleaner'
require 'dir_handler'

Given /^an empty folder$/ do
  @path = create_folder("testfolder")
  @dir_handler = DirHandler.new
end

Given /^a folder with an mp3 file in it$/ do
  @path = create_folder("testfolder")
  FileUtils.touch(File.join(@path, "test.mp3"))
  @dir_handler = DirHandler.new
end

When /^I clean it$/ do
  FolderCleaner.Clean(@path, @dir_handler)
end

Then /^it should be removed$/ do
  (File.directory? @path).should == false
end

Then /^it should still be there$/ do
  (File.directory? @path).should == true
  
  #clean up afterwards
  delete_folder(@path)
end

def create_folder(folder_name)
  @path = File.join(File.expand_path(File.dirname(__FILE__)),  folder_name)
  delete_folder(@path)
  FileUtils.mkdir(@path)
  @path
end

def delete_folder(path)
  Dir.chdir()
  FileUtils.remove_dir(path) if File.directory? path  
end
