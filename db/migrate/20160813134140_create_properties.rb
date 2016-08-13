class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.integer :price
      t.string :address
      t.integer :age
      t.text :detail

      t.timestamps
    end
  end
end
