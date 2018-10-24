require 'rails_helper'

RSpec.describe "meals/index", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(email: 'st120367@ait.asia', password: 'dummyyyyyy'))
    @shop = assign(:shop, Shop.create!(user: @user))
    assign(:meals, [
      Meal.create!(shop: @shop),
      Meal.create!(shop: @shop)
    ])
  end

  it "renders a list of meals" do
    render
  end
end
