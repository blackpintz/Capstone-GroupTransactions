class Category < ApplicationRecord
  scope :alphabetical_order, -> { order(name: :asc) }
end
