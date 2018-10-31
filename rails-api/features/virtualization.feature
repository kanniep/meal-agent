Feature: Meals Virtualization

e.t.

Scenario: Shop owner see meals in their shop

  A shop owner be able too see meals in shop details page

  Given there are 3 possible roles
  And I am a shop owner
  And I am logged in
  And I own 2 shops
  And there are 3 meals for my shop 2
  When I visit "shops" page
  And I select shop 2
  Then I should see details of my meals

Scenario: Shop owner cannot see other shops

  A shop owner be able too see meals in shop details page

  Given there are 3 possible roles
  And I am a shop owner
  And there are 2 shop owners
  And I am logged in
  And I own 2 shops
  And there are 3 shops for shop owner 2
  When I visit "shops" page
  Then I should see details of my shops
  And I should not see details of shops
