class Category < ApplicationRecord
  has_many :decor_categories
  has_many :decors, through: :decor_categories
  scope :alphabetical_order, -> { order(name: :asc) }
end
