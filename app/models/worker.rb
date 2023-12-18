class Worker < ApplicationRecord
  belongs_to :user, optional: true
  has_many :services, dependent: :destroy
  has_many :service_orders, through: :services

  validates :description, presence: true

  has_many :worker_categories, dependent: :destroy
  has_many :categories, through: :worker_categories, dependent: :destroy

  delegate :full_name, to: :user

  def average_rate
    service_orders.average(:rate).to_f
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "looking_for_work", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["categories", "service_orders", "services", "user", "worker_categories"]
  end

  private

  def categories_must_be_uniq
    errors.add(:base, "Категорії не повинні повторюватись") if categories.uniq.length != categories.length
  end
end
