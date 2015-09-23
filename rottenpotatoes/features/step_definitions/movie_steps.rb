# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create(movie)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
   #fail "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  its_sorted = false
  aString = page.body.to_s 
       if aString.index(e1)!= nil && aString.index(e2) !=nil
               if aString.index(e1) < aString.index(e2)
                its_sorted = true
               end
       end
       its_sorted.should be true
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  #fail "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  ratings = rating_list.split(%r{,\s*})
  if uncheck
    ratings.each do |r|
      step "I uncheck \"ratings_#{r}\""
    end
  else
    ratings.each do |r|
      step "I check \"ratings_#{r}\""
    end
  end
end

When(/^I press submit button on home page$/) do
  step "I press \"Refresh\""
end

Then(/^I should see movies with PG and R ratings$/) do
  step "I should see \"PG\""
  step "I should see \"R\""
end

Then(/^I should not see other movies$/) do
  step "I should see \"PG-13\""
  step "I should see \"G\""
end


Then /I should see all the movies/ do
    Movie.count(:all).should == 10
  # Make sure that all the movies in the app are visible in the table
  #fail "Unimplemented"
end
