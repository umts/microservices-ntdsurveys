class SurveyTripStop < ApplicationRecord
  belongs_to :survey

  validates :location, presence: true
  validates :boarded, presence: true
  validates :alighted, presence: true
end
