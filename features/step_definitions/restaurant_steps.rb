Given(/^the following restaurants exist:$/) do |table|
  table.hashes.each do |restaurant|
    Restaurant.create(restaurant)
  end
end

When(/^(?:|I )go to (.+)$/) do |page_name|
  visit(restaurants_path)
end

Given(/^I check the following cuisines: (.*?)$/) do |cuisines|
  cuisines.split(/,\s*/).each do |cuisine|
    check("cuisines_#{cuisine}")
  end
end

Given(/^I uncheck the following cuisines: (.*?)$/) do |cuisines|
  cuisines.split(/,\s*/).each do |cuisine|
    uncheck("cuisines_#{cuisine}")
  end
end

When(/I press (.*?)/) do |arg1|
  click_button('cuisines_submit')
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