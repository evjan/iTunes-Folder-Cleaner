$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "..", "lib")
require 'folder_cleaner'
require 'dir_handler'

Given /^an empty folder$/ do
  @path = create_folder("testfolder")
end

Given /^a folder with a "([^\"]*)" file in it$/ do |file_ending|
  @path = create_folder("testfolder")
  FileUtils.touch(File.join(@path, "test" + file_ending))
end

Given /^a folder with a folder with a "([^\"]*)" file in it$/ do |file_ending|
  @path = create_folder("testfolder")
  create_folder(File.join("testfolder", "testfolderlevel2"))
  FileUtils.touch(File.join(@path, "testfolderlevel2", "test" + file_ending))
end

When /^I clean it$/ do
  @dir_handler = DirHandler.new
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
  path = File.join(File.expand_path(File.dirname(__FILE__)),  folder_name)
  delete_folder(path)
  FileUtils.mkdir(path)
  path
end

def delete_folder(path)
  Dir.chdir()
  FileUtils.remove_dir(path) if File.directory? path  
end
