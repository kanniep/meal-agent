require 'rails_helper'

RSpec.describe Shop, type: :model do
  fixtures :all

  describe 'Orders of shop' do
    before(:each) do
      @user = User.create!(email: 'shop_owner1@ait.asia', roles: [roles(:shop_owner_role)])
      @shop = Shop.create!(name: 'shopname2', location: 'asdas', description: 'asdfa', user: @user)
      @meal = Meal.create!(name: 'meal_name2', meal_type: 'thai', description: 'asdfasd', shop: @shop)
      @order = Order.create!(meal: @meal, user: @user)
    end

    it 'orders of a shop' do
      expect do
        expect(@shop.orders).to eql [@order]
      end.not_to raise_error
    end

    it 'orders is pending' do
      expect do
        expect(@shop.active_orders).to eql [@order]
      end.not_to raise_error
    end

    it 'orders is preparing' do
      @order.status = "preparing"
      @order.save
      expect do
        expect(@shop.active_orders).to eql [@order]
      end.not_to raise_error
    end

    it 'orders is prepared' do
      @order.status = "prepared"
      @order.save
      expect do
        expect(@shop.active_orders).to eql [@order]
      end.not_to raise_error
    end

    it 'orders is served' do
      @order.status = "served"
      @order.save
      expect do
        expect(@shop.active_orders.count).to eql 0
      end.not_to raise_error
    end

    it 'orders is rejected' do
      @order.status = "rejected"
      @order.save
      expect do
        expect(@shop.active_orders.count).to eql 0
      end.not_to raise_error
    end

  end
end
