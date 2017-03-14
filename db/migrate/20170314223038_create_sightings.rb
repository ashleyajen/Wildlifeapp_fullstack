class CreateSightings < ActiveRecord::Migration[5.0]
  def change
    create_table :sightings do |t|
      t.date :date
      t.integer :reccurence
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
