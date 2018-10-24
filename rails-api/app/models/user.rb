class User < ApplicationRecord
  has_many :user_roles, :dependent => :destroy
  has_many :roles, :through => :user_roles
  has_many :shops, :dependent => :destroy
  has_many :orders, :dependent => :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :add_default_role

  def admin?
    self.roles.include? Role.find_by_name('admin')
  end

  def shop_owner?
    self.roles.include? Role.find_by_name('shop_owner')
  end

  def add_default_role
    if self.roles.nil? || self.roles.empty?
      self.roles = [Role.find_by_name('ordinary')]
    else
      if !self.roles.include? Role.find_by_name('ordinary')
        self.roles.append(Role.find_by_name('ordinary'))
      end
    end
  end
end
