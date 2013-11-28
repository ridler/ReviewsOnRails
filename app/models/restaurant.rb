class Restaurant < ActiveRecord::Base
	has_many :reviews

	def simpleWebLink
		self.website.sub(%r{http://}, "").split('/')[0]
	end
end