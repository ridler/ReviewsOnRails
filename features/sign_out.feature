Feature: Sign out
        As a user, in order to protect my information I shoudl be able to sign out

        Background:
        Given the following user exists:
        |username        |        password        |
        |RoofPizza        |        bitch                |

        Scenario: User Signs out
        Given I am logged in
        When I press "Sign out"
        Then I should see "Sign out successfull"
        And I should be signed out
