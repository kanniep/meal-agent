class Shop < ApplicationRecord
  belongs_to :user, required: true
  has_many :meals, :dependent => :destroy
  validates :name, presence: true, uniqueness: true
  validates :user, presence: true
end
