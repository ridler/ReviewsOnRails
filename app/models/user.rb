# This is a class for a User ;-)
class User < ActiveRecord::Base
	has_many :reviews

	def self.create_with_omniauth(auth)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.name = auth["info"]["name"]
		end
	end

end