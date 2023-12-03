class Service < ApplicationRecord
  belongs_to :worker

  validates :description, :title, presence: true
  validates :price, numericality: { bigger_than: 0 }

  enum status: %i(on_review active not_active)
end
