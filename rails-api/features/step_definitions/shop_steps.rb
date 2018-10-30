Given("I want to create a shop") do
  @shop = FactoryBot.build :shop
end

Given("I am a shop owner") do
  @user = FactoryBot.create :shop_owner
end

Given(/^I own (\d+) shops$/) do |num_shops|
  @shops = []
  num_shops.to_i.times do
    shop = FactoryBot.create :shop, user: @user
    @shops.append(shop)
  end
end

Given(/^I want to create a meal for shop (\d+)$/) do |shop_num|
  @meal = FactoryBot.build :meal, shop: @shops[shop_num - 1]
end

And("I fill in shop information") do
  fill_in 'Name', with: @shop.name
  fill_in 'Location', with: @shop.location
  fill_in 'Description', with: @shop.description
end

And("I fill in meal information") do
  fill_in 'Name', with: @meal.name
  fill_in 'Meal type', with: @meal.meal_type
  fill_in 'Price', with: @meal.price
  fill_in 'Description', with: @meal.description
end

Then("I should see details of the shop") do
  expect(page).to have_content @shop.name
  expect(page).to have_content @shop.location
  expect(page).to have_content @shop.description
end

Then("I should see details of the meal") do
  expect(find_field('Name').value).to eq @meal.name
  expect(find_field('Meal type').value).to eq @meal.meal_type
  expect(find_field('Price').value).to eq @meal.price.to_s
  expect(find_field('Description').value).to eq @meal.description
end

And(/^I select shop (\d+)$/) do |shop_num|
  @shop = @shops[shop_num - 1]
  show_links = find("td a", text: "Edit")
  if show_links.kind_of?(Array)
    show_links[shop_num - 1].click
  else
    show_links.click
  end
end
