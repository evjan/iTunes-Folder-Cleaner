Feature: Clean Folders

  When I have a lot of empty music folders that iTunes couldn't clean up for me
  Then those folders and their contents should be deleted

  Scenario: Remove an empty folder
    Given an empty folder
    When I clean it
    Then it should be removed

  Scenario: Keep a folder with an audio file in it
    Given a folder with an mp3 file in it
    When I clean it
    Then it should still be there