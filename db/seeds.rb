# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [{:username => "tagg", :location => "80303", :password => "password"}]
restaurants = [{:name => "Tahona", :location => "80303", :cuisine => "mexican"}]

users.each do |user|
	User.create!(user)
end

restaurants.each do |restaurant|
	Restaurant.create!(restaurant)
end