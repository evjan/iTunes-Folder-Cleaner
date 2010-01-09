$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "..", "lib")
require 'folder_cleaner'
require 'dir_handler'

Given /^an empty folder$/ do
  @path = File.join(File.expand_path(File.dirname(__FILE__)),  "testfolder")
  Dir.delete(@path) if File.directory? @path
  Dir.mkdir(@path)
  @dir_handler = DirHandler.new
end

When /^I clean it$/ do
  FolderCleaner.Clean(@path, @dir_handler)
end

Then /^it should be removed$/ do
  (File.directory? @path).should == false
end
