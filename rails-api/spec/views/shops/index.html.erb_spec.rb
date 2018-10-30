require 'rails_helper'

RSpec.describe "shops/index", type: :view do
  include Devise::Test::IntegrationHelpers
  fixtures :all

  before(:each) do
    user = assign(:user, User.create!(email: 'st120367@ait.asia', password: 'dummyyyyyy'))
    assign(:shops, [
      Shop.create!(name: '1234', user: user),
      Shop.create!(name: '12345', user: user)
    ])
  end

  it "renders a list of shops" do
    render
  end
end
