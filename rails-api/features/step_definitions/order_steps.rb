And(/^I make an order for meal (\d+)$/) do |meal_num|
  find('tr', text: @meals[meal_num - 1].name).find('td a', text: 'Order').click
end

Then(/^I should see order for meal (\d+)$/) do |meal_num|
  expect(page).to have_content @meals[meal_num - 1].name
  expect(page).to have_content "Pending"
end
