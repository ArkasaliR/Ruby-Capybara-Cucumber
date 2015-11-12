Then(/^I should see the subscription selection page$/) do
  step %Q{I should see "Free Spotify Premium"}
  step %Q{I should see "Valued at $11.99 per month"}
  step %Q{I should see "Free subscription to The Sydney Morning Herald or The Age"}
  step %Q{I should see "Valued at $15 per month"}
  expect(page).to have_selector('.portal-selection__fairfax', :visible => true)
  expect(page).to have_selector('.portal-selection__spotify', :visible => true)
end

When(/^I select fairfax subscription$/) do
  step %Q{I follow "Get SMH or The Age"}
end

Then(/^I should see fairfax landing page with "(.*?)" option$/) do |months|
  step %Q{I should see "#{months}"}
  step %Q{I should see "The Sydney Morning Herald"}
  step %Q{I should see "Valued at $15 per month"}
  step %Q{I should see "Get SMH or The Age"}
end

When(/^I select choose different offer option$/) do
  step %Q{I follow "Choose a different offer"}
end

When(/^I select spotify subscription$/) do
  step %Q{I follow "Get Spotify Premium"}
end

Then(/^I should see spotify landing page with "(.*?)" option$/) do |months|
  step %Q{I should see "#{months}"}
  step %Q{I should see "What is Spotify Premium?"}
  step %Q{I should see "Get Spotify Premium now"}
end

Then(/^I should see the subscription ineligible page$/) do
step %Q{I should see "Sorry, you're not eligible for this offer."}
end

Then(/^I should see the subscription activated page$/) do
step %Q{I should see "It looks like you’ve already activated this offer."}
end

Then(/^I check the terms and conditions page and Click on Get fairfax button$/) do
  step %Q{I check the styled checkbox "subscription__terms-and-conditions"}
  step %Q(I press "Get SMH or The Age")
end

Then(/^I should see Fairfax website registration page$/) do
  step %Q{I should see "Subscribe"}
  step %Q{I should see "The Sydney Morning Herald"}
end

Then(/^I verify Spotify termsandconditions$/) do
  step %Q{I Press the termsandconditions title ".subscription__terms-and-conditions__title"}
  step %Q{I should see "who receive the Service at no subscription cost for a limited period."}
end

Then(/^I verify Stan termsandconditions$/) do
  step %Q{I Press the termsandconditions title ".subscription__terms-and-conditions__title"}
  step %Q{I should see "This offer cannot be used on a pre-existing Stan account that is billed via iTunes"}
end


Then(/^I verify Fairfax termsandconditions$/) do
  step %Q{I Press the termsandconditions title ".subscription__terms-and-conditions__title"}
  step %Q{I should see "To start using the Service, you must register and accept the Fairfax Media"}
end


Then(/^I check the terms and conditions page and Click on Get Get Spotify Premium button$/) do
  step %Q{I check the styled checkbox "subscription__terms-and-conditions"}
  step %Q(I press "Get Spotify Premium now")
end

Then(/^I should see Spotify Premium website registration page$/) do
  step %Q{I should see "Connect Vodafone to your Spotify account."}
end

When (/^I clear cookies$/) do
  browser = Capybara.current_session.driver.browser
  browser.manage.delete_all_cookies
end

When(/^I select STAN subscription$/) do
  step %Q{I follow "Get Stan access"}
end


Then(/^I should see STAN landing page with "([^"]*)" option$/) do |months|
  step %Q{I should see "#{months}"}
  step %Q{I should see "What's so great about Stan"}
  step %Q{I should see "Get Stan now"}
end

Then(/^I should see STAN website registration page$/) do
  step %Q{I should see "Stan."}
end

Then(/^I check the terms and conditions page and Click on Get Stan button$/) do
  step %Q{I check the styled checkbox "subscription__terms-and-conditions"}
  step %Q(I press "Get Stan now")
end