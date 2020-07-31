class User < ApplicationRecord
  has_many :decors
  has_many :categories
  has_one_attached :avatar
end
