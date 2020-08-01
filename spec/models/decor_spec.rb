require 'rails_helper'

RSpec.describe Decor, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:category).optional }
  end
end
