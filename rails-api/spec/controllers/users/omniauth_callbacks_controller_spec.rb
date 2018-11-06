require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  include Devise::Test::IntegrationHelpers
  fixtures :all

  before(:each) do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

  before(:all) do
    OmniAuth.config.test_mode = true
    @valid_auth = OmniAuth::AuthHash.new({
        provider: 'Google',
        uid: 12345,
        info: {
          email: "user@ait.asia"
        },
        credentials: {
          token: "token",
          refresh_token: "another_token",
          expires_at: 1354920555,
          expires: true
        }
      })

    @invalid_auth = OmniAuth::AuthHash.new({
        provider: 'google',
        uid: 12345,
        credentials: {
          token: "token",
          refresh_token: "another_token",
          expires_at: 1354920555,
          expires: true
        }
      })
  end

  after(:all) do
    OmniAuth.config.test_mode = false
  end

  describe "handle google_oauth2" do
    it "sucess" do
      request.env['omniauth.auth']  = @valid_auth
      get :google_oauth2
      expect(response).to redirect_to root_path
      expect(flash[:notice]).to eql "Successfully authenticated from Google account."
    end

    it "fail" do
      request.env['omniauth.auth']  = @invalid_auth
      get :google_oauth2
      expect(response).to redirect_to new_user_session_path
      expect(flash[:error]).to eql "translation missing: en.devise.omniauth_callbacks.user.Broken Google Oauth"
    end

    it "user got banned" do
      user = User.new( email: "user@ait.asia", active: false)
      user.save
      request.env['omniauth.auth']  = @valid_auth
      get :google_oauth2
      expect(response).to redirect_to new_user_session_path
      expect(flash[:error]).to eql "You got banned"
    end
  end

end
