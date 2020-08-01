require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username).case_insensitive }
    it { is_expected.to validate_content_type_of(:avatar).allowing('image/png', 'image/jpeg', 'image/jpg') }
  end

  describe 'associations' do
    it { should have_many(:decors) }
    it { should have_many(:categories) }
  end
end
