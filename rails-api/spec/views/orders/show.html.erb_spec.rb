require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  include Devise::Test::IntegrationHelpers
  fixtures :all

  before(:each) do
    @user = assign(:user, User.create!(email: 'st120367@ait.asia'))
    @shop = assign(:shop, Shop.create!(name: '1234', user: @user))
    @meal = assign(:meal, Meal.create!(name: '1234', shop: @shop))
    @order = assign(:order, Order.create!(meal: @meal, user: @user))
  end

  it "renders attributes in <p>" do
    render
  end
end
