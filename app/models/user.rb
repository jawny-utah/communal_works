class User < ApplicationRecord
  has_secure_password

  validates :username, :email, :phone_number, uniqueness: true, presence: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :phone_number, phone: true
  validates :username, :full_name, length: { maximum: 30 }

  has_one :worker, dependent: :destroy
  has_many :service_orders, dependent: :destroy
  has_many :notifications, dependent: :destroy

  def unread_notifications
    notifications.where(read: [false, nil])
  end

  def self.ransackable_associations(auth_object = nil)
    ["notifications", "service_orders", "worker"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["city", "created_at", "date_of_birth", "email", "full_name", "id", "password_digest", "phone_number", "updated_at", "username"]
  end
end
