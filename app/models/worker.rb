class Worker < ApplicationRecord
  belongs_to :user, optional: true
  has_many :services, dependent: :destroy

  validates :category, :description, presence: true

  delegate :full_name, to: :user
end
