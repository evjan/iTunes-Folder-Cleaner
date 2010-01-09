require 'rubygems'
gem 'rspec'
require 'folder_cleaner'

describe FolderCleaner do
  before :each do
    @path = "dirpath"
    @dir_handler = mock("dir_handler").as_null_object
  end
  
  it "should remove an empty folder" do
    set_directory_contents(@path, @dir_handler, [])
    @dir_handler.should_receive(:delete).with(@path)
    
    FolderCleaner.Clean(@path, @dir_handler)
  end

  it "should keep a folder with an mp3 file in it" do
    set_directory_contents(@path, @dir_handler, ["test.mp3"])
    @dir_handler.should_not_receive(:delete)
    
    FolderCleaner.Clean(@path, @dir_handler)
  end

  def set_directory_contents(dir, dir_handler, contents)
     dir_handler.should_receive(:find_mp3_files).with(dir).and_return(contents)
  end
end
