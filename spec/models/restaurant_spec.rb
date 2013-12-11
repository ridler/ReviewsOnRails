require 'spec_helper'
require 'restaurant'

describe Restaurant do
	
	subject { FactoryGirl.create(:restaurant, :name => 'Chipotle', :location => '1384 E Weldona Way, Superior, CO 80027') }

	it 'is geocoded by its address upon creation' do
		subject.latitude.should_not be_nil
	end

	it 'has a twitter feed' do
		subject.tweets.should_not be_nil
	end

end