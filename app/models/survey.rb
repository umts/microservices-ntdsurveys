class Survey < ApplicationRecord
  include MicroservicesEngine

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
    trip_result = MicroservicesEngine.get(
      :trips, :generate_random_trips, { start_date: start_date,
                                        end_date: end_date,
                                        count_per_day: daily_count })
    JSON.parse(trip_result).fetch('trips').each do |trip_data|
      survey_attributes = {
        date: DateTime.iso8601(trip_data.fetch('datetime')).in_time_zone,
        shift: trip_data.fetch('shift'),
        in_house: false
      }
      survey = Survey.create! survey_attributes
      trip_data.fetch('trip_stops').each do |stop_data|
        stop_attributes = {
          miles_from_previous: stop_data.fetch('distance') / 5820.0,
          time: DateTime.iso8601(stop_data.fetch('datetime')).in_time_zone, # TODO: see r3#2483
          sequence_number: stop_data.fetch('sequence_number').to_i,
          location: stop_data.fetch('location').fetch('name'),
          survey: survey
        }
        SurveyTripStop.create! stop_attributes
      end
    end
  end
end
