When(/^I navigate to Data Control$/) do
  Capybara.ignore_hidden_elements = true
  step %Q(I follow "Access data control")
  Capybara.ignore_hidden_elements = false
end

And(/^I click the quick link in My usage page$/)do
    eventually {
    page.find('Access data control').click
  }
end

Then(/^I click the data usage slider$/) do
  Capybara.ignore_hidden_elements = true
  step %Q(I follow "View data usage")
  Capybara.ignore_hidden_elements = false
end

And(/^I select ME icon$/) do
page.should have_selector("a[class='weblock-btn']")

find("a[class='spl-btn spl-btn-small spl-btn-purple']").click
end


And(/^I click the weblock button$/) do
   step %Q(I press "Weblock")
end

Then(/^I should see all my shared accounts under Myservice and Otherservice label$/) do
  
end

Given(/^I directed to My usage page$/) do
  
end

Then(/^I should see the selected msisdn$/) do
  
end

Then(/^I return to My usage page$/) do
  
end

Then(/^I shouldn't see Data Control in Account Settings$/) do
  
end

Then(/^I shouldn't see Data Control Quick Link in My usage$/) do
  
end

Then(/^I shouldn't see Data Control Button$/) do
  
end

And(/^I click the save button to update weblock setting$/) do
  page.find('#data-control-save').click
end

When(/^I click the data control link for "(.*?)"$/) do |msisdn|  

end

When(/^I click the data control link for first child msisdn$/) do
  Capybara.ignore_hidden_elements = true
   page.should have_selector("a[class='link-list link-list-data-control']")
   find('#61401103463').click
   Capybara.ignore_hidden_elements = false
end

When(/^I click the data control link of parent msisdn$/) do
  
  page.find(".sharing-data-control__current-msisdn").click
  step %Q{I wait 2 seconds}
end

Then(/^I should see the blocked data status and the toggle to unblock$/) do
  eventually {
    step %Q{I wait 2 seconds}
    page.should have_selector('.data-control-settings', text: /#{I18n.t 'weblock.show.text.blocked'}/)
    page.should have_selector('.toggle-switch')
  }
end

Then(/^I should see the active data status and the toggle to block$/) do
   step %Q{I wait 2 seconds}
end

When(/^I toggle the data_control setting to active$/) do
  page.find('#data_control').click
  step %Q{I wait 2 seconds}
end

When(/^I toggle the data_control setting to blocked$/) do
  page.find('#data_control').click
  step %Q{I wait 2 seconds}
end

Then(/^I should see the success message for weblock update$/) do
  eventually {
    page.should have_selector('.spl-message-green', text: "#{I18n.t 'weblock.show.update.success_message'}")
    step %Q{I wait 2 seconds}
  }
end

And(/^I click the first help and support link$/) do
  Capybara.ignore_hidden_elements = true
  step %Q(I follow "How to switch data on or off through My Vodafone")
  step %Q{I wait 2 seconds}
  Capybara.ignore_hidden_elements = false
end

Then(/^I click the second help and support link$/) do
  Capybara.ignore_hidden_elements = true
  step %Q(I follow "Manage data usage on your phone")
  step %Q{I wait 2 seconds}
  Capybara.ignore_hidden_elements = false
end

Then(/^I click the third help and support link$/) do
  Capybara.ignore_hidden_elements = true
  step %Q(I follow "How to turn data roaming on or off")
  step %Q{I wait 2 seconds}
  Capybara.ignore_hidden_elements = false
end

Then(/^I click the fourth help and support link$/) do
  Capybara.ignore_hidden_elements = true
  step %Q(I follow "Why isn’t my internet working?")
  step %Q{I wait 2 seconds}
  Capybara.ignore_hidden_elements = false
end