class User < ApplicationRecord
  has_secure_password

  validates :username, :email, :phone_number, uniqueness: true, presence: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :phone_number, phone: true

  has_one :worker, dependent: :destroy
  has_many :service_orders, dependent: :destroy
end
