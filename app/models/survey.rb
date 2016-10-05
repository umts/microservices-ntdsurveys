class Survey < ApplicationRecord
  has_many :survey_trip_stops

  validates :date, presence: true
  validates :shift, presence: true
end
