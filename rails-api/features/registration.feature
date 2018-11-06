Feature: User Registration and Login

e.t.

Background:
  Given there are 3 possible roles

Scenario: User signup and signin with google

  The user should be able to signup

  Given I am a new user
  When I visit root page
  Then I should be on the "users sign_in" page
  When I click "Sign in with Google" link
  Then I should be on the root page
  And I should see my information
  And I should see "Meals"

Scenario: User got banned

  The user should not be able to signin if they got banned

  Given I am an user
  And I got banned
  When I visit root page
  Then I should be on the "users sign_in" page
  When I click "Sign in with Google" link
  Then I should see "You got banned"
