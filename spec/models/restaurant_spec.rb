require 'spec_helper'
require 'restaurant'

describe Restaurant do

	it 'knows about all of the possible cuisines' do
		Restaurant.cuisines.should == ["american", "french", "mexican", "asian fusion", "mediterranean", "italian"]
	end

	subject { FactoryGirl.create(:restaurant, :name => 'Chipotle', :website => 'http://www.chipotle.com',
		:location => '1384 E Weldona Way, Superior, CO') }

	it 'is geocoded by its address upon creation' do
		subject.latitude.should_not be_nil
		subject.longitude.should_not be_nil
	end

	it 'has a simplified format for its website' do
		subject.simpleWebLink.should == 'chipotle.com'
	end

	it 'has a twitter feed' do
		subject.tweets.should_not be_nil
	end

	it 'has a name' do
		subject.name.should == 'Chipotle'
	end

	it 'has a spot to put reviews' do
		subject.reviews.should == []
	end

end