class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :user
      t.string :business
      t.timestamp :time
      t.integer :stars
      t.integer :price

      t.timestamps
    end
  end
end
