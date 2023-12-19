class Notification < ApplicationRecord
  belongs_to :user

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "id", "read", "record_class", "record_id", "updated_at", "user_id", "work_account_notification"]
  end
end
