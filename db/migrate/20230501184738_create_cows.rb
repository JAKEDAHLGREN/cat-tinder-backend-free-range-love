class CreateCows < ActiveRecord::Migration[7.0]
  def change
    create_table :cows do |t|
      t.string :name
      t.integer :age
      t.text :enjoys
      t.text :color
      t.text :species
      t.text :image

      t.timestamps
    end
  end
end
