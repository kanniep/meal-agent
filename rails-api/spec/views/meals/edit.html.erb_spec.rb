require 'rails_helper'

RSpec.describe "meals/edit", type: :view do
  include Devise::Test::IntegrationHelpers
  fixtures :all

  before(:each) do
    @user = assign(:user, User.create!(email: 'st120367@ait.asia'))
    @shop = assign(:shop, Shop.create!(name: '1234', user: @user))
    @meal = assign(:meal, Meal.create!(name: '1234', shop: @shop))
  end

  it "renders the edit meal form" do
    render
    assert_select "form[action=?]", shop_meal_url(@shop, @meal) do
    end
  end
end
