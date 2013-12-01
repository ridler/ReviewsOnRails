class Restaurant < ActiveRecord::Base
	has_many :reviews
	
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
end