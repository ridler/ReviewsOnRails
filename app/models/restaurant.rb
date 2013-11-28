class Restaurant < ActiveRecord::Base
	has_many :reviews
	
	@@cuisines = ["american", "french", "mexican", "asian fusioin", "thai", "chinese", "vietnameese", "mediterranean", "italian"]
	@@gMapsAPIkey = "AIzaSyCAwege38IUT17AuWfl4QDOAaYmCOYUl0Y"
	def self.cuisines; @@cuisines; end
	def self.gMapsAPIkey; @@gMapsAPIkey; end
	def simpleWebLink; self.website.sub(%r{http://}, "").split('/')[0]; end
	def zipCode; self.location.reverse[0..5].reverse; end
end