require 'rails_helper'

RSpec.describe "meals/new", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(email: 'st120367@ait.asia', password: 'dummyyyyyy'))
    @shop = assign(:shop, Shop.create!(user: @user))
    assign(:meal, Meal.create!(shop: @shop))
  end

  it "renders new meal form" do
    render
    assert_select "form[method=?]", "post" do
    # assert_select "form[action=?][method=?]", meals_path, "post" do
    end
  end
end
