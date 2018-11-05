And(/^I make an order for meal (\d+)$/) do |meal_num|
  find('tr', text: @meals[meal_num - 1].name).find('td a', text: 'Order').click
end

And(/^there are (\d+) orders for my shop (\d+)$/) do |num_order, shop_num|
  shop = @my_shops[shop_num - 1]
  meals = shop.meals
  @orders = []
  num_order.to_i.times do
    order = FactoryBot.create :order, user: @user, meal: meals[rand(0..(meals.size - 1))]
    @orders.append(order)
  end
end

When(/^I accept order (\d+)$/) do |order_num|
  find_all('tr', text: "order: #{@orders[order_num - 1].id}").last.find('td a', text: 'Accept').click
end

When(/^I reject order (\d+)$/) do |order_num|
  find_all('tr', text: "order: #{@orders[order_num - 1].id}").last.find('td a', text: 'Reject').click
end

When(/^I finish preparing order (\d+)$/) do |order_num|
  find_all('tr', text: "order: #{@orders[order_num - 1].id}").last.find('td a', text: 'Finish').click
end

Then("I should see order {int} with status {string}") do |order_num, status|
  find_all('tr', text: "order: #{@orders[order_num - 1].id}").each do |order_tr|
    expect(order_tr).to have_content @orders[order_num - 1].meal.name
    expect(order_tr).to have_content status
  end
end

Then("I should not see order {int}") do |order_num|
  expect(find_all('tr', text: "order: #{@orders[order_num - 1].id}").count).to eql 0
end

And("order {int} have status {string}") do |order_num, status|
  order = @orders[order_num - 1]
  order.status = status
  order.save
end

Given("I have ordered meal {int}") do |meal_num|
  order = FactoryBot.create :order, user: @user, meal: @meals[meal_num - 1]
  @orders = [order]
end

When("I click receive order {int}") do |order_num|
  find_all('tr', text: "order: #{@orders[order_num - 1].id}").last.find('td a', text: 'Receive').click
end

Then("I should see order for meal {int}") do |meal_num|
  expect(page).to have_content @meals[meal_num - 1].name
end
