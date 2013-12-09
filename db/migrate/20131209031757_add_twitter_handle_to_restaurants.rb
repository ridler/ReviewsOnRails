class AddTwitterHandleToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :twitterHandle, :string
  end
end
