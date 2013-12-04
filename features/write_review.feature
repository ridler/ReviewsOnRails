Feature: write and save reviews
 
  As a user with opinions and extra time on my hands,
  so that I can express these opinions,
  I want to be able to write reviews and save them to a restaurant's page.

Background: restaurants and users have been added to database

  Given the following restaurants exist:

  | name                    | cuisine 		  |
  | Tahona Tequilla Bistro  | mexican       |
  | Garbanzo	              | mediterranean |
  | The Kitchen			        | american 	    |
  | McDonald's              | american	    |
  | PastaVino               | italian	      |
  | Brasserie Ten Ten       | french        |
  | Cafe Mexicali		        | mexican       |
  | Pei Wei		              | asian fusion  |

  Given the following users exist:

  | username | password |
  | tagg     | ridler  |
  | kristi   | entzel  |

  When I go to restaurants/1

Scenario: write a review for Tahona Tequilla Bistro
  When I follow "Write a new review"
  Then I should be on the new review page
  When I fill in "Stars" with 2
  And I fill in "Price" with 3
  And I fill in "Content" with "I AM A GIANT RAT"
  And I press "Save"
  Then I should be on the Tahona Tequilla Bistro page
  And I should see "I AM A GIANT RAT" under my username.