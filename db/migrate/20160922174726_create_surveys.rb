class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.boolean :completed, default: false
      t.boolean :printed, default: false
      t.integer :starting_pax, default: 0
      t.boolean :in_house, default: false

      t.timestamps
    end
  end
end
