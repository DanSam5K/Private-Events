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
end
