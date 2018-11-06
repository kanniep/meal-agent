Given("I am a new user") do
  @user = FactoryBot.build :user
end

Given("I try to use another user email") do
  User.all.each do |user|
    puts user.email
  end
  puts @users[0].email
  @user = FactoryBot.build :user, email: @users[0].email
end

Given("I am an user") do
  @user = FactoryBot.create :user
end

Given(/^there are (\d+) users$/) do |users_num|
  @users = []
  users_num.to_i.times do
    user = FactoryBot.create :user
    @users.append(user)
  end
end

And("I am logged in") do
  visit root_path
  click_link "Sign in with Google"
end

And("I visit root page") do
  visit root_path
end

And("I should see my information") do
  expect(page).to have_content "Welcome #{@user.email}! Not you? Sign out"
end

And("I visit {string} page") do |page_name|
  visit "/#{page_name.downcase.gsub(' ','/')}"
end

And("I fill in my information") do
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  fill_in 'Password confirmation', with: @user.password
end

And("I fill in my email and password") do
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
end

And("I fill in wrong password") do
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: "123456"
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

Given("I fill in an existing email") do
  fill_in 'Email', with: @users[0].email
  fill_in 'Password', with: "password"
  fill_in 'Password confirmation', with: "password"
end

And("I should see {string}") do |string|
  expect(page).to have_content string
end

And("I got banned") do
  @user.active = false
  @user.save
end
