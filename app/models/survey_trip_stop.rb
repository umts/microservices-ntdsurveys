class SurveyTripStop < ApplicationRecord
  belongs_to :survey

  validates :location, presence: true
  validates :time, presence: true

  def formatted_time
    time.strftime('%H:%M')
  end

  def date
    time.strftime('%m/%d/%Y')
  end
end
