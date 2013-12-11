Feature: Signin

As a reviewing user, so that I can keep track of my reviews, I want to be able to sign into an account that will store my information.

Background:
        Given the following user exists:
        |username        |        password        |
        |RoofPizza        |        bitch                |


        Scenario: User is not signed up
        Given I do not exists a user
        When I fill in "Username" with "Whoopi"
        And I fill in "Password" with "goldfish"
        And I press "Sign in"
        Then I should see "sign-in unsuccesful"
        And I should be signed out

Scenario: User signs in successfully
        Given I exist as a user
        And I am not logged in
        When I fill in "Username" with "RoofPizza"
        And I fill in "Password" with "bitch"
        And I press "Sign in"
        Then I should see "Signed in"
        And I should be signed in

Scenario: User enters wrong password
        Given I exist as a user
        And I am not logged in
        When I fill in "Username" with "RoofPizza"
        And I fill in "Password" with "finegent"
        And I press "Sign in"
        Then I should see "invalid username/password"
        And I should be signed out


Scenario: User enters wrong username
        Given I exist as a user
        And I am not logged in
        When I fill in "Username" with "Brookie"
        And I fill in "Password" with "bitch"
        And I press "Sign in"
        Then I should see "invalid username/password"
        And I should be signed out

