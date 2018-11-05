require 'rails_helper'

RSpec.describe ShopsController, type: :controller do
  include Devise::Test::IntegrationHelpers
  fixtures :all

  let(:valid_attributes) {
    return {name: 'shopname1', location: 'asdas', description: 'asdfa', user_id: users(:ordinary).id}
  }

  let(:invalid_attributes) {
    return {name: nil, location: 'asdas', description: 'asdfa'}
  }

  before(:each) do
    @user = User.create!(email: 'shop_owner1@ait.asia', password: '123456', roles: [roles(:shop_owner_role)])
    subject.sign_in @user
    @shop = Shop.create!(name: 'shopname2', location: 'asdas', description: 'asdfa', user: @user)
  end

  describe "GET #index" do
    it "returns a success response" do
      Shop.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: @shop.to_param}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: {id: @shop.to_param}
      expect(response).to be_successful
    end

    it "returns a redirect, not authorized" do
      user = User.create!(email: 'shop_owner10@ait.asia', password: '123456')
      subject.sign_in user

      get :edit, params: {id: @shop.to_param}
      expect(response).to redirect_to(meals_path)
      expect(flash[:alert]).to eq "You are not authorized to access this page."
    end
  end

  describe "POST #create" do
    before(:each) do
      user = User.create!(email: 'shop_owner10@ait.asia', password: '123456')
      subject.sign_in user
    end

    context "with valid params" do
      let(:new_attributes) {
        {name: 'shopname10', location: 'asdas', description: 'asdfa', user_id: users(:ordinary).id}
      }

      it "creates a new Shop" do
        expect {
          post :create, params: {shop: valid_attributes}
        }.to change(Shop, :count).by(1)
      end

      it "redirects to the created shop" do
        post :create, params: {shop: valid_attributes}
        expect(response).to redirect_to(Shop.last)
      end

      it "should have shop_owner role shop" do
        post :create, params: {shop: valid_attributes}
        expect(response).to redirect_to(Shop.last)
        post :create, params: {shop: new_attributes}
        expect(response).to redirect_to(Shop.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {shop: invalid_attributes}
        expect(subject).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        new_attr = valid_attributes
        new_attr['name'] = 'new_name'
        return new_attr
      }

      it "updates the requested shop" do
        put :update, params: {id: @shop.to_param, shop: new_attributes}
        @shop.reload
      end

      it "redirects to the shop" do
        put :update, params: {id: @shop.to_param, shop: valid_attributes}
        expect(response).to redirect_to(@shop)
      end

      it "returns a redirect, not authorized" do
        user = User.create!(email: 'shop_owner10@ait.asia', password: '123456')
        subject.sign_in user

        put :update, params: {id: @shop.to_param, shop: valid_attributes}
        expect(response).to redirect_to(meals_path)
        expect(flash[:alert]).to eq "You are not authorized to access this page."
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {id: @shop.to_param, shop: invalid_attributes}
        expect(subject).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested shop" do
      expect {
        delete :destroy, params: {id: @shop.to_param}
      }.to change(Shop, :count).by(-1)
    end

    it "redirects to the shops list" do
      delete :destroy, params: {id: @shop.to_param}
      expect(response).to redirect_to(shops_url)
    end

    it "returns a redirect, not authorized" do
      user = User.create!(email: 'shop_owner10@ait.asia', password: '123456')
      subject.sign_in user

      delete :destroy, params: {id: @shop.to_param}
      expect(response).to redirect_to(meals_path)
      expect(flash[:alert]).to eq "You are not authorized to access this page."
    end
  end

end
