class ChangeLatitudeAndLongitudeDatatypesInRestaurants < ActiveRecord::Migration
  def self.up
  	change_column :restaurants, :latitude, :double
  	change_column :restaurants, :longitude, :double
  end

  def self.down
  	change_column :restaurants, :latitude, :float
  	change_column :restaurants, :longitude, :float
  end
end
