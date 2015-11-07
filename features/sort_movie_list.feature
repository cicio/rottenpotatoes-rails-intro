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
	
    
    