class Order < ApplicationRecord
  belongs_to :meal
  belongs_to :user

  enum order_status: [ :pending, :rejected, :preparing, :prepared, :served ]

  validates :user, presence: true
  validates :meal, presence: true
  validates :status, :inclusion => {:in => order_statuses}, on: :update

  before_create :add_default_status

  def add_default_status
    self.status = :pending
  end
end
