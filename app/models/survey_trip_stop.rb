class SurveyTripStop < ApplicationRecord
  belongs_to :survey

  validates :location, presence: true
  validates :time, presence: true
end
