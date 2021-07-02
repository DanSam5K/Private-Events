require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    subject do
      User.create(id: 2, name: 'JohnDoe')
      described_class.new(location: 'A place', date: Date.parse('2021-04-21'), description: 'A birthday',
                          user_id: 2)
    end
  end

  describe 'associations' do
    it 'belongs to one creator' do
      event = Event.reflect_on_association(:creator)
      expect(event.macro).to eq(:belongs_to)
    end

    it 'has many attendees' do
      event = Event.reflect_on_association(:attendees)
      expect(event.macro).to eq(:has_many)
    end
  end
end
