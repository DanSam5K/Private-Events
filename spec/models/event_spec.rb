require 'rails_helper'

RSpec.describe Event, type: :model do
  context "with 2 or more Events" do
    it "orders them in reverse past and future events" do
      event = Event.create!
      event1 = event.create!(:name => "first event")
      event2 = event.create!(:name => "second event")
      expect(event.reload.events).to eq([event1, event2])
    end
  end
end
