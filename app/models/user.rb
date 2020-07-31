class User < ApplicationRecord
  has_many :decors
  has_many :categories
  has_one_attached :avatar
  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }
end
