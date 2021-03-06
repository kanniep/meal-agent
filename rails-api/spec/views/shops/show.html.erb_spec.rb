require 'rails_helper'

RSpec.describe "shops/show", type: :view do
  include Devise::Test::IntegrationHelpers
  fixtures :all

  before(:each) do
    user = assign(:user, User.create!(email: 'st120367@ait.asia', password: 'dummyyyyyy'))
    @shop = assign(:shop, Shop.create!(name: '1234', user: user))
    @meals = @shop.meals.all
  end

  it "renders attributes in <p>" do
    render
  end
end
