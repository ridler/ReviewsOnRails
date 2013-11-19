class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :reviews
      t.string :location
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
