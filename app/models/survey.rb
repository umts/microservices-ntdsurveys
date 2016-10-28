class Survey < ApplicationRecord
  has_many :survey_trip_stops, dependent: :destroy
  accepts_nested_attributes_for :survey_trip_stops

  validates :date, presence: true
  validates :shift, presence: true

  def location
    survey_trip_stops.order(:sequence_number).first.location
  end

  def sentence_location
    if completed
      " #{starting_pax} #{'passenger'.pluralize(starting_pax)} on bus \
      when departing #{location}".squish
    else
      "Number of passengers on bus when departing \
        #{location}: ____________".squish
    end
  end

  def formatted_date
    date.strftime('%m/%d/%Y')
  end

  def time
    date.strftime('%H:%M')
  end
end
