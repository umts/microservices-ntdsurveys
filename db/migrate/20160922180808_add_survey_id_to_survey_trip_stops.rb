class AddSurveyIdToSurveyTripStops < ActiveRecord::Migration[5.0]
  def change
    add_column :survey_trip_stops, :survey_id, :integer
  end
end
