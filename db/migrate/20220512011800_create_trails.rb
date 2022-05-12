class CreateTrails < ActiveRecord::Migration[5.2]
  def change
    create_table :trails do |t|
      t.string :name
      t.boolean :hikable
      t.integer :length
      t.references :park, foreign_key: true
      t.timestamps
    end
  end
end
