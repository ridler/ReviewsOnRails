require 'spec_helper'
require 'restaurant'

describe Restaurant do
	it 'is geocoded by its address upon creation' do
		restaurant = Restaurant.new(:name => 'Chipotle', :location => '1384 E Weldona Way, Superior, CO 80027')
		restaurant.create
		restaurant.latitude.should_not be_nil
	end
end