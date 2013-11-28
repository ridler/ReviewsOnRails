# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

restaurants = [ {:name => "Tahona Tequilla Bistro", :location => "1035 Pearl St, Boulder, CO 80302", :cuisine => "mexican", :averagePrice => 5, :averageRating => 4, :totalReviews => 23, :website => "http://www.tahonaboulder.com/"},
	{:name => "Brasserie Ten Ten", :location => "1011 Walnut St, Boulder, CO 80302", :cuisine => "french", :averagePrice => 3, :averageRating => 4, :totalReviews => 75, :website => "http://www.brasserietenten.com/"},
	{:name => "PastaVino", :location => "1043 Pearl St, Boulder, CO 80302", :cuisine => "italian", :averagePrice => 4, :averageRating => 3, :totalReviews => 18, :website => "http://pastavino.com/"},
	{:name => "Cafe Mexicali", :location => "2850 Baseline Rd #1, Boulder, CO 80303", :cuisine => "mexican", :averagePrice => 2, :averageRating => 3, :totalReviews => 33, :website => "http://cafemexicali.com/"},
	{:name => "Garbanzo", :location => "1905 29th St, Boulder, CO 80301", :cuisine => "mediterranean", :averagePrice => 2, :averageRating => 4, :totalReviews => 55, :website => "http://www.eatgarbanzo.com/"},
	{:name => "Pei Wei", :location => "1675 29th St #1284, Boulder, CO 80301", :cuisine => "asian fusion", :averagePrice => 2, :averageRating => 3, :totalReviews => 19, :website => "http://www.peiwei.com/index.aspx"},
	{:name => "McDonald's", :location => "1800 28th St, Boulder, CO", :cuisine => "american", :averagePrice => 1, :averageRating => 2, :totalReviews => 20, :website => "http://www.mcdonalds.com/us/en/home.html"},
	{:name => "The Kitchen", :location => "1039 Pearl St, Boulder, CO 80303", :cuisine => "american", :averagePrice => 5, :averageRating => 1, :totalReviews => 119, :website => "http://thekitchen.com/the-kitchen-boulder/"} ]

restaurants.each do |restaurant|
	Restaurant.create!(restaurant)
end