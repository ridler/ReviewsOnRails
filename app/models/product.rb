class Product < ActiveRecord::Base
	has_many :reviews, through: :users
end
