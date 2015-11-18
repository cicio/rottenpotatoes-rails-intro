Feature: Filter the list of movies by rating 

	As a parent of movie loving children
	In order to allow the children to select age appropriate movies
	I want to be able to filter movie list by ratings
	
	Background:
	Given the following movies exist:
    |title                  |rating |release_date   |
    |Inception				|PG-13	|2010-07-16		|
    |It's Complicated		|R		|2009-12-25		|
    |SaaS The Movie			|G		|2012-01-14		|
    |Cicio The SaaSy		|PG		|2015-01-14		|
	
	
Scenario: Add checkboxes for filtering the list of movies
	  When I visit the "index" page
	  Then I should see check boxes for all movie ratings
	  And the check boxes should be within an element with id:"ratings_form"
	  
	  
Scenario: Show only movies with selected MPAA ratings
      Given I check the following boxes:"G, PG"
      When I click on "Refresh"
      Then I should see "Cicio The SaaSy" within "tbody"
      And I should see "SaaS The Movie" within "tbody"
      But I should not see "Inception" within "tbody"
      And I should not see "It's Complicated" within "tbody"
      And I should see checkboxes "G, PG" as "checked"
      And I should see checkboxes "R, PG-13" as "unchecked"
      
Scenario: Selected movies by rating should not alter the displayed order
	 Given I visit the "index" page
	 When I sort the movies by "title"
	 And I check the following boxes:"G, PG-13"
	 And I click on "Refresh"
	 Then I should see the "title_header" background color as "yellow"
	 And I should see "Cicio The SaaSy" before "SaaS The Movie"
	 And I should see checkboxes "G, PG-13" as "checked"
	 And I should see checkboxes "PG, R" as "unchecked"       
      

      
	  
	
