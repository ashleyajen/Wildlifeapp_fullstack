class AddColorToSightings < ActiveRecord::Migration[5.0]
  def change
    add_column :sightings, :color, :string
  end
end
