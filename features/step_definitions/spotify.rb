When(/^I navigate to spotify$/) do
  Capybara.ignore_hidden_elements = true
  step %Q(I follow "Spotify")
  Capybara.ignore_hidden_elements = false
end

When(/^I should follow Add to my bill$/) do
      page.find("#subscription_chargeable_sign_up_button").click
        sleep 1
 end

Then(/^I check the terms and conditions page$/) do 
 step %Q{I check the styled checkbox "subscription__terms-and-conditions"}
end



And(/^I Click on Add to my bill button$/) do
	step %Q(I press "Add to my bill")
end

Then(/^I should see Spotify website registration page$/) do
  step %Q{I should see "Sign up for Spotify"}  
end

Then(/^I close the browser$/) do
  end

When(/^I should see Remove from my bill button$/) do
  step %Q{I should see "Remove from my bill"}
  sleep 3
end
