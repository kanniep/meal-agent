class User < ApplicationRecord
  has_many :user_roles, :dependent => :destroy
  has_many :roles, :through => :user_roles
  has_many :shops, :dependent => :destroy
  has_many :orders, :dependent => :destroy

  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  before_create :add_default_role

  def admin?
    self.roles.include? Role.find_by_name('admin')
  end

  def shop_owner?
    self.roles.include? Role.find_by_name('shop_owner')
  end

  def add_role(role)
    if !self.roles.include? role
      self.roles.append(role)
    end
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

  def active_orders
    orders = self.orders.reject do |order|
      !order.active?
    end
    return orders
  end

  def self.from_omniauth(auth)
    # Either create a User record or update it based on the provider (Google) and the UID
    where(email: auth.info.email).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.token = auth.credentials.token
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token
    end
  end
end
