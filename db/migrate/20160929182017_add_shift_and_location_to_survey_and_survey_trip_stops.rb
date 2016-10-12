class AddShiftAndLocationToSurveyAndSurveyTripStops < ActiveRecord::Migration[5.0]
  def change
    add_column :surveys, :shift, :string
    add_column :survey_trip_stops, :location, :string
  end
end
