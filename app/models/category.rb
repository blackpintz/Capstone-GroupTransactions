class Category < ApplicationRecord
  belongs_to :user
  has_many :decors
  scope :alphabetical_order, -> { order(name: :asc) }
end
