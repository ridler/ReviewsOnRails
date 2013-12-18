require 'twitter'
class Restaurant < ActiveRecord::Base
	has_many :reviews
	validates :name, presence: true
	validates :location, presence:true
	geocoded_by :location
	after_validation :geocode
	
	@@cuisines = ["american", "french", "mexican", "asian fusion", "mediterranean", "italian", "cuban"]
	@@gMapsAPIkey = "AIzaSyCAwege38IUT17AuWfl4QDOAaYmCOYUl0Y"
	def self.cuisines; @@cuisines; end
	def self.gMapsAPIkey; @@gMapsAPIkey; end
	
	def simpleWebLink
		if not self.website.nil?
			return self.website.gsub(%r{http://}, "").split('/')[0].gsub(/www./, '')
		end
	end

	@@client = Twitter::REST::Client.new do |config|
		config.consumer_key        = "zs0DAUzdyuCVbA0hMy4OIg"
		config.consumer_secret     = "aibqYT6jJlbH8tnZsdboBc97WH8xIxB9I3GgmEcLsOY"
		config.access_token        = "2153755358-eKZx8030Kdx7ZmOaBVOPNmKfArHytv29wCbPUqj"
		config.access_token_secret = "SL4GNKK4Rzzv6kRxJCpCmGPzI3ASo8OxpQZ8OGLEZp4Yx"
	end

	def tweets
		if not self.twitterHandle.nil?
			tweets = @@client.search("#{self.twitterHandle}", :geocode => "#{self.latitude},#{self.longitude},50mi", :count => 10).collect
		else
			tweets = @@client.search("#{self.name}", :geocode => "#{self.latitude},#{self.longitude},50mi", :count => 10).collect
		end
		return tweets
	end

end
