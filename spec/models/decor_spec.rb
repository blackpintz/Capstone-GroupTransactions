require 'rails_helper'

RSpec.describe Decor, type: :model do
  describe 'validations' do
    before(:example) do
      @user = User.create(username: 'Rose')
      @user.decors.create(name: 'Rugs', price: 8)
    end
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_uniqueness_of(:name).scoped_to(:user_id).case_insensitive.with_message('already exists!') }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:category).optional }
  end
end
