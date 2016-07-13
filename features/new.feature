Feature: Addressbook - Left Panel fuc

  Background: Login to system
#    Given I want to maximize the windows of browser
    Given As Admin User, Nav "username" and "password"
    Given Wait until the Application is ready
    And I wait for 10 seconds

  #TODO: Addressbook Left Panel Test Coverage
  #TODO: ACTIVITY TAB

  Scenario: As Admin, Create Activity -> Meeting
    Given I wait for 5 seconds
    And I click on Contacts Tab
    And I wait for 5 seconds
    And I create an activity with "Addressbook Demo Test Data - Meeting" in Details View
    And I click to Save button
    And I wait for 5 seconds

  Scenario: As Admin, Create Activity -> Call
    Given I wait for 5 seconds
    And I click on Contacts Tab
    And I wait for 5 seconds
    And I move to next contact address
    And I create an activity with "Addressbook Demo Test Data - Call" in Details View
    And I select activity type "Call"
    And I click to Save button
    And I wait for 5 seconds

  Scenario: As Admin, Create Activity -> Task
    Given I wait for 5 seconds
    And I click on Contacts Tab
    And I wait for 5 seconds
    And I move to next contact address
    And I create an activity with "Addressbook Demo Test Data - Task" in Details View
    And I select activity type "Task"
    And I click to Save button
    And I wait for 5 seconds