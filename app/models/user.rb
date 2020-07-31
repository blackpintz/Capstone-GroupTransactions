class User < ApplicationRecord
  has_many :decors
  has_many :categories
end
