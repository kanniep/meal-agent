require 'rails_helper'

RSpec.describe "shops/new", type: :view do
  before(:each) do
    assign(:shop, Shop.new())
  end

  it "renders new shop form" do
    render

    assert_select "form[action=?][method=?]", shops_path, "post" do
    end
  end
end
