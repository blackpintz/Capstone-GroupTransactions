class Decor < ApplicationRecord
  belongs_to :user
  has_many :decor_categories
  has_many :categories, through: :decor_categories
  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id, message: 'already exists!', case_sensitive: false }
  validates :price, presence: true

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
