Given(/^the following user exists:$/) do |table|
        User.create(user)
        
        end


Given /^I am not logged in$/ do
        visit '/users/sign_out'
end

Given /^I am logged in$/ do
end
Given /^I exist as a user$/ do
        User.create(user)
        end
     


When(/^(?:|I )go to (.+)$/) do |page_name|
        visit("/#{page_name}")
end




