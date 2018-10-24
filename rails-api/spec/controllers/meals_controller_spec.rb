require 'rails_helper'

RSpec.describe MealsController, type: :controller do
  include Devise::Test::IntegrationHelpers
  fixtures :all

  let(:valid_attributes) {
    shop = Shop.create!(name: 'shopname', location: 'asdas', description: 'asdfa', user: users(:ordinary))
    return {name: 'meal_name', meal_type: 'thai', description: 'asdfasd', shop_id: shop.id}
  }

  let(:invalid_attributes) {
    return {name: 'meal_name', meal_type: 'thai', description: 'asdfasd', shop_id: nil}
  }

  before(:each) do
    subject.sign_in users(:ordinary)
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
      meal = Meal.create! valid_attributes
      get :show, params: {id: meal.to_param}
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
      meal = Meal.create! valid_attributes
      get :edit, params: {id: meal.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Meal" do
        expect {
          post :create, params: {meal: valid_attributes}
        }.to change(Meal, :count).by(1)
      end

      it "redirects to the created meal" do
        post :create, params: {meal: valid_attributes}
        expect(response).to redirect_to(Meal.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {meal: invalid_attributes}
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
        meal = Meal.create! valid_attributes
        put :update, params: {id: meal.to_param, meal: new_attributes}
        meal.reload
      end

      it "redirects to the meal" do
        meal = Meal.create! valid_attributes
        put :update, params: {id: meal.to_param, meal: valid_attributes}
        expect(response).to redirect_to(meal)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        meal = Meal.create! valid_attributes
        put :update, params: {id: meal.to_param, meal: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested meal" do
      meal = Meal.create! valid_attributes
      expect {
        delete :destroy, params: {id: meal.to_param}
      }.to change(Meal, :count).by(-1)
    end

    it "redirects to the meals list" do
      meal = Meal.create! valid_attributes
      delete :destroy, params: {id: meal.to_param}
      expect(response).to redirect_to(meals_url)
    end
  end

end
