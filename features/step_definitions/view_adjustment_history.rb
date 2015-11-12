Then(/^I should see the adjustment history link$/) do
  step %Q{I should see "Adjustment history"}   
end

When(/^I click the adjustment history link$/) do
   click_link("Adjustment history")
end

Then(/^I should see adjustment history$/) do
  with_scope('.outer-container') do
   expect(page).to have_content 'Adjustment history'
  end    
end

Then(/^I click "(.*?)" button if exist on adjustment history page$/) do |button_name|
   Capybara.ignore_hidden_elements = true
   while page.has_css?('.adjustment-history__display-more') do
          click_button(button_name) 
   end   
   Capybara.ignore_hidden_elements = false
end
