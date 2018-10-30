require 'rails_helper'

RSpec.describe MealsController, type: :controller do
  include Devise::Test::IntegrationHelpers
  fixtures :all

  let(:valid_attributes) {
    shop = Shop.create!(name: 'shopname', location: 'asdas', description: 'asdfa', user: users(:ordinary))
    return {name: 'meal_name1', meal_type: 'thai', description: 'asdfasd', shop_id: shop.id}
  }

  let(:invalid_attributes) {
    return {name: nil, meal_type: 'thai', description: 'asdfasd'}
  }

  before(:each) do
    @user = User.create!(email: 'shop_owner1@ait.asia', password: '123456', roles: [roles(:shop_owner_role)])
    subject.sign_in @user
    @shop = Shop.create!(name: 'shopname2', location: 'asdas', description: 'asdfa', user: @user)
    @meal = Meal.create!(name: 'meal_name2', meal_type: 'thai', description: 'asdfasd', shop: @shop)
  end

  describe "GET #index" do
    it "returns a success response" do
      Meal.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
      # expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: @meal.to_param}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {shop_id: @shop.id}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: {id: @meal.to_param, shop_id: @shop.id}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Meal" do
        expect {
          post :create, params: {meal: valid_attributes, shop_id: @shop.id}
        }.to change(Meal, :count).by(1)
      end

      it "redirects to the created meal" do
        post :create, params: {meal: valid_attributes, shop_id: @shop.id}
        expect(response).to redirect_to(edit_shop_meal_url(@shop, Meal.last))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {meal: invalid_attributes, shop_id: @shop.id}
        expect(response).to be_successful
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

      it "updates the requested meal" do
        put :update, params: {id: @meal.to_param, meal: new_attributes, shop_id: @shop.id}
        @meal.reload
      end

      it "redirects to the meal" do
        put :update, params: {id: @meal.to_param, meal: valid_attributes, shop_id: @shop.id}
        expect(response).to redirect_to(@meal)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {id: @meal.to_param, meal: invalid_attributes, shop_id: @shop.id}
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested meal" do
      expect {
        delete :destroy, params: {id: @meal.to_param, shop_id: @shop.id}
      }.to change(Meal, :count).by(-1)
    end

    it "redirects to the meals list" do
      delete :destroy, params: {id: @meal.to_param, shop_id: @shop.id}
      expect(response).to redirect_to(meals_url)
    end
  end

end
