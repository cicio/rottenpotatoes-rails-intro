Feature: Sort List of Movies

	As a movie's Reviewer
	In order to easily find the movies I want to review
	I want to sort the movies by title or release date in ascending order
	
	

	
	Background:
	Given the following movies exist:
    |title                  |rating |release_date   |
    |Inception				|PG-13	|2010-07-16		|
    |It's Complicated		|R		|2009-12-25		|
    |SaaS The Movie			|G		|2012-01-14		|
	
	
Scenario: Make the column headings for "Movie Title" and "Release Date" into clickable links
	  When I visit the "index" page
	  Then I should see link for "Movie Title" and "Release Date" within "thead"
	  But  I should see "Rating" within "thead"
	
Scenario: Clicking "Movie Title" reloads movies sorted in ascending order by title.
	  Given I have clicked to sort by "Movie Title" from the "index" page
	  Then I should see "Inception" before "It's Complicated"
      And I should see "It's Complicated" before "SaaS The Movie"
      
      
Scenario: Clicking "Release Date" reloads movies sorted in ascending order by release date.
	  Given I have clicked to sort by "Release Date" from the "index" page
	  Then I should see "It's Complicated" before "Inception"
      And I should see "It's Complicated" before "SaaS The Movie"
      
Scenario: Highlight sorting column head with Yellow background color
      Given I am on the "index" page
      When I sort the movies by "title"
      Then I should see the "title_header" background color as "yellow"
      When I sort the movies by "release_date"
      Then I should see the "release_date_header" background color as "yellow"