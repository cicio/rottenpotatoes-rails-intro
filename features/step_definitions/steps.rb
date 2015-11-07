Given(/^the following movies exist:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |movie|
    @movie = movie
    #@movie = Movie.create!(movie)
  end
end

When(/^I visit the "(.*?)" page$/) do |link|
  visit movies_path if link =~ /index/
  visit movies_path(link)
end



Then(/^I should see a "(.*?)" and "(.*?)" Links within "(.*?)"$/) do |arg1, arg2, arg3|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see "(.*?)" within "(.*?)" without a link$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

