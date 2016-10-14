class ChangeDateOnSurveyToDatetime < ActiveRecord::Migration[5.0]
  def change
    change_column :surveys, :date, :datetime
  end
end
