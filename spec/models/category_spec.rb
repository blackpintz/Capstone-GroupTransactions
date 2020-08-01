require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_presence_of(:icon) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:decors) }
  end
end
