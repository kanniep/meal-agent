require 'rails_helper'

RSpec.describe "meals/show", type: :view do
  include Devise::Test::IntegrationHelpers
  fixtures :all
  
  before(:each) do
    @user = assign(:user, User.create!(email: 'st120367@ait.asia', password: 'dummyyyyyy'))
    @shop = assign(:shop, Shop.create!(user: @user))
    @meal = assign(:meal, Meal.create!(shop: @shop))
  end

  it "renders attributes in <p>" do
    render
  end
end
