Feature: User

e.t.

Scenario: User signup success

  The user should be able to signup

  Given I am a new user
  And I visit registration page
  And I fill in my information
  When I click "submit" button
  Then I should be in meals page

Scenario: User signup fail

  The user should not be able to signup if their information are invalid

  Given I am a new user
  And I visit registration page
  And I fill in email incorrectly
  When I click "submit" button
  Then I should be in signup page
  And I should see "Invalid email"
