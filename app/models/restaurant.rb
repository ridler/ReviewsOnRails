class Restaurant < ActiveRecord::Base
	has_many :reviews, through: :users
end
