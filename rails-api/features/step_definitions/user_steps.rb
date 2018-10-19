Given("I am a new user") do
  @user = FactoryBot.build :user
end

Given(/^there are (\d+) users$/) do |users_num|
  @users = []
  users_num.to_i.times do
    user = FactoryBot.create :user
    @users.append(user)
  end
end

And("I visit root page") do
  visit root_path
end

And("I visit {string} page") do |page_name|
  visit "#{page_name.downcase.gsub(' ','_')}_path"
end

Given("I fill in my information") do
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  fill_in 'Password confirmation', with: @user.password
end

When("I click {string} link") do |string|
  click_link string
end

When("I click {string} button") do |string|
  click_button string
end

Then ("I should be on the root page") do
  expect(current_path).to eq("/")
end

Then ("I should be on the {string} page") do |page_name|
  expect(current_path).to eq("/#{page_name.downcase.gsub(' ','/')}")
end

Given("I fill in email incorrectly") do
  fill_in 'Email', with: @users[0].email
  fill_in 'Password', with: "password"
  fill_in 'Password confirmation', with: "password"
end

And("I should see {string}") do |string|
  expect(page).to have_content string
end
