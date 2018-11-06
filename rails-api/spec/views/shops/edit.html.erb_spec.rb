require 'rails_helper'

RSpec.describe "shops/edit", type: :view do
  include Devise::Test::IntegrationHelpers
  fixtures :all

  before(:each) do
    user = assign(:user, User.create!(email: 'st120367@ait.asia'))
    @shop = assign(:shop, Shop.create!(name: '1234', user: user))
    @meals = @shop.meals.all
  end

  it "renders the edit shop form" do
    render

    assert_select "form[action=?][method=?]", shop_path(@shop), "post" do
    end
  end
end
