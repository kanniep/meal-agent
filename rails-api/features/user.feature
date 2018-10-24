Feature: User

e.t.

Scenario: User signup success

  The user should be able to signup

  Given there are 3 possible roles
  And I am a new user
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

  Given there are 3 possible roles
  And there are 1 users
  And I am a new user
  When I visit root page
  Then I should be on the "users sign_in" page
  When I click "Sign up" link
  Then I should be on the "users sign_up" page
  And I fill in an existing email
  When I click "Sign up" button
  Then I should see "Email has already been taken"

Scenario: User signin success

  The user should be able to signin

  Given there are 3 possible roles
  And I am an user
  When I visit root page
  Then I should be on the "users sign_in" page
  And I fill in my email and password
  When I click "Log in" button
  Then I should be on the root page
  And I should see "Meals"

Scenario: User signin fail

  The user should not be able to signin if their information are invalid

  Given there are 3 possible roles
  And I am an user
  When I visit root page
  Then I should be on the "users sign_in" page
  And I fill in wrong password
  When I click "Log in" button
  Then I should see "Invalid Email or password"

Scenario: User got banned

  The user should not be able to signin if they got banned

  Given there are 3 possible roles
  And I am an user
  And I got banned
  When I visit root page
  Then I should be on the "users sign_in" page
  And I fill in my email and password
  When I click "Log in" button
  Then I should see "You got banned"
