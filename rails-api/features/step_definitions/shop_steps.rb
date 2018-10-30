Given('I want to create a shop') do
  @shop = FactoryBot.build :shop
end

Given('I am a shop owner') do
  @user = FactoryBot.create :shop_owner
end

Given(/^I own (\d+) shops$/) do |num_shops|
  @shops = []
  num_shops.to_i.times do
    shop = FactoryBot.create :shop, user: @user
    @shops.append(shop)
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

When(/^I try to delete shop (\d+)$/) do |shop_num|
  shop = @shops[shop_num - 1]
  delete "/shops/#{shop.id}"
end
