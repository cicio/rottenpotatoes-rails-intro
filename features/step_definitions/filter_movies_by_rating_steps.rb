Then(/^I should see check boxes for all movie ratings$/) do
   Movie.all_ratings.each do |rating|
      expect(find('#ratings_form').find_field("ratings[#{rating}]", :type =>'checkbox'))
    end
  end

Then(/^the check boxes should be within an element with id:"(.*?)"$/) do |arg1|
  @all_ratings = Movie.all_ratings
  expect(find("##{arg1}"))
  within("##{arg1}") do
    @all_ratings.each do |rating|
      expect(find("#ratings_#{rating}"))
    end
  end
end

Given(/^I check the following boxes:"(.*?)"$/) do |ratings|
  visit movies_path
  ratings.split(/\W\s/).each do |rating|
    check("ratings[#{rating}]")
    expect(find_field("ratings[#{rating}]", :checked => true))
  end  
end

Then(/^I should see movie with rating "(.*?)"$/) do |string|
  tr = string.split(',')
  within("table#movies tbody") do
    expect(page).to have_content("#{tr[0]}")
    expect(page).to have_content("#{tr[1]}")
  end
end

Then(/^I should not see movie with rating "(.*?)"$/) do |string|
  tr = string.split(',')
  within("table#movies tbody") do
    expect(page).to have_no_content("#{tr[0]}")
    expect(page).to have_no_content("#{tr[1]}")
  end
end

Then(/^I should see checkboxes "(.*?)" as "(.*?)"$/) do |ratings, box_status|
  ratings.split(/\W\s/).each do |rating|
    box_status =~ /checked/ ? expect(page.has_checked_field?("ratings[#{rating}]")) :
                          expect(page.has_unchecked_field?("ratings[#{rating}]"))
    end
end
