Given(/^the following movies exist:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |movie|
    Movie.create(movie)
    @movies = Movie.all
  end
end

When(/^I visit the "(.*?)" page$/) do |link|
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
  #fields = find_field(
  within(scope) do
    expect(has_text?(col))
  end
end


