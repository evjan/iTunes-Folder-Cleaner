$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "..", "lib")
require 'folder_cleaner'
require 'dir_deleter'

Given /^an empty folder$/ do
  Dir.delete("testfolder") if File.directory? "testfolder"
  Dir.mkdir("testfolder")
  @dir = Dir.new("testfolder")
  @dir_deleter = DirDeleter.new
end

When /^I clean it$/ do
  FolderCleaner.Clean(@dir, @dir_deleter)
end

Then /^it should be removed$/ do
  (File.directory? "testfolder").should == false
end
