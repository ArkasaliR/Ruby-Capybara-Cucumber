$manageDirectDebitText = I18n.t 'account_balances.show.manage_direct_debit'
$updateDirectDebitText = I18n.t 'direct_debits.current.update_details'
$setupDirectDebitText  = I18n.t 'account_balances.show.direct_debit'

Then /^I should see a link to manage direct debit$/ do
	step %Q{I should see "#{$manageDirectDebitText}"}
end

And /^I click Manage Direct Debit button$/ do
 step %Q{I follow "#{I18n.t 'account_balances.show.manage_direct_debit'}"}
end

Then /^I should see a link to setup direct debit$/ do
	step %Q{I should see "#{$setupDirectDebitText}"}
end

Then /^I should see a link to update direct debit$/ do
  step %Q{I should see "#{$updateDirectDebitText}"}
end

And /^I click Update Details button$/ do
  step %Q{I follow "#{I18n.t 'direct_debits.current.update_details'}"}
end

Then(/^I should see the Done success message$/) do
  sleep(5)
  step %Q{I should see "#{I18n.t 'direct_debits.success.section_title'}"}
end

When(/^I select the Bank Account option for Direct Debit$/) do
  step %Q{I check the styled checkbox "direct-debit-payment-method-bank-account"}
end

When(/^I select the Credit Card option for Direct Debit$/) do
  step %Q{I check the styled checkbox "direct-debit-payment-method-credit-card"}
end


Then (/^I enter the (bank account|credit card) details with the following$/) do |dd_type,table|
	fill_dd_form(dd_type,table)	 
end

def fill_dd_form(dd_type,table)
  row = table.hashes.first

  /step %Q{I fill in "direct_debit_bsb_number" with "#{row['BSB']}"}   if row['BSB']
  step %Q{I fill in "direct_debit_bank_account_number" with "#{row['Account Name']}"}   if row['Account Name']
  step %Q{I fill in "direct_debit_bank_account_name" with "#{row['Account Number']}"}  if row['Account Number']/

  if dd_type == "bank account"
    step %Q{I fill in "#{I18n.t 'direct_debits.form.payment_options.bank_account.bsb'}" with "#{row['BSB']}"}   if row['BSB']
    step %Q{I fill in "#{I18n.t 'direct_debits.form.payment_options.bank_account.account_name'}" with "#{row['Account Name']}"}  if row['Account Name']
    step %Q{I fill in "#{I18n.t 'direct_debits.form.payment_options.bank_account.account_number'}" with "#{row['Account Number']}"}  if row['Account Number']
    step %q{I check the styled checkbox "terms-and-conditions-bank-account"}
  else
    sleep 3
    page.within_frame("paymentFrame") do
    step %Q{I fill in "cardHolderName" with "#{row['Name on card']}"}   if row['Name on card']
    step %Q{I fill in "cardNo" with "#{row['Card number']}"}  if row['Card number']
    step %Q{I fill in "cardExpiry" with "#{row['Expiry date']}"}  if row['Expiry date']
    step %Q{I fill in "cardSecureId" with "#{row['CCV']}"}  if row['CCV']
    end
    step %q{I check the styled checkbox "terms-and-conditions-credit-card"}
end

end

Then (/^I should see my (bank account|credit card) details with the following$/) do |dd_type,table|
  validate_dd_form(dd_type,table)
end

def validate_dd_form(dd_type,table)
  row = table.hashes.first

  if dd_type == "bank account"
    step %Q{I should see "#{row['BSB']}"} if row['BSB']
    step %Q{I should see "#{row['Account Name']}"} if row['Account Name']
    step %Q{I should see "#{row['Account Number']}"} if row['Account Number']
  else
    step %Q{I should see "#{row['Name on card']}"} if row['Name on card']
    step %Q{I should see "#{row['Card number']}"} if row['Card number']
    step %Q{I should see "#{row['Expiry date']}"} if row['Expiry date']
    step %Q{I should see "#{row['CCV']}"} if row['CCV']
  end
end

Then (/^I submit the request$/) do
  Capybara.ignore_hidden_elements = true
  step %Q{I press "#{I18n.t('direct_debits.form.submit')}"}
  Capybara.ignore_hidden_elements = false
end

Then(/^the Bank Account form should be displayed$/) do
  page.should have_selector '#bank-account-form', :visible => true
end

Then(/^the Credit Card form should be displayed$/) do
  page.should have_selector '#credit-card-form', :visible => true
end

Then(/^I validate make a payment button visibility$/) do
  using_wait_time 10 do
    #unless page.has_content?("No payment required")
    unless page.has_content?("$0.00")
      makeAPaymentText = "#{I18n.t 'account_balances.show.link'}"
      if Date.today < Date.parse(get_Direct_Debit_Date) -2
        step %Q{I should see "#{makeAPaymentText}" within ".btn-container"}
      else
        step %Q{I should not see "#{makeAPaymentText}" within ".btn-container"}
      end
    end
  end
end

def get_Direct_Debit_Date()
  within('.total-to-pay') do
    find('.balance-message').text.sub! 'Next charge', ''
  end
end


Then(/^I should see a link to Cancel Direct debit$/) do
  cancelDirectDebitText = "#{I18n.t 'direct_debits.cancel.link'}"
  step %Q{I should see "#{cancelDirectDebitText}"}
end

And(/^I click Cancel Direct Debit button$/) do
  step %Q{I follow "#{I18n.t 'direct_debits.cancel.link'}"}
end

Then(/^I should see cancel direct debit confirmation message$/) do
  step %Q{I should see "#{I18n.t 'direct_debits.cancel.section_text'}"}
end

And(/^I should see successful direct debit cancellation message$/) do
  step %Q{I should see "#{I18n.t 'direct_debits.cancel.success.section_text_1'}"}
  step %Q{I should see "#{I18n.t 'direct_debits.cancel.success.section_text_2'}"}
end

And (/^I navigate to direct debit page from bills and payments page$/) do
  if step %Q{I see "#{$manageDirectDebitText}" within ".btn-container"}
    step %Q{I click Manage Direct Debit button}
    step %Q{I click Update Details button}
  else
    step %Q{I click Setup Direct Debit button}
  end
end

And(/^I select Setup Direct Debit option$/) do
  step %Q{I follow "Setup direct debit"}
end