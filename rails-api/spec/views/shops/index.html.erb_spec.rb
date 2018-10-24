require 'rails_helper'

RSpec.describe "shops/index", type: :view do
  before(:each) do
    user = assign(:user, User.create!(email: 'st120367@ait.asia', password: 'dummyyyyyy'))
    assign(:shops, [
      Shop.create!(user: user),
      Shop.create!(user: user)
    ])
  end

  it "renders a list of shops" do
    render
  end
end
