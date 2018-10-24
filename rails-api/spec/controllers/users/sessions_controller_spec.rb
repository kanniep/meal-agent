require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  include Devise::Test::IntegrationHelpers
  fixtures :all

  let(:valid_attributes) {
    return {user: {email: 'user@ait.asia', password: 'password', active: true}}
  }

  let(:in_valid_attributes) {
    return {user: {email: 'not_exist@ait.asia', password: 'password', active: true}}
  }

  describe "POST #create" do
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      @user = User.create! valid_attributes[:user]
      @user.save
    end

    it "returns a redirects response" do
      post :create, params: valid_attributes
      # expect(response).to be_successful
      expect(response).to redirect_to root_path
    end

    it "return sign_in page (invalid email or password)" do
      post :create, params: in_valid_attributes
      expect(response).to render_template("new")
    end

    it "return sign_in page (banned user)" do
      @user.active = false
      @user.save
      post :create, params: valid_attributes
      expect(response).to redirect_to new_user_session_path
    end
  end
end
