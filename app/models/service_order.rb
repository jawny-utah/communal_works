class ServiceOrder < ApplicationRecord
  belongs_to :user
  belongs_to :service
  has_one :worker, through: :service

  validates :contact_info, presence: true
  validate :worker_cant_order_his_service
  enum status: %i(on_review in_progress finished cancelled)

  def worker_cant_order_his_service
    errors.add(:base, "Ви не можете замовити послугу у самого себе.") if user_id == service.worker_id
  end
end
