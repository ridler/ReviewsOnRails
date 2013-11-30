Given(/^the following restaurants exist:$/) do |table|
  table.hashes.each do |restaurant|
    Restaurant.create(restaurant)
  end
end

# Given(/^I am on the ReviewsOnRails home page$/) do
#   pending # express the regexp above with the code you wish you had
# end

# When /I (un)?check the following cuisines: (.*)/ do |uncheck, cuisine_list|
#   # HINT: use String#split to split up the rating_list, then
#   #   iterate over the ratings and reuse the "When I check..." or
#   #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
#   # Split on index of comma followed by 0 or more spaces
#   cuisine_list.split(/,\s*/).each do |cuisine|
#     # should use web-steps:
#     if uncheck.nil? then steps %Q{ When I check "cuisines[#{cuisine}]" }
#     else steps %Q{ When I uncheck "cuisines[#{cuisine}]" }
#     end
#   end
# end

Given(/I check the following cuisines(.*?)/) do |cuisines|
  cuisines.split(/,\s*/).each do |cuisine|
    uncheck("cuisines_#{cuisine}")
  end
end

Given(/I uncheck the following cuisines(.*?)/) do |cuisines|
    cuisines.split(/,\s*/).each do |cuisine|
    check("cuisines_#{cuisine}")
  end
end


When(/I press (.*?)/) do |arg1|
  click_button('cuisines_submit')
end

Then(/^I should see "(.*?)"$/) do |restaurants|
  restaurants.split(/,\s*/).each do |restaurant|
    page.all('table#restaurants tbody tr').should.match(/#{restaurant}/)
  end
end

Then(/^I should not see "(.*?)"$/) do |restaurants|
    restaurants.split(/,\s*/).each do |restaurant|
    page.all('table#restaurants tbody tr').should.not_match(/#{restaurant}/)
  end
end

Then /I should see all of the restaurants/ do
  # Get all the rows in the html table:
  rows = page.all('table#restaurants tbody tr').size
  rows.should == Restaurant.all.size
end

Then /I should see none of the restaurants/ do
  rows = page.all('table#restaurants tbody tr').size
  rows.should == 0
end