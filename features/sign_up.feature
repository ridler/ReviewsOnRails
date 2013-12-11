Feature: Sign up
        In order to store my reviews, as a user I should be able to sign up
Background:
        Given the following user exists:
        |username        |        password        |
        |RoofPizza        |        bitch                |


                Scenario: User signs in with valid data
                When I fill in "Username" with "RoofPizza"
                And I fill in "Password" with "bitch"
                And I press "Sign up!"
                Then I should see "Welcome! You are now signed up!"

                Scenario: User signs up with invalid/taken username
                When I fill in "Username" with invalid
                And I fill in "Password" with "bitch"
                And I press "Sign up!"
                Then I should see "Sorry, this username is already taken"

                Scenario: User signs up without password
                When I Fill in "Username" with "RoofPizza"
                And I press "Sign up!"
                Then I should see "Please enter a password"

                Scenario: User signs in without a username
                When I do not fill in "Username"
                And I press "Sign up!"
                Then I should see "Please enter a username"
