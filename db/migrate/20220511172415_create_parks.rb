class CreateParks < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :name
      t.boolean :open
      t.integer :size
      t.timestamps
    end
  end
end
