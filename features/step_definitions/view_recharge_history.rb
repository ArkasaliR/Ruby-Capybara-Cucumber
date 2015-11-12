Then(/^I should see the recharge history link$/) do
  with_scope('.outer-container') do
    expect(page).to have_content 'Recharge History'
	end
end

Then(/^I click on the recharge history link$/) do
  click_link ('Recharge History')
end


Then(/^I should see the recharge history link under Quick links in My usage page$/) do
  with_scope('.outer-container') do
 expect(page).to have_content 'Recharge History'
end
end

Then(/^I click on Recharge button in the My usage page$/) do
  with_scope('.height-helper') do
  click_link ('Recharge')
end
end

Then(/^I should see the recharge history title$/) do
	with_scope('.outer-container') do
    expect(page).to have_content('Recharge history')
 end
end


Then(/^I should see the download csv icon$/) do
  expect(page.find('#recharge_history--download-csv')).to be_visible
end


Then(/^I should see the number of records showing$/) do
  expect(page.find('.recharge-history--records-header')).to be_visible
end

 And(/^I click "(.*?)" button if exist on recharge history page$/) do |button_name|
   Capybara.ignore_hidden_elements = true
   while page.has_css?('.recharge-history__display-more') do
          click_button(button_name) 
   end   
   Capybara.ignore_hidden_elements = false
end

Then(/^I should see Quick links$/) do
  with_scope('.outer-container') do
    expect(page).to have_content('Quick Links')
end
end

Then(/^I should see Help & Support links$/) do
with_scope('.outer-container') do
  expect(page).to have_content('Help & support')
end
end





