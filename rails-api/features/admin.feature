Feature: Admin

e.t.

Scenario: Admin look at registered users

  The admin should be able to see registered users

  Given there are 2 users
  And I am an admin
  And I am logged in
  And I want to add a course offering
  When I visit users page
  Then I should see an user number 1
  And I should see an user number 2
  And I should see number of users is equal to 2

Scenario: Admin ban a user

  The instructor should be able to edit a course offering

  Given there are 2 customers
  And I am an admin
  And I am logged in
  When I ban customer number 1
  Then I should see user number 1 is baned
  And I should see user number 2 is not bane
