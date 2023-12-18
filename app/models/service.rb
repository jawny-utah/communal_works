class Service < ApplicationRecord
  belongs_to :worker
  has_many :service_orders, dependent: :destroy
  has_many :categories, through: :worker

  validates :description, :title, presence: true
  validates :price, numericality: { bigger_than: 0 }

  after_update :notify_worker

  enum status: %i(on_review active not_active)

  def self.ransackable_attributes(auth_object = nil)
    ["city", "created_at", "description", "id", "price", "status", "title", "updated_at", "worker_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["categories", "service_orders", "worker"]
  end

  def notify_worker
    Notification.create(user_id: worker.user.id,
      work_account_notification: true,
      record_id: id,
      record_class: self.class.to_s,
      body: "Ваша послуга була розглянута! Переглянути результат") if saved_change_to_status? && (active? || not_active?)
  end
end
