class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :location
      t.string :phone
      t.string :webpage
      t.string :cuisine
      t.integer :priceAverage

      t.timestamps
    end
  end
end
