class Event < ApplicationRecord
  # validations
  validates_presence_of :title, :start_date
  validate :after_or_equal

  def after_or_equal
    return if end_date.blank? || start_date.blank?
    errors.add(:end_date, 'invalid_date') if end_date < start_date
  end
end
