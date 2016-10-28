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

  def sts_table
    sts = survey_trip_stops.order(:sequence_number)
    sts_table = [['Time', 'Location', 'Passengers boarded',
                  'Passengers alighted']]
    sts_data = sts.map do |s|
      [s.time.strftime('%H:%M'), s.location,
       completed ? s.boarded : '',
       completed ? s.alighted : '']
    end
    sts_table + sts_data
  end

  def table
    [['Survey #', 'Date', 'Shift', 'Time'],
     [id, formatted_date, shift,
      time]]
  end
end
