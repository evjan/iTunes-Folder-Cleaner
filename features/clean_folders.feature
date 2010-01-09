Feature: Clean Folders

  When I have a lot of empty music folders that iTunes couldn't clean up for me
  Then those folders and their contents should be deleted

  Scenario: Remove a folder with no mp3's in it
    Given an empty folder
    When I clean it
    Then it should be removed