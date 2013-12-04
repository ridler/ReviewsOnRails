Given(/^the following restaurants exist:$/) do |table|
	table.hashes.each do |restaurant|
		Restaurant.create(restaurant)
	end
end

When(/^(?:|I )go to (.+)$/) do |page_name|
	visit(restaurants_path)
end

Given(/^I (un)?check the following cuisines: (.*?)$/) do |uncheck, cuisines|
	cuisines.split(/,\s*/).each do |cuisine|
		if uncheck.nil? then check("cuisines_#{cuisine}")
		else uncheck("cuisines_#{cuisine}")
		end
	end
end

When(/I press (.*?)/) do |arg1|
	# print page.html
	click_button(arg1)
end

When(/^I follow "(.*?)"$/) do |arg1|
	click_link(arg1)
end

Then(/^I should see "(.*)"[^$\S]before "(.*)"$/) do |e1, e2|
	page.body.should =~ /#{e1}.*#{e2}/m
end

Then(/^I should see "(.*?)"$/) do |arg1|
	page.find('td', :text => arg1)
end


Then(/^I should not see "(.*?)"$/) do |arg1|
	expect { page.find('td', :text => arg1) }.to raise_error(Capybara::ElementNotFound)
end

# Unchecking all of the restaurants is not allowed
Then(/I should see (all|some) of the restaurants/) do |arg|
	Restaurant.all.each do |restaurant|
		page.find('td', :text => restaurant.name)
	end
end