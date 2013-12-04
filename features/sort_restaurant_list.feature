Feature: display the list of restaurants filtered by cuisine
 
  As a user who wants to find information about restaurants,
  so that I can find a restaurant with food either in my desired price range or quality level,
  I want to be able to sort restaurants py price or rating.

Background: restaurants have been added to database

  Given the following restaurants exist:

  | name                    | cuisine       | averageRating | averagePrice |
  | Tahona Tequilla Bistro  | mexican       | 4             | 5            |
  | Garbanzo                | mediterranean | 4             | 2            |
  | The Kitchen             | american      | 1             | 5            |
  | McDonald's              | american      | 2             | 1            |
  | PastaVino               | italian       | 3             | 4            |
  | Brasserie Ten Ten       | french        | 4             | 3            |
  | Cafe Mexicali           | mexican       | 3             | 2            |
  | Pei Wei                 | asian fusion  | 3             | 2            |

  When I go to restaurants

Scenario: sort restaurants by rating
  When I follow "Rating"
  Then I should see "Tahona Tequilla Bistro" before "Brasserie Ten Ten"
  And I should see "Brasserie Ten Ten" before "Garbanzo"
  And I should see "Garbanzo" before "PastaVino"
  And I should see "PastaVino" before "Cafe Mexicali"
  And I should see "Cafe Mexicali" before "Pei Wei"
  And I should see "Pei Wei" before "McDonald's"
  And I should see "McDonald's" before "The Kitchen"

Scenario: sort restaurants by price
  When I follow "Price"
  Then I should see "McDonald's" before "Cafe Mexicali"
  And I should see "Cafe Mexicali" before "Garbanzo"
  And I should see "Garbanzo" before "Pei Wei"
  And I should see "Pei Wei" before "Brasserie Ten Ten"
  And I should see "Brasserie Ten Ten" before "PastaVino"
  And I should see "PastaVino" before "Tahona Tequilla Bistro"
  And I should see "Tahona Tequilla Bistro" before "The Kitchen"