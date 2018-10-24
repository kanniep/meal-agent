class User < ApplicationRecord
  has_many :user_roles, :dependent => :destroy
  has_many :roles, :through => :user_roles
  has_many :shops, :dependent => :destroy
  has_many :orders, :dependent => :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    self.roles.include? Role.find_by_name('admin')
  end

  def shop_owner?
    self.roles.include? Role.find_by_name('shop_owner')
  end
end
