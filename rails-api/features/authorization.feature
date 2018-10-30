Feature: User Authoriztion

e.t.

Scenario: Customer can see meals details

  A customer should be able explore meals information

  Given there are 3 possible roles
  And I am an user
  And I am logged in
  And there are 3 meals
  When I visit root page
  And I select meal 2
  Then I should see details of meal 2

Scenario: Customer cannot edit meals

  A customer should not be able to edit any meals

  Given there are 3 possible roles
  And I am an user
  And I am logged in
  And there are 3 meals
  When I try to edit meal 2
  Then I should see "You are not authorized!"

Scenario: Customer cannot create meals

  A customer should not be able to create any meals

  Given there are 3 possible roles
  And I am an user
  And I am logged in
  And I want to create a meal
  When I try to create a meal
  Then I should see "You are not authorized!"

Scenario: Customer cannot delete meals

  A customer should not be able to delete any meals

  Given there are 3 possible roles
  And I am an user
  And I am logged in
  And there are 3 meals
  When I try to delete meal 2
  Then I should see "You are not authorized!"

Scenario: Customer cannot see shops

  A customer should not be able to see any shops details

  Given there are 3 possible roles
  And I am an user
  And I am logged in
  And there are 3 shops
  When I visit "shops" page
  Then I should see "You are not authorized!"
  When I try to select shop 2
  Then I should see "You are not authorized!"

Scenario: Customer cannot edit shops

  A customer should not be able to edit any shops

  Given there are 3 possible roles
  And I am an user
  And I am logged in
  And there are 3 shops
  When I try to edit shop 2
  Then I should see "You are not authorized!"

Scenario: Customer cannot create shops

  A customer should not be able to create any shops

  Given there are 3 possible roles
  And I am an user
  And I am logged in
  And I want to create a shop
  When I try to create a shop
  Then I should see "You are not authorized!"

Scenario: Customer cannot delete shops

  A customer should not be able to delete any shops

  Given there are 3 possible roles
  And I am an user
  And I am logged in
  And there are 3 shops
  When I try to delete shop 2
  Then I should see "You are not authorized!"
