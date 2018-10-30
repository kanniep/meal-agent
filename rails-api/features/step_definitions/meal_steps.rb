Given(/^there are (\d+) meals$/) do |num_meal|
  user = FactoryBot.create :shop_owner
  @shop = FactoryBot.create :shop, user: user
  @meals = []
  num_meal.to_i.times do
    shop = FactoryBot.create :meal, shop: @shop
    @meals.append(shop)
  end
end

Given(/^I want to create a meal for shop (\d+)$/) do |num_shop|
  @meal = FactoryBot.build :meal, shop: @shops[num_shop - 1]
end

And('I want to create a meal') do
  @shop = FactoryBot.create :shop, user: @user
  @meal = FactoryBot.build :meal, shop: @shop
end

And('I fill in meal information') do
  fill_in 'Name', with: @meal.name
  fill_in 'Meal type', with: @meal.meal_type
  fill_in 'Price', with: @meal.price
  fill_in 'Description', with: @meal.description
end

Then('I should see details of the meal') do
  expect(find_field('Name').value).to eq @meal.name
  expect(find_field('Meal type').value).to eq @meal.meal_type
  expect(find_field('Price').value).to eq @meal.price.to_s
  expect(find_field('Description').value).to eq @meal.description
end

Then(/^I select meal (\d+)$/) do |meal_num|
  find_all('td a', text: 'Show').at(meal_num - 1).click
end

Then(/^I should see details of meal (\d+)$/) do |meal_num|
  expect(page).to have_content @meals[meal_num - 1].name
  expect(page).to have_content @meals[meal_num - 1].meal_type
  expect(page).to have_content @meals[meal_num - 1].price.to_s
  expect(page).to have_content @meals[meal_num - 1].description
end

When(/^I try to edit meal (\d+)$/) do |meal_num|
  meal = @meals[meal_num - 1]
  visit "/shops/#{@shop.id}/meals/#{meal.id}/edit"
end

When('I try to create a meal') do
  visit "/shops/#{@shop.id}/meals/new"
end
