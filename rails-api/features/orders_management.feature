Feature: Orders Management

e.t.

Background:
  Given there are 3 possible roles

Scenario: Shop owner accept an order

  A shop owner should be able to accept an order

  Given I am a shop owner
  And I am logged in
  And I own 2 shops
  And there are 5 meals for my shop 1
  And there are 3 orders for my shop 1
  And I visit 'orders' page
  When I accept order 2
  Then I should see order 2 with status "preparing"

Scenario: Shop owner reject an order

  A shop owner should be able to reject an order

  Given I am a shop owner
  And I am logged in
  And I own 2 shops
  And there are 5 meals for my shop 1
  And there are 3 orders for my shop 1
  And I visit 'orders' page
  When I reject order 2
  Then I should not see order 2

Scenario: Shop owner finish preparing an order

  A shop owner have to update order status to prepared

  Given I am a shop owner
  And I am logged in
  And I own 2 shops
  And there are 5 meals for my shop 1
  And there are 3 orders for my shop 1
  And order 2 have status "preparing"
  And I visit 'orders' page
  When I finish preparing order 2
  Then I should see order 2 with status "prepared"

Scenario: Customer receive an order

  If the order is ready, the customer has to go to the shop and receive the meal

  Given I am an user
  And I am logged in
  And there are 2 shops
  And there are 5 meals for shop 1
  And I have ordered meal 2
  And order 1 have status "prepared"
  And I visit 'orders' page
  When I finish preparing order 2
  Then I should see order 2 with status "prepared"
