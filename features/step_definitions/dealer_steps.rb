When(/^I go to the activation page$/) do
  visit(dealer_url)
end

And(/^I login with "([^"]*)" and "([^"]*)"$/) do |arg1, arg2|
  step %Q{I fill in "dealer_email" with "#{I18n.t 'dealer.login.user_id'}"}
  step %Q{I fill in "dealer_password" with "#{I18n.t 'dealer.login.password'}"}
  page.find('label[for=agreement_checkbox]').click
  step %Q{I press "sign_in_button"}
end

And(/^I fill in my (Passport|Medicare Card|Driver's Licence|Birth certificate|Concession Card|Proof of Age|Student ID|Debit\/ATM Card|Credit Card|Passbook|Account Form) details as proof of id for dealer activation$/) do |id_flag, table|
  row = table.hashes.first

  step %Q{I select "#{row['Identification type']}" from "identification_type1"} if row['Identification type']
  step %Q{I fill "reference_number1" with "#{row['Reference number']}"} if row['Reference number']

  if id_flag == 'Passport'

    step %Q{I select "#{row['Country']}" from "issuing_country_code1"} if row['Country']
    step %Q{I fill in data mask "expiry_date1" with "#{row['Expiry date']}"} if row['Expiry date']

  elsif id_flag == 'Medicare Card'
    step %Q{I fill in data mask "expiry_date1" with "#{row['Expiry date']}"} if row['Expiry date']

  elsif id_flag == "Driver's Licence"
    step %Q{I fill in data mask "issuing_location1" with "#{row['State']}"} if row['State']
    step %Q{I fill in data mask "expiry_date1" with "#{row['Expiry date']}"} if row['Expiry date']

  elsif id_flag == 'Concession Card'
    step %Q{I fill in data mask "expiry_date1" with "#{row['Expiry date']}"} if row['Expiry date']

  elsif id_flag == 'Proof of Age'
    step %Q{I fill in data mask "issuing_location1" with "#{row['State']}"} if row['State']

  elsif id_flag == 'Student ID'
    step %Q{I fill in data mask "expiry_date1" with "#{row['Expiry date']}"} if row['Expiry date']

  elsif id_flag == 'Debit/ATM Card'
    step %Q{I fill in data mask "expiry_date1" with "#{row['Expiry date']}"} if row['Expiry date']

  elsif id_flag == 'Credit Card'
    step %Q{I fill in data mask "cc_type1" with "#{row['Credit card type']}"} if row['Credit card type']
    step %Q{I fill in data mask "expiry_date1" with "#{row['Expiry date']}"} if row['Expiry date']

  elsif id_flag == 'Passbook'
    step %Q{I fill in data mask "expiry_date1" with "#{row['Expiry date']}"} if row['Expiry date']

  elsif id_flag == 'Account Form'
    step %Q{I fill in data mask "expiry_date1" with "#{row['Expiry date']}"} if row['Expiry date']
  end
end

And(/^I fill in my (Account Form|Debit\/ATM Card) details as proof for identification$/) do |id_flag, table|
  row = table.hashes.first

  step %Q{I select "#{row['Identification type2']}" from "identification_type2"} if row['Identification type2']
  step %Q{I fill "reference_number2" with "#{row['Reference number2']}"} if row['Reference number2']

  if id_flag == 'Account Form'
  step %Q{I fill in data mask "expiry_date2" with "#{row['Expiry date2']}"} if row['Expiry date2']

  elsif id_flag == 'Debit/ATM Card'
  step %Q{I fill in data mask "expiry_date2" with "#{row['Expiry date2']}"} if row['Expiry date2']
end
end

And(/^I click the continue button$/) do
  step %Q{I press "Continue" within "#personal_information"}
end


And(/^I Sign out$/) do
  find('#activation-container').click
end
