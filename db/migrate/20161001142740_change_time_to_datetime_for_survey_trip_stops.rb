class ChangeTimeToDatetimeForSurveyTripStops < ActiveRecord::Migration[5.0]
  def change
    change_column :survey_trip_stops, :time, :datetime
  end
end
