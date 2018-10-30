class Meal < ApplicationRecord
  belongs_to :shop, required: true
  has_many :orders, :dependent => :destroy
  validates :name, presence: true, uniqueness: true
  validates :shop, presence: true
end
