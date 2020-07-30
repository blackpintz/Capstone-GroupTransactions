class Decor < ApplicationRecord
  belongs_to :user
  has_many :decor_categories
  has_many :categories, through: :decor_categories

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
