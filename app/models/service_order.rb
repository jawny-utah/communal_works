class ServiceOrder < ApplicationRecord
  belongs_to :user
  belongs_to :service
  has_one :worker, through: :service

  validates :contact_info, presence: true
  validate :worker_cant_order_his_service
  enum status: %i(on_review in_progress finished cancelled)

  after_create :notify_worker
  after_update :notify_client_about_in_progress
  after_update :notify_client_about_cancelled
  after_update :notify_worker_about_cancelled
  after_update :notify_client_about_finished
  after_update :notify_worker_about_rate

  def worker_cant_order_his_service
    errors.add(:base, "Ви не можете замовити послугу у самого себе.") if user_id == service.worker_id
  end

  private

  def notify_worker
    Notification.create(user_id: worker.id,
      work_account_notification: true,
      record_id: id,
      record_class: self.class.to_s,
      body: "Надішло нове замовлення на послугу #{service.title}.")
  end

  def notify_client_about_in_progress
    Notification.create(user_id: user.id,
      work_account_notification: false,
      record_id: id,
      record_class: self.class.to_s,
      body: "Замовлення №#{id} було успішно розпочате!") if saved_change_to_status? && in_progress?
  end

  def notify_client_about_cancelled
    Notification.create(user_id: user.id,
      work_account_notification: false,
      record_id: id,
      record_class: self.class.to_s,
      body: "Виконавець відмінив замовлення №#{id}. Переглянути") if saved_change_to_status? && cancelled? && cancelled_by_user == false
  end

  def notify_worker_about_cancelled
    Notification.create(user_id: worker.id,
      work_account_notification: true,
      record_id: id,
      record_class: self.class.to_s,
      body: "Замовник відмінив замовлення №#{id}. Переглянути") if saved_change_to_status? && cancelled? && cancelled_by_user
  end

  def notify_client_about_finished
    Notification.create(user_id: user.id,
      work_account_notification: false,
      record_id: id,
      record_class: self.class.to_s,
      body: "Виконавець завершив ваше замовлення №#{id}. Залиште відгук про виконану роботу.") if saved_change_to_status? && finished?
  end

  def notify_worker_about_rate
    Notification.create(user_id: worker.id,
      work_account_notification: true,
      record_id: id,
      record_class: self.class.to_s,
      body: "Замовник залишив відгук щодо виконаного замовлення №#{id}. Переглянути") if saved_change_to_rate?
  end
end
