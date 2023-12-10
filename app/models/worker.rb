class Worker < ApplicationRecord
  belongs_to :user, optional: true
  has_many :services, dependent: :destroy
  has_many :service_orders, through: :services

  validates :category, :description, presence: true

  delegate :full_name, to: :user

  def average_rate
    service_orders.average(:rate).to_f
  end
end
