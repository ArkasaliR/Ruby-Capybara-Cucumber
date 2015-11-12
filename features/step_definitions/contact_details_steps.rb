When(/^I update the (customer|billing) contact details with the following$/) do |address_type,table|
  Capybara.ignore_hidden_elements = true
  fill_form_contact(address_type,table)
  Capybara.ignore_hidden_elements = false
end

def fill_form_contact(address_type,table)
  row = table.hashes.first

  step %Q{I fill in "emailAddressId" with "#{row['Contact Email']}"}   if row['Contact Email']
  step %Q{I fill in "phoneNumberId" with "#{row['Mobile Phone']}"}   if row['Mobile Phone']
  step %Q{I fill in "homeNumberId" with "#{row['Home Phone']}"}  if row['Home Phone']
  step %Q{I fill in "workNumberId" with "#{row['Work Phone']}"}  if row['Work Phone']
  update_address_form(address_type, row) 

end

def update_address_form(address_type, row)
  if address_type=="billing"
    step %Q{I select "#{row['Country Name']}" from "billingAddCountryId"}  if row['Country Name']
    if "#{row['Country Name']}" == "Australia"
      update_australian_address(address_type, row)
    else
      update_international_address(address_type, row)
    end
  else
    update_australian_address(address_type, row)
  end
end

def update_australian_address(address_type, row)
    step %Q{I select "#{row['Floor Type']}" from "#{address_type}AddFloorTypeId"}  if row['Floor Type']
    step %Q{I fill in "#{address_type}AddFloorNumberId" with "#{row['Floor Number']}"}  if row['Floor Number']
    step %Q{I fill in "#{address_type}AddStreetNumberId" with "#{row['Street Number']}"}  if row['Street Number']
    step %Q{I fill in "#{address_type}AddStreetNameId" with "#{row['Street Name']}"}  if row['Street Name'] 
    step %Q{I fill in "#{address_type}AddCityId" with "#{row['City']}"}  if row['City']
    step %Q{I fill in "#{address_type}AddPostcodeId" with "#{row['Postcode']}"}  if row['Postcode']
    step %Q{I fill in "#{address_type}AddCareOfId" with "#{row['Care of']}"}  if row['Care of']
    step %Q{I select "#{row['Street Type']}" from "#{address_type}AddStreetTypeId"} if row['Street Type']
    step %Q{I select "#{row['State']}" from "#{address_type}AddStateId"}  if row['State']
end

def update_international_address(address_type, row)
  step %Q{I fill in "#{address_type}AddLine1Id" with "#{row['Address Line1']}"}  if row['Address Line1']
  step %Q{I fill in "#{address_type}AddLine2Id" with "#{row['Address Line2']}"}  if row['Address Line2']
  step %Q{I fill in "#{address_type}AddCityId" with "#{row['City']}"}  if row['City']
end

When(/^I should see the (customer|billing) contact details with the following$/) do |address_type,table|
  Capybara.ignore_hidden_elements = true
  check_form(address_type,table)
  Capybara.ignore_hidden_elements = false
end

def check_form(address_type,table)
  row = table.hashes.first

  step %Q{the "emailAddressId" field should contain "#{row['Contact Email']}"}   if row['Contact Email']
  step %Q{the "phoneNumberId" field should contain "#{row['Mobile Phone']}"}   if row['Mobile Phone']
  step %Q{the "homeNumberId" field should contain "#{row['Home Phone']}"}  if row['Home Phone']
  step %Q{the "workNumberId" field should contain "#{row['Work Phone']}"}  if row['Work Phone']
  check_address_form(address_type, row) 

end

def check_address_form(address_type, row)
  step %Q{the "#{address_type}AddFloorTypeId" field should contain "#{row['Floor Type']}"}  if row['Floor Type']
  step %Q{the "#{address_type}AddFloorNumberId" field should contain "#{row['Floor Number']}"}  if row['Floor Number']
  step %Q{the "#{address_type}AddStreetNumberId" field should contain "#{row['Street Number']}"}  if row['Street Number']
  step %Q{the "#{address_type}AddStreetNameId" field should contain "#{row['Street Name']}"}  if row['Street Name']
  step %Q{the "#{address_type}AddCityId" field should contain "#{row['City']}"}  if row['City']
  step %Q{the "#{address_type}AddPostcodeId" field should contain "#{row['Postcode']}"}  if row['Postcode']
  step %Q{the "#{address_type}AddCareOfId" field should contain "#{row['Care of']}"}  if row['Care of']
  step %Q{the "#{address_type}AddStreetTypeId" field should contain "#{row['Street Type']}"}  if row['Street Type']
  step %Q{the "#{address_type}AddStateId" field should contain "#{row['State']}"} if row['State']
end

Then(/^I uncheck the postal address checkbox$/) do
  step %q{I uncheck the styled checkbox "postalAddressId"}
end

Then(/^I check the postal address checkbox$/) do
  step %q{I check the styled checkbox "postalAddressId"}
end

When(/^I leave all my contact phone numbers blank and attempt to save$/) do 
  step %Q{I fill in "homeNumberId" with ""}
  step %Q{I fill in "workNumberId" with ""}
  step %Q{I press "Save Settings"}
end

When(/^I leave my mobile number blank as "(.*?)" and attempt to save$/) do |msisdn_type|
  step %Q{I fill in "homeNumberId" with ""}
  step %Q{I fill in "workNumberId" with "#{get_msisdn_data(msisdn_type, 'work_phone')}"}
  step %Q{I press "Save Settings"}
end

When(/^I leave my other number blank as "(.*?)" and attempt to save$/) do |msisdn_type|
  step %Q{I fill in "homeNumberId" with "#{get_msisdn_data(msisdn_type, 'home_phone')}"}
  step %Q{I fill in "workNumberId" with ""}
  step %Q{I press "Save Settings"}
end

Then(/^I should not see error messages to enter at least 1 phone number$/) do
  step %Q{I should not see "#{I18n.t('contact_details.index.my_address.validate_message.either')}"}
  step %Q{I should not see "#{I18n.t('contact_details.index.my_address.validate_message.either')}"}
end

Then(/^I should be informed I need to enter at least 1 phone number$/) do
  step %Q{I should see "#{I18n.t('contact_details.index.my_address.validate_message.either')}"}
  step %Q{I should see "#{I18n.t('contact_details.index.my_address.validate_message.either')}"}
end

Then(/^I should see empty fields validation errors$/) do  
  page.should have_content I18n.t('contact_details.index.title')
  
  step %Q{I should see "#{I18n.t('contact_details.index.my_address.validate_message.either')}"}
  step %Q{I should see "#{I18n.t('contact_details.index.my_address.validate_message.either')}"}
  step %Q{I should see "#{I18n.t('contact_details.index.my_address.validate_message.email')}"}
  step %Q{I should see "#{I18n.t('contact_details.index.my_address.validate_message.street_no')}"}
  step %Q{I should see "#{I18n.t('contact_details.index.my_address.validate_message.street_name')}"}
  step %Q{I should see "#{I18n.t('contact_details.index.my_address.validate_message.street_type')}"}
  step %Q{I should see "#{I18n.t('contact_details.index.my_address.validate_message.city')}"}
  step %Q{I should see "#{I18n.t('contact_details.index.my_address.validate_message.postcode')}"}
 end

 Then (/^I should see validation errors$/) do 
  page.should have_content I18n.t('contact_details.index.title')

  step %Q{I should see "#{I18n.t('contact_details.index.my_address.validate_message.phone_number')}"}
  step %Q{I should see "#{I18n.t('contact_details.index.my_address.validate_message.both')}"}
  step %Q{I should see "This value should be a valid email." within ".type"}
 end

Then(/^I should see Good news page Success message$/) do 
  step %Q{I should see "#{I18n.t('contact_details.index.update.success.message')}"}
end

Then(/^I should see the generic validation error$/) do
  step %Q{I should see "#{I18n.t('contact_details.index.update.validation_error.generic')}"}
end

When(/^I click the Manage Details button$/) do
  find("#back-to-details").click
end

When(/^I navigate to Contact Details page$/) do
  step %Q(I navigate to the Account Settings page)
  step %Q(I follow "#{I18n.t 'account_settings.index.account.manage_contact_details'}")
end

And(/^I should not see a menu item for Contact Details$/) do
  page.should_not have_selector( "#main_navigation_contact_details", :text => I18n.t('side_navigation.contact_details') )
end

Then /^I should see a link to Manage billing options$/ do
  step %Q{I should see "#{I18n.t 'contact_details.index.my_details.bill_options'}"}
end

Then(/^I save the Contact Details settings$/) do
  Capybara.ignore_hidden_elements = true
  step %Q{I press "#{I18n.t 'roaming.show.save_settings'}"}
  Capybara.ignore_hidden_elements = false
end

When (/^I test the street types$/) do 
  %w(
Square
Way
).each { |street_type|
  steps %Q(
    When I select "#{street_type}" from "customerAddStreetTypeId"
    And I save the Contact Details settings
    And I should see Good news page Success message
    And I click the Manage Details button
    )}
end
