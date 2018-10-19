Feature: User

e.t.

Scenario: User signup success

  The user should be able to signup

  Given I am a new user
  When I visit root page
  Then I should be on the "users sign_in" page
  When I click "Sign up" link
  Then I should be on the "users sign_up" page
  And I fill in my information
  When I click "Sign up" button
  Then I should be on the root page
  And I should see "Meals"

Scenario: User signup fail

  The user should not be able to signup if their information are invalid

  Given there are 1 users
  And I am a new user
  When I visit root page
  Then I should be on the "users sign_in" page
  When I click "Sign up" link
  Then I should be on the "users sign_up" page
  And I fill in email incorrectly
  When I click "Sign up" button
  Then I should see "Email has already been taken"
