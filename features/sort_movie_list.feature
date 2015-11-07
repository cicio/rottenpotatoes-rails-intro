Feature: Sort List of Movies

	As a movie's Reviewer
	I want the movies sorted alphabetically
	In order to easily find the movies I want to review
	
	Background:
	Given the following movies exist:
    |Movie Title            |Rating |Release Date   |
    |Inception				|PG-13	|2010-07-16		|
    |It's Complicated		|R		|2009-12-25		|
    |SaaS The Movie			|G		|2012-01-14		|
	
	
	Scenario: Enabling Movies Table Column Headers as Links
	  When I visit the "index" page
	  Then I should see a "Movie Title" and "Release Date" Links within "table head"
	  But  I should see "Rating" within "table head" without a link
	
    
    