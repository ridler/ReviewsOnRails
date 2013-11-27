class AddTotalReviewsToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :totalReviews, :integer
  end
end
