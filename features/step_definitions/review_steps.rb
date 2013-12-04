Given(/^the following users exist:$/) do |table|
	table.hashes.each do |user|
		User.create(user)
	end
end

Then(/^I should be on the new review page$/) do
	assert page.current_path == new_review_path
end

When(/^I fill in "(.*?)" with (\d+)$/) do |field, number|
	fill_in field, :with => number
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, string|
	fill_in field, :with => string
end

Then(/^I should be on the Tahona Tequilla Bistro page$/) do
	assert page.current_path =~ %r{restaurants/1}
end

Then(/^I should see "(.*?)" under my username\.$/) do |arg1|
	page.find('p', :text => arg1)
end