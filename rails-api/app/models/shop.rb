class Shop < ApplicationRecord
  belongs_to :user, required: true
  has_many :meals, :dependent => :destroy
end
