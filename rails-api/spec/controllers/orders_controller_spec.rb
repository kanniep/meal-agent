require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  include Devise::Test::IntegrationHelpers
  fixtures :all

  let(:valid_attributes) {
    shop_owner = User.create!(email: 'shop_owner1@ait.asia', roles: [roles(:shop_owner_role)])
    shop = Shop.create!(name: 'shopname1', location: 'asdas', description: 'asdfa', user: shop_owner)
    meal = Meal.create!(name: 'meal_name1', meal_type: 'thai', description: 'asdfasd', shop: shop)
    {meal_id: meal}
  }

  let(:invalid_attributes) {
    {meal_id: nil}
  }

  before(:each) do
    @shop_owner = User.create!(email: 'shop_owner2@ait.asia', roles: [roles(:shop_owner_role)])
    subject.sign_in @shop_owner
    @shop = Shop.create!(name: 'shopname3', location: 'asdas', description: 'asdfa', user: @shop_owner)
    @meal = Meal.create!(name: 'meal_name3', meal_type: 'thai', description: 'asdfasd', shop: @shop)
    @order = @shop_owner.orders.create!(meal: @meal)
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: @order.to_param}
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
      get :edit, params: {id: @order.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Order" do
        expect {
          post :create, params: {order: valid_attributes}
        }.to change(Order, :count).by(1)
      end

      it "redirects to the created order" do
        post :create, params: {order: valid_attributes}
        expect(response).to redirect_to orders_url
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {order: invalid_attributes}
        expect(response).to redirect_to meals_url
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        meal = Meal.create!(name: 'meal_name5', meal_type: 'thai', description: 'asdfasd', shop: @shop)
        {meal_id: meal}
      }

      it "updates the requested order" do
        arrtibutes = new_attributes
        put :update, params: {id: @order.to_param, order: arrtibutes}
        @order.reload
        expect(@order.meal.id).to be arrtibutes[:meal_id].id
      end

      it "redirects to the order" do
        put :update, params: {id: @order.to_param, order: valid_attributes}
        expect(response).to redirect_to orders_url
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {id: @order.to_param, order: invalid_attributes}
        expect(response).to redirect_to orders_url
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested order" do
      expect {
        delete :destroy, params: {id: @order.to_param}
      }.to change(Order, :count).by(-1)
    end

    it "redirects to the orders list" do
      delete :destroy, params: {id: @order.to_param}
      expect(response).to redirect_to(orders_url)
    end
  end

end
