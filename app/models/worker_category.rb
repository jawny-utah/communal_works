class WorkerCategory < ApplicationRecord
  belongs_to :worker
  belongs_to :category

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "id", "updated_at", "worker_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category", "worker"]
  end
end
