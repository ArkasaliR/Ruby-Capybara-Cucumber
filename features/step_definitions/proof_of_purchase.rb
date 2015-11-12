
When(/^I navigate to Proof of purchase page$/) do
  Capybara.ignore_hidden_elements = true
  step %Q(I follow "Proof of purchase")
  Capybara.ignore_hidden_elements = false
end

Then (/^I should see Proof of purchase as my page title$/) do
  step %Q{I should see "#{I18n.t 'online_forms.proof_of_purchase.title'}"}
end

Then (/^I fill the form to request proof of purchase with the following$/) do |table|
  Capybara.ignore_hidden_elements = true
  fill_form(table)
  Capybara.ignore_hidden_elements = false
end

def fill_form(table)
  row = table.hashes.first

  step %Q{I fill in "your_name" with "#{row['Your name']}"}   if row['Your name']
  step %Q{I fill in "email" with "#{row['Email']}"}   if row['Email']
  step %Q{I fill in "reason" with "#{row['Reason']}"}  if row['Reason']
  step %Q{I fill in "imei" with "#{row['IMEI']}"}  if row['IMEI']
  step %Q{I fill in "Handset make / model" with "#{row['Handset model']}"}  if row['Handset model']
  step %Q{I select "#{row['Purchased from']}" from "purchased_from"} if row['Purchased from']
end

Then (/^I select secondary number$/) do
  step %Q{I select option with value "61406451826" from element "msisdn"}
end

Then (/^I submit proof of purchase request$/) do
  find("#submit-proof-of_purchase").click
end

Then (/^I should see proof of purchase confirmation page$/) do
  #step %Q{I should see "#{I18n.t 'online_forms.proof_of_purchase.confirmation.text'}"}
  step %Q{I should see "send you a TXT shortly, then follow up with an email containing your proof of purchase."}
end

When(/^I navigate to SIM replacement page$/) do
  Capybara.ignore_hidden_elements = true
  step %Q(I follow "SIM replacement")
  Capybara.ignore_hidden_elements = false
end

Then(/^I should see SIM replacement as my page title$/) do
  step %Q{I should see "SIM replacement"}
  step %Q{I should see "Make sure you have the following information before you call"}
end
