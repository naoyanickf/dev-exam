class CreateStations < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |t|
      t.integer :property_id
      t.string :line_name
      t.string :name
      t.integer :distance

      t.timestamps
    end
  end
end
