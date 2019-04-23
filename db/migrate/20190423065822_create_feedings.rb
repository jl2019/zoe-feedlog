class CreateFeedings < ActiveRecord::Migration[5.2]
  def change
    create_table :feedings do |t|
      t.references :pet, foreign_key: true
      t.references :food, foreign_key: true
      t.integer :quantity
      t.string :notes

      t.timestamps
    end
  end
end
