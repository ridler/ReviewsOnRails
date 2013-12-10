Feature: Edit location
        As a user of the website
        so that I can use the website to find restaurants in my location
        I want to be able to change my location

Background:
        Given the following user exists:
        |username        |        password        |
        |RoofPizza        |        bitch                |

        
Scenario: I am signed in
        Given I am logged in
        When I press "Edit location"
        Then I should see "Your Location"
        When I press "Save"
        Then I should see "Location updated successfully"
