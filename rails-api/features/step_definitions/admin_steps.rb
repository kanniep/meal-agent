Given("I am an admin") do
  @admin = FactoryBot.create :admin
end

Given(/^there are (\d+) customers$/) do |users_num|
  @users = []
  users_num.to_i.times do
    user = FactoryBot.create :user
    @users.append(user)
  end
end

Given("I am logged in") do
  visit root_path
  fill_in 'Email', with: @admin.email
  fill_in 'Password', with: @admin.password
  click_button "Log in"
end

Given("I should see multiple users") do
  expect(page).to have_css 'tr.user_row'
end

When("I ban customer number {int}") do |int|
  find("tr.user_row"){ |tr| tr.find("td.id_field").text == @users[int - 1].id.to_s }
    .find('li.edit_member_link a').click
  find("div.checkbox input#user_active").set false
  click_button "Save"
end

Then("I should see user number {int} is baned") do |int|
  find("tr.user_row"){ |tr| tr.find("td.id_field").text == @users[int - 1].id.to_s }
    .find('li.edit_member_link a').click
  expect(find("div.checkbox input#user_active")).not_to be_checked
  click_button "Cancel"
end

Then("I should see user number {int} is not baned") do |int|
  find("tr.user_row"){ |tr| tr.find("td.id_field").text == @users[int - 1].id.to_s }
    .find('li.edit_member_link a').click
  expect(find("div.checkbox input#user_active")).to be_checked
  click_button "Cancel"
end
