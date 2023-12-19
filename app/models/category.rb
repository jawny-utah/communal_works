class Category < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  has_many :worker_categories, dependent: :destroy
  has_many :workers, through: :worker_categories

  def self.ransackable_associations(auth_object = nil)
    ["worker_categories", "workers"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "title", "updated_at"]
  end
end
