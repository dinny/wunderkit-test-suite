Feature: Test wunderkit logins
  In order to know that users could login wunderkit
  As a user
  I want it to behave in an expected way

  Scenario: Login using a valid username/password pair
    Given I open the login page
    And I fill in a valid username/password pair
    When I click the login button
    Then the output should contain a formal greeting
    Then I log out

  Scenario: Login using an invalid username/password pair
    Given I open the login page
    And I fill in an invalid username/password pair
    When I click the login button
    Then the output should contain an invalid-credential error
    Then I log out
