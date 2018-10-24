Feature: Admin

e.t.

Scenario: Admin look at registered users

  The admin should be able to see registered users

  Given there are 3 possible roles
  And there are 2 customers
  And I am an admin
  And I am logged in
  When I visit "admin user" page
  Then I should see multiple users
  And I should see "3 users"

Scenario: Admin ban a user

  The admin should be able to bad a registered user

  Given there are 3 possible roles
  And there are 2 customers
  And I am an admin
  And I am logged in
  And I visit "admin user" page
  When I ban customer number 1
  Then I should see user number 1 is baned
  And I should see user number 2 is not baned
