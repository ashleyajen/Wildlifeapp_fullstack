class AddAnimalIdToSightings < ActiveRecord::Migration[5.0]
  def change
    change_table :sightings do |t|
      t.references :animal
    end
  end
end
