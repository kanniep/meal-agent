Given('I want to create a shop') do
  @shop = FactoryBot.build :shop
end

Given('I am a shop owner') do
  @user = FactoryBot.create :shop_owner
end

Given(/^I own (\d+) shops$/) do |num_shops|
  @my_shops = []
  num_shops.to_i.times do
    shop = FactoryBot.create :shop, user: @user
    @my_shops.append(shop)
  end
end

Given(/^there are (\d+) shop owners$/) do |num_shop_owner|
  @users = []
  num_shop_owner.to_i.times do
    user = FactoryBot.create :shop_owner
    @users.append(user)
  end
end

Given(/^there are (\d+) shops$/) do |num_shops|
  user = FactoryBot.create :shop_owner
  @shops = []
  num_shops.to_i.times do
    shop = FactoryBot.create :shop, user: user
    @shops.append(shop)
  end
end

Given(/^there are (\d+) meals for shop (\d+)$/) do |num_meal, shop_num|
  shop = @shops[shop_num - 1]
  @my_meals = []
  num_meal.to_i.times do
    meal = FactoryBot.create :meal, shop: shop
    @my_meals.append(meal)
  end
end

Given(/^there are (\d+) meals for my shop (\d+)$/) do |num_meal, shop_num|
  shop = @my_shops[shop_num - 1]
  @my_meals = []
  num_meal.to_i.times do
    meal = FactoryBot.create :meal, shop: shop
    @my_meals.append(meal)
  end
end

Given(/^there are (\d+) shops for shop owner (\d+)$/) do |num_shop, shop_owner_num|
  user = @users[shop_owner_num - 1]
  @shops = []
  num_shop.to_i.times do
    shop = FactoryBot.create :shop, user: user
    @shops.append(shop)
  end
end

And('I fill in shop information') do
  fill_in 'Name', with: @shop.name
  fill_in 'Location', with: @shop.location
  fill_in 'Description', with: @shop.description
end

Then('I should see details of the shop') do
  expect(page).to have_content @shop.name
  expect(page).to have_content @shop.location
  expect(page).to have_content @shop.description
end

And(/^I select shop (\d+)$/) do |shop_num|
  find_all('td a', text: 'Edit').at(shop_num - 1).click
end

And(/^I select my shop (\d+)$/) do |shop_num|
  find('tr', text: @my_shops[shop_num - 1].name).find('td a', text: 'Edit').click
end

When(/^I try to select shop (\d+)$/) do |shop_num|
  shop = @shops[shop_num - 1]
  visit "/shops/#{shop.id}"
end

When(/^I try to edit shop (\d+)$/) do |shop_num|
  shop = @shops[shop_num - 1]
  visit "/shops/#{shop.id}/edit"
end

When('I try to create a shop') do
  visit "/shops/new"
end

Then("I should see details of my shops") do
  @my_shops.each do |shop|
    expect(page).to have_content shop.name
  end
end

Then("I should see details of shops") do
  @shops.each do |shop|
    expect(page).to have_content shop.name
  end
end

Then("I should not see details of shops") do
  @shops.each do |shop|
    expect(page).not_to have_content shop.name
  end
end
