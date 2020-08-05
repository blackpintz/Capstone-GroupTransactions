class User < ApplicationRecord
  has_many :decors
  has_many :categories
  has_one_attached :avatar
  validates :avatar, content_type: { in: ['image/png', 'image/jpg', 'image/jpeg'], message: 'should be a jpg, jpeg or png.' }
  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }

  def decors_with_no_category(decors)
    decors.select { |decor| decor.categories.empty? }
  end
end
