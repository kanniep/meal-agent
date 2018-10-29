Feature: Shop Owner

e.t.

Scenario: Customer create a shop

  A customer should be able create their own shop

  Given there are 3 possible roles
  And I am an user
  And I am logged in
  And I want to create a shop
  When I visit root page
  When I click "New shop" link
  Then I should be on the "shops new" page
  And I fill in shop information
  When I click "Create Shop" button
  Then I should be on the "shops" page
  And I should see the shop
