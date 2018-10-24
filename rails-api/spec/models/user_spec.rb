require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :all

  describe 'Ask for user role' do

    it 'is user an admin?' do
      admin_role = roles(:admin_role)
      ordinary_role = roles(:ordinary_role)
      admin = User.new(email: 'st120367@ait.asia', password: 'dummyyyyyy', roles: [admin_role, ordinary_role])
      expect do
        expect(admin.admin?).to be true
      end.not_to raise_error
    end

    it 'is user an shop_owner?' do
      shop_owner_role = roles(:shop_owner_role)
      ordinary_role = roles(:ordinary_role)
      shop_owner = User.new( email: 'st120367@ait.asia', password: 'dummyyyyyy', roles: [shop_owner_role, ordinary_role])
      expect do
        expect(shop_owner.shop_owner?).to be true
      end.not_to raise_error
    end
  end
end
