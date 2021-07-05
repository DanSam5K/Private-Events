require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'has many events' do
      user = User.reflect_on_association(:events)
      expect(user.macro).to eq(:has_many)
    end

    it 'has many attended_events' do
      user = User.reflect_on_association(:attended_events)
      expect(user.macro).to eq(:has_many)
    end
  end

  describe 'email' do
    it 'must be present' do
      user = described_class.new(name: 'John', email: 'john@example.com', password: '123456')
      expect(user).to be_valid
      user.email = nil
      expect(user).to_not be_valid
    end
  end

  describe 'password' do
    it 'must be present' do
      user = described_class.new(name: 'John', email: 'john@example.com', password: '123456')
      expect(user).to be_valid
      user.password = nil
      expect(user).to_not be_valid
    end
  end
end
