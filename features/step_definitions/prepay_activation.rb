When(/^I start activation$/) do
  step %Q{I press "process_1_btn"}
end

And (/^I provide Activation Key and Pin and Check SIM$/) do
  activation_key ="#{ENV['KEY']}"
  activation_pin = "#{ENV['PIN']}"
  if activation_key.blank? || activation_pin.blank?
    raise Exception, "Please provide activation KEY and PIN."
  else
    step %Q{I fill in "activation_key" with "#{activation_key}"}
    step %Q{I fill in "pin" with "#{activation_pin}"}
    step %Q{I press "process_2_btn"}
  end
end

When /^I enter new activation pin "(.*?)"$/ do |pin|
  fill_in 'new-pin', :with => pin
  fill_in 'confirm-pin', :with => pin
end

Then (/^I press Continue button$/) do
  step %Q{I press "process_2a_btn"}
end

When(/^I fill the personal details with the following$/) do |table|
  Capybara.ignore_hidden_elements = true
  fill_form_dealer(table)
  Capybara.ignore_hidden_elements = false
end

When(/^I should see qas address with the following$/) do |table|
  Capybara.ignore_hidden_elements = true
  check_qas_address(table)
  Capybara.ignore_hidden_elements = false
end

def fill_form_dealer(table)
  row = table.hashes.first
  update_about_you_dealer(row)
end

def check_qas_address(table)
  row = table.hashes.first
  verify_qas_address(row)
end

def update_about_you_dealer(row)
  step %Q{I select "#{row['Title']}" from "title"} if row['Title']
  step %Q{I fill in "first_name" with "#{row['First Name']}"}  if row['First Name']
  step %Q{I fill in "last_name" with "#{row['Last Name']}"}  if row['Last Name']
  step %Q{I select "#{row['Gender']}" from "gender"} if row['Gender']
  step %Q{I select "#{row['Contact type']}" from "alt_contact_type"} if row['Contact type']
  sleep(1)
  step %Q{I fill in "alt_contact_number" with "#{row['Contact number']}"}  if row['Contact number']
  step %Q{I fill in "email" with "#{row['Email']}"}  if row['Email']
  step %Q{I fill in data mask "dob" with "#{row['DOB']}"}  if row['DOB']
  step %Q{I fill in "address-QAS-input" with "#{row['Address']}"}  if row['Address']
end

Then (/^I should see (\d+) available numbers$/) do |number|
  expect(page).to have_css ".numbers-container li", count: number.to_i
end

Then (/^I should see "(.*?)" step$/) do |text|
  expect(page).to have_css ".process h2", text: text
end

Then (/^I should see the activation success message$/) do
  expect(page).to have_css "h2" , text: "So what happens now?", visible: true
end


def verify_qas_address(row)
  expect(page).to have_css ".qas-menu"
  step %Q{I should see "#{row['Address line']}" within ".qas-menu"}
end

When (/^(?:|I )fill in data mask "([^\"]*)" with "([^\"]*)"?$/) do |field, value|
  page.execute_script %{ $("##{field}").val("#{value}").trigger("change"); }
end

When (/^I select "([^"]*)" from qas$/) do |entry|
  expect(page).to have_css ".qas-menu"
  sleep (4)
  within ".qas-menu" do
    page.first(:xpath, '//li[contains(., "'"#{entry}"'")]').click;
  end
  sleep (3)
end

Then (/^I press Continue About you button$/) do
  sleep (5)
  find('button#personal-information__submit.btn-primary').click
end

When (/^I expand "(.*?)" collapsible$/) do |text|
  expect(page).to have_css ".vha-collapse-directive.collapsed", text: text

  collapse = page.find ".vha-collapse-directive", text: text
  collapse.find(".header").click

  expect(page).to have_no_css ".vha-collapse-directive.collapsed", text: text
end

When (/^I click continue button in the number selection block$/) do
  within "#step_select_number" do
    page.find_link("Continue").click
  end
end

When (/^I fill the existing mobile number details with the following$/) do |table|
  fill_existing_mobile_number_form(table)
end

def fill_existing_mobile_number_form(table)
  row = table.hashes.first
  update_existing_mobile_number(row)
end

def update_existing_mobile_number(row)
  within "#activation_porting #porting-details-form" do
    step %Q{I fill in "porting_number" with "#{row['Porting Number']}"}  if row['Porting Number']
    step %Q{I select "#{row['Current Provider']}" from "current_provider"} if row['Current Provider']
    postpaid_radio = page.find('.account_type')
    postpaid_radio.choose('service_type_'+"#{row['Account type']}") if row['Account type']
  end
end


When (/^I accept all the T&C to port existing mobile number$/) do
  page.execute_script('$("#tnc1").click()')
  page.execute_script('$("#tnc2").click()')
end

When (/^I click continue button in the existing mobile number block$/) do
  sleep 2
  page.find("#process_4_btn").click
end

When (/^I select a number in the number selection block$/) do
  expect(page).to have_css ".numbers-container"

  within "#step_select_number .numbers-container" do
    page.first("li", text: "04").click
  end
end

Then (/^I check T&C checkboxes$/) do
  Capybara.ignore_hidden_elements = true

  within "#step_confirm" do
    page.find("label[for='tc-checkbox1']").click
    page.find("label[for='tc-checkbox2']").click
  end

  Capybara.ignore_hidden_elements = false
end

When(/^I confirm prepay activation$/) do
  within "#step_confirm" do
    page.find_link("Confirm").click
  end
end

Then (/^I get error messages to accept the T&C to port existing mobile number$/) do
  within ".porting_tnc" do
    expect(page).to have_css('.tnc_error', :text => "Please accept the T&Cs")
  end
end

Then (/^I should see an error message to accept T&cs$/) do
   expect(page).to have_css ".alert"
end

Then(/^I select Drivers Licence as id$/) do
  find('#identification_type').find(:xpath, 'option[0]').select_option
 end

 Then(/^I fill in my "(.*?)" details as proof of id$/) do |id_flag, table|
    row = table.hashes.first

    step %Q{I select "#{row['Identification type']}" from "identification_type"} if row['Identification type']
    step %Q{I fill "reference_number" with "#{row['Reference number']}"} if row['Reference number']
    
    if id_flag == 'Passport'

      step %Q{I fill in data mask "expiry_date" with "#{row['Expiry date']}"} if row['Expiry date']
      step %Q{I select "#{row['Country']}" from "issuing_country_code"} if row['Country']
    
    elsif id_flag == 'Medicare Card'
      step %Q{I fill in data mask "freeform_expiry_date" with "#{row['Expiry date']}"} if row['Expiry date']
      step %Q{I fill in data mask "individual_reference_number" with "#{row['Row']}"} if row['Row']
      step %Q{I select "#{row['Medicare card colour']}" from "medicare_card_colour"} if row['Medicare card colour']
      #step %Q{I fill in "input[ng-model='registrationData.middle_name']" with "#{row['Middle name']}"} if row['Middle name']
      step %Q{I enter middle name with "#{row['Middle name']}"} if row['Middle name']

    else
      step %Q{I fill in data mask "expiry_date" with "#{row['Expiry date']}"} if row['Expiry date']
      step %Q{I select "#{row['State']}" from "issuing_location"} if row['State']
  end
end

Then(/^I click the document verification continue button$/) do
  step %Q{I press "Continue" within "#activation_step_document_verification"}
end

Then(/^I should see message id has been verified$/) do
  step %Q{I should see "Your I.D. has been verified."}
end

When(/^I enter middle name with "([^\"]*)"?$/) do |middle_name|
  find(:css, "input[ng-model='registrationData.middle_name']", :visible => true).set("#{middle_name}")
end

Then(/^I should see message id has not been verified$/) do
  step %Q{I should see "As you have not verified your I.D. online"}
end

Then(/^I select the option to skip ID check$/) do
  within '#identification_type' do
    find("option[value='3']").click
  end
end