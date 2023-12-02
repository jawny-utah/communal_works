class Worker < ApplicationRecord
  belongs_to :user, optional: true

  validates :category, :description, presence: true
end
