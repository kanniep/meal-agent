class Shop < ApplicationRecord
  belongs_to :user, required: true
  has_many :meals, :dependent => :destroy
  validates :name, presence: true, uniqueness: true
  validates :user, presence: true

  def orders
    orders = []
    self.meals.each do |meal|
      orders.concat meal.orders
    end
    return orders
  end

  def active_orders
    orders = self.orders.reject do |order|
      !order.active?
    end
    return orders
  end
end
