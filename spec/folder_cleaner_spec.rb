require 'rubygems'
gem 'rspec'
require 'folder_cleaner'

describe "FolderCleaner" do
  it "should remove an empty folder" do
    dir = mock("dir").as_null_object
    dir_deleter = mock("dir_deleter").as_null_object
    dir.should_receive(:path).and_return("dirname")
    dir_deleter.should_receive(:delete).with("dirname")
    FolderCleaner.Clean(dir, dir_deleter)
  end

  it "should keep a folder with an mp3 file in it" do
    dir = mock("dir")
    dir_deleter = mock("dir_deleter")
    dir.should_receive(:path).and_return("dirname")
    dir_deleter.should_not_receive(:delete)
    FolderCleaner.Clean(dir, dir_deleter)
  end
  
end
