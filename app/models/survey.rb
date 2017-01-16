class Survey < ApplicationRecord
  has_many :survey_trip_stops, dependent: :destroy
  accepts_nested_attributes_for :survey_trip_stops

  validates :date, presence: true
  validates :shift, presence: true

  def formatted_date
    date.strftime '%A, %B %e, %Y'
  end

  def location
    survey_trip_stops.order(:sequence_number).first.location
  end

  def time
    date.strftime '%-H:%M %P'
  end

  def self.generate_ntd(start_date:, end_date:, daily_count:)
    # This method signature here to make RSpec pass.
  end
end
