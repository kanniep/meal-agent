require 'rails_helper'

RSpec.describe ShopsController, type: :controller do
  include Devise::Test::IntegrationHelpers
  fixtures :all

  let(:valid_attributes) {
    return {name: 'shopname', location: 'asdas', description: 'asdfa', user_id: users(:ordinary).id}
  }

  let(:invalid_attributes) {
    return {name: nil, location: 'asdas', description: 'asdfa'}
  }

  before(:each) do
    subject.sign_in users(:ordinary)
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
      shop = Shop.create! valid_attributes
      get :show, params: {id: shop.to_param}
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
      shop = Shop.create! valid_attributes
      get :edit, params: {id: shop.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Shop" do
        expect {
          post :create, params: {shop: valid_attributes}
        }.to change(Shop, :count).by(1)
      end

      it "redirects to the created shop" do
        post :create, params: {shop: valid_attributes}
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
        shop = Shop.create! valid_attributes
        put :update, params: {id: shop.to_param, shop: new_attributes}
        shop.reload
      end

      it "redirects to the shop" do
        shop = Shop.create! valid_attributes
        put :update, params: {id: shop.to_param, shop: valid_attributes}
        expect(response).to redirect_to(shop)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        shop = Shop.create! valid_attributes
        put :update, params: {id: shop.to_param, shop: invalid_attributes}
        expect(subject).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested shop" do
      shop = Shop.create! valid_attributes
      expect {
        delete :destroy, params: {id: shop.to_param}
      }.to change(Shop, :count).by(-1)
    end

    it "redirects to the shops list" do
      shop = Shop.create! valid_attributes
      delete :destroy, params: {id: shop.to_param}
      expect(response).to redirect_to(shops_url)
    end
  end

end
