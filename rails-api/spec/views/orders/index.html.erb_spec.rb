require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  include Devise::Test::IntegrationHelpers
  fixtures :all

  before(:each) do
    @user = assign(:user, User.create!(email: 'st120367@ait.asia'))
    @shop = assign(:shop, Shop.create!(name: '1234', user: @user))
    @meal = assign(:meal, Meal.create!(name: '1234', shop: @shop))
    assign(:orders, [
      Order.create!(meal: @meal, user: @user),
      Order.create!(meal: @meal, user: @user)
    ])
    controller.sign_in users(:ordinary)
  end

  it "renders a list of orders" do
    render
  end
end
