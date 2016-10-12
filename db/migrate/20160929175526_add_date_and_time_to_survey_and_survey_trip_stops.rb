class AddDateAndTimeToSurveyAndSurveyTripStops < ActiveRecord::Migration[5.0]
  def change
    add_column :surveys, :date, :date
    add_column :survey_trip_stops, :time, :string
  end
end
