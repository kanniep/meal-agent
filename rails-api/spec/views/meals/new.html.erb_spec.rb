require 'rails_helper'

RSpec.describe "meals/new", type: :view do
  include Devise::Test::IntegrationHelpers
  fixtures :all

  before(:each) do
    @user = assign(:user, User.create!(email: 'st120367@ait.asia', password: 'dummyyyyyy'))
    @shop = assign(:shop, Shop.create!(name: '1234', user: @user))
    assign(:meal, Meal.create!(name: '1234', shop: @shop))
  end

  it "renders new meal form" do
    render
    assert_select "form[method=?]", "post" do
    end
  end
end
