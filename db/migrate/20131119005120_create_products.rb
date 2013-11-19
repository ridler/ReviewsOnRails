class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :reviews
      t.integer :averageRating
      t.string :category

      t.timestamps
    end
  end
end
