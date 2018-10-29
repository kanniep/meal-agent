Given("I want to create a shop") do
  @shop = FactoryBot.build :shop
end

Then("I fill in shop information") do
  fill_in 'Name', with: @shop.name
  fill_in 'Location', with: @shop.location
  fill_in 'Description', with: @shop.description
end

Then("I should see details of the shop") do
  expect(page).to have_content @shop.name
  expect(page).to have_content @shop.location
  expect(page).to have_content @shop.description
end
