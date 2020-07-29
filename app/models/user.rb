class User < ApplicationRecord
  has_many :transactions
  has_many :categories, class_name: 'Group'
end
