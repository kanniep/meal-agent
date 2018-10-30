require 'rails_helper'

RSpec.describe "meals/index", type: :view do
  include Devise::Test::IntegrationHelpers
  fixtures :all

  before(:each) do
    @user = assign(:user, User.create!(email: 'st120367@ait.asia', password: 'dummyyyyyy'))
    @shop = assign(:shop, Shop.create!(name: '1234', user: @user))
    assign(:meals, [
      Meal.create!(name: '1234', shop: @shop),
      Meal.create!(name: '12345', shop: @shop)
    ])
    controller.sign_in users(:ordinary)
  end

  it "renders a list of meals" do
    render
  end
end
