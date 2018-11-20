class Event < ApplicationRecord
  # validations
  validates_presence_of :title, :start_date
end
