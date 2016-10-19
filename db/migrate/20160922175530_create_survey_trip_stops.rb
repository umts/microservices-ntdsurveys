class CreateSurveyTripStops < ActiveRecord::Migration[5.0]
  def change
    create_table :survey_trip_stops do |t|
      t.integer :boarded
      t.integer :alighted
      t.float   :miles_from_previous
      t.integer :sequence_number

      t.timestamps
    end
  end
end
