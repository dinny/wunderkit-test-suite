Feature: Test wunderkit signup
  In order to know that users could sign up a new wunderkit account
  As a new user
  I want it to behave in an expected way

  Scenario: Sign up using a valid email
    Given I open the login page
    And I click the sign up button
    And I fill in a valid email
    And I fill in other info
    When I click the create-account button
    Then the output should contain a formal greeting
    Then I log out

  Scenario: Sign up using a registered email
    Given I open the login page
    And I click the sign up button
    And I fill in an already-taken email
    And I fill in other info
    When I click the create-account button
    Then the output should contain an already-registered error

  Scenario: Sign up using an invalid email
    Given I open the login page
    And I click the sign up button
    And I fill in an invalid email
    And I fill in other info
    When I click the create-account button
    Then the output should contain an invalid-email error
