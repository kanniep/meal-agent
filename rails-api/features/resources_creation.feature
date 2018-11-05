Feature: Resources Creation

e.t.

Background:
  Given there are 3 possible roles

Scenario: Customer create a shop

  A customer should be able create their own shop

  Given I am an user
  And I am logged in
  And I want to create a shop
  When I visit root page
  When I click "New shop" link
  Then I should be on the "shops new" page
  And I fill in shop information
  When I click "Create Shop" button
  And I should see details of the shop


Scenario: Shop owner create a meal

  A shop owner should be able create a meal for their shop

  Given I am a shop owner
  And I am logged in
  And I own 2 shops
  And I want to create a meal for my shop 1
  When I visit "shops" page
  And I select my shop 1
  When I click "New Meal" link
  Then I should be on the "shops 1 meals new" page
  And I fill in meal information
  When I click "Create Meal" button
  And I should see details of the meal


Scenario: Customer make an order

  A customer should be able make an order for a meal

  Given I am an user
  And I am logged in
  And there are 3 meals
  And I visit "meals" page
  When I make an order for meal 2
  Then I should be on the "orders" page
  And I should see order for meal 2
