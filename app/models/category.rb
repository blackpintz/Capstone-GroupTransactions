class Category < ApplicationRecord
  has_many :decors
  scope :alphabetical_order, -> { order(name: :asc) }
end
