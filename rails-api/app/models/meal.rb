class Meal < ApplicationRecord
  belongs_to :shop, required: true
  has_many :orders, :dependent => :destroy
end
