Feature: display the list of restaurants filtered by cuisine
 
  As a user who wants to find information about restaurants,
  so that I can find a restaurant with food I like,
  I want to be able to filter the restaruants by cuisine

Background: restaurants have been added to database

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

  When I go to restaurants
  
Scenario: restrict to 'mexican' and 'italian' restaurants
  # enter step(s) to check the italian and mexican cuisines
  Given I check the following cuisines: italian, mexican
  # enter step(s) to uncheck all other checkboxes
  And I uncheck the following cuisines: mediterranean, asian fusion, french, american
  # enter step to "submit" the search form on the homepage
  When I press "Refresh"
  # enter step(s) to ensure that mexican and italian restaurants are visible
  Then I should see "Tahona Tequilla Bistro"
  And I should see "Cafe Mexicali"
  And I should see "PastaVino"
  # enter step(s) to ensure that other restaurants are not visible
  And I should not see "Brasserie Ten Ten"
  And I should not see "Pei Wei"
  And I should not see "Garbanzo"
  And I should not see "McDonald's"
  And I should not see "The Kitchen"

Scenario: no ratings selected
  When I uncheck the following cuisines: mediterranean, asian fusion, french, american, italian, mexican
  And I press "Refresh"
  Then I should see some of the restaurants.

Scenario: all ratings selected
  When I check the following cuisines: mediterranean, asian fusion, french, american, italian, mexican
  And I press "Refresh"
  Then I should see all of the restaurants.