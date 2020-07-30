class Decor < ApplicationRecord
  belongs_to :user
  belongs_to :category

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  scope :with_no_category, -> { where(category_id: nil) }
end
