# spec/models/event_spec.rb
require 'rails_helper'

# Test suite for the Event model
RSpec.describe Event, type: :model do
  # Validation tests
  # ensure columns title and start_date are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:start_date) }
end
