Given(/^the following movies exist:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |movie|
    Movie.create(movie)
    @movies = Movie.all
  end
end

Then(/^I should be on the "(.*?)" page$/) do |page|
  page =~ /index/ ? (expect(current_path).to eq movies_path) : (expect(current_path).to eq movies_path(page)) 
end 

When(/^I (?:visit|am on) the "(.*?)" page$/) do |link|
  visit movies_path if link =~ /index/
  visit movies_path(link)
end

Then(/^I should see link for "(.*?)" and "(.*?)" within "(.*?)"$/) do |link1, link2, scope|
  within(scope) do
    expect(find_link(link1))
    expect(find_link(link2))
  end
end

Then(/^I should see "(.*?)" within "(.*?)"$/) do |col, scope|
  within(scope) do
    expect(has_text?(col))
  end
end

Then(/^I should not see "(.*?)" within "(.*?)"$/) do |string, scope|
  within(scope) do
    expect(has_no_text?(string))
  end
end


When(/^I click on "(.*?)"$/) do |link1|
  click_on(link1)
  expect(current_path).to eq movies_path
end


Given(/^I have clicked to sort by "(.*?)" from the "(.*?)" page$/) do |link, path|
  steps %Q{
  			Given I am on the "#{path}" page
  			When I click on "#{link}"
  			Then I should be on the "#{path}" page
  			}
end

Then(/^I should see "(.*?)" before "(.*?)"$/) do |string1, string2|
  regexp = /#{string1}.*#{string2}/m
  within_table('movies') do
    expect(assert_text(:all, regexp)).to eq true
  end
end

When(/^I sort the movies by "(.*?)"$/) do |sort_criteria|
  if sort_criteria =~ /title/
    click_link("Movie Title")
    @movies=Movie.all.order('title')
  elsif sort_criteria =~ /release_date/
    click_link("Release Date")
    @movies = Movie.all.order('release_date')
  end
end

Then(/^I should see the "(.*?)" background color as "(.*?)"$/) do |column_header, color|
  expect(find('table#movies').find('th.hilite'))
end

