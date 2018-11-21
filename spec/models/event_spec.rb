# spec/models/event_spec.rb
require 'rails_helper'

# Test suite for the Event model
RSpec.describe Event, type: :model do
  # Validation tests
  describe 'Validations' do
    # ensure columns title and start_date are present before saving
    describe '#title' do
      it 'should be present' do
        event = build(:event, title: '')

        # invalid
        expect(event).to_not be_valid
        expect(event.errors.messages[:title]).to eq ["can't be blank"]

        # valid
        event.title = 'New event'
        expect(event).to be_valid
      end
    end

    describe '#start_date' do
      it 'should be present' do
        event = build(:event, start_date: '')

        # invalid
        expect(event).to_not be_valid
        expect(event.errors.messages[:start_date]).to eq ["can't be blank"]

        # valid
        event.start_date = Time.zone.today
        expect(event).to be_valid
      end
    end

    # ensure that start_date is before the end_date
    describe 'when end_date is before start_date' do
      it 'is rejected' do
        event = build(:event)

        event.start_date = Date.tomorrow
        event.end_date = Time.zone.today

        expect(event).to be_invalid
        expect(event.errors[:end_date]).to include('invalid_date')
      end
    end
  end
end
