class Category < ApplicationRecord
  belongs_to :user
  has_many :decors

  validates :name, presence: true
  validates :icon, presence: true
  scope :alphabetical_order, -> { order(name: :asc) }
end
