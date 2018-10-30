require "rails_helper"

RSpec.describe MealsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/meals").to route_to("meals#index")
    end

    it "routes to #new" do
      expect(:get => "/shops/1/meals/new").to route_to("meals#new", shop_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/meals/1").to route_to("meals#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/shops/1/meals/1/edit").to route_to("meals#edit", :id => "1", shop_id: "1")
    end


    it "routes to #create" do
      expect(:post => "/shops/1/meals").to route_to("meals#create", shop_id: "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/shops/1/meals/1").to route_to("meals#update", :id => "1", shop_id: "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/shops/1/meals/1").to route_to("meals#update", :id => "1", shop_id: "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/shops/1/meals/1").to route_to("meals#destroy", :id => "1", shop_id: "1")
    end
  end
end
