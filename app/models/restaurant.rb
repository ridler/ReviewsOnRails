require 'twitter'
class Restaurant < ActiveRecord::Base
	has_many :reviews
	validates :name, presence: true
	geocoded_by :location
	after_validation :geocode
	
	@@cuisines = ["american", "french", "mexican", "asian fusion", "mediterranean", "italian"]
	@@gMapsAPIkey = "AIzaSyCAwege38IUT17AuWfl4QDOAaYmCOYUl0Y"
	def self.cuisines; @@cuisines; end
	def self.gMapsAPIkey; @@gMapsAPIkey; end
	
	def simpleWebLink
		if not self.website.nil?
			return self.website.gsub(%r{http://}, "").split('/')[0]
		end
	end
	
	def zipCode
		if not self.location.nil?
			return self.location.reverse[0..5].reverse
		end
	end

	@@client = Twitter::REST::Client.new do |config|
		config.consumer_key        = "zs0DAUzdyuCVbA0hMy4OIg"
		config.consumer_secret     = "aibqYT6jJlbH8tnZsdboBc97WH8xIxB9I3GgmEcLsOY"
		config.access_token        = "2153755358-eKZx8030Kdx7ZmOaBVOPNmKfArHytv29wCbPUqj"
		config.access_token_secret = "SL4GNKK4Rzzv6kRxJCpCmGPzI3ASo8OxpQZ8OGLEZp4Yx"
	end

	def getTweets
		tweets = @@client.search("#{self.name.gsub(/ /, '')}",
			:count => 15, :geocode => "#{self.latitude},#{self.longitude},10mi").collect
		if tweets.any? then return tweets
		else
			tweets = @@client.search("#{self.name}", :count => 15)
			return tweets
		end
	end

end