	# This is a class for a User ;-)
class User < ActiveRecord::Base
	has_many :reviews
end