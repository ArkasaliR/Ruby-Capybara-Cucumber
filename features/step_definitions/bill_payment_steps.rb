require 'json'
require "selenium-webdriver"
#require_relative 'e2e_constants'


Given /^I pay my bill using the following credit card details$/ do |table|
  fill_new_cc_form table.hashes.first, :container => "#new-credit-card"
  step %Q{I press "#{I18n.t('bill_payments.form.next')}"}
end

Given /^I send a payment for "(.*?)"$/ do |msisdn_ban|
  step %Q{I fill in "msisdnBanInput" with "#{msisdn_ban}"}
  step %Q{I enter a bill payment amount of "$10"}
  step %Q{I enter valid credit card details}
  step %Q{I press "#{I18n.t('bill_payments.form.next')}"}
end

Given /^I send a payment for msisdn "(.*?)"$/ do |msisdn_type|
  step %Q{I fill in "msisdnBanInput" with "#{find_msisdn_info(msisdn_type,'msisdn')}"}
  step %Q{I enter a bill payment amount of "$10"}
  step %Q{I enter valid credit card details}
  step %Q{I press "#{I18n.t('bill_payments.form.next')}"}
end

Given /^I send a payment for ban "(.*?)"$/ do |msisdn_type|
  step %Q{I fill in "msisdnBanInput" with "#{find_msisdn_info(msisdn_type,'ban')}"}
  step %Q{I enter a bill payment amount of "$10"}
  step %Q{I enter valid credit card details}
  step %Q{I press "#{I18n.t('bill_payments.form.next')}"}
end

Then /^I should see the following review information$/ do |table|
  table.hashes.each do |row|
    step %Q{I should see "#{row['Payment amount']}" within "#review-amount"}
    step %Q{I should see "#{row['Card number']}" within "#review-cc-number"}
    page.find(".icon-credit-card-single.#{row['Credit card type'].downcase}").should be_visible
    step %Q{I should see "#{row['Expiry date']}" within "#review-cc-expiry"}
    step %Q{I should see "#{row['CCV']}" within "#review-ccv"}
  end
end

Given /^I enter the msisdn "(.*?)" to pay a bill for$/ do |msisdn_type|
  step %Q{I fill in "msisdnBanInput" with "#{find_msisdn_info(msisdn_type,'msisdn')}"}
end

Given /^I enter the ban "(.*?)" to pay a bill for$/ do |msisdn_type|
  step %Q{I fill in "msisdnBanInput" with "#{find_msisdn_info(msisdn_type,'ban')}"}
end

Given /^I enter an invalid msisdn to pay a bill for$/ do 
  step %Q{I fill in "msisdnBanInput" with "61450973279"}
end

Given /^I enter an invalid ban to pay a bill for$/ do
  step %Q{I fill in "msisdnBanInput" with "496358269"}
end

Then /^I should see an error message saying that the payment amount cannot be empty$/ do
  step %Q{I should see "#{I18n.t 'bill_payments.form.empty_amount'}"}
end

Then /^I should see an error message saying that the given number is neither a msisdn nor a BAN$/ do
  step %Q{I should see "#{I18n.t 'bill_payments.form.invalid_number'}"}
end

Then /^I should see a Visa specific surchage message$/ do
  step %Q{I should see "#{I18n.t 'bill_payments.surcharge.visa'}"}
end

Then /^I should see an error message saying that the credit card expiry date cannot be empty$/ do
  see_an_error I18n.t 'shared.credit_card.credit_card_error.expiryDate.empty'
end

Then /^I should see an American Express specific surchage message$/ do
  step %Q{I should see "#{I18n.t 'bill_payments.surcharge.amex'}"}
end

Then /^I should see a Diners Club specific surchage message$/ do
  step %Q{I should see "#{I18n.t 'bill_payments.surcharge.diners'}"}
end

Then /^I should see a Mastercard specific surchage message$/ do
  step %Q{I should see "#{I18n.t 'bill_payments.surcharge.mastercard'}"}
end

Then /^I should see a Visa specific review surchage message$/ do
  step %Q{I should see "#{I18n.t 'bill_payments.review.surcharge.visa'}"}
end

Then /^I should see verisign information$/ do
  step %Q{I should see "#{I18n.t 'bill_payments.new.verisign'}" within "#verisign"}
end

Then /^I should be reviewing the pay bill information$/ do
  page.find("#pay-bill-review").should be_visible
end

When /^I confirm the payment of my bill$/ do
  step %Q{I press "#{I18n.t('bill_payments.review.pay')}"}
end

When /^I press the back button of the review payment$/ do
  page.find("#back").click
end

When /^I press the cancel button of the review payment$/ do
  page.find("#review-pay-bill-cancel").click
end

Then /^I see a confirmation message to cancel the bill payment$/ do
  page.driver.browser.switch_to.alert.text.should eql(I18n.t 'bill_payments.review.cancel_confirm')
end

When /^I choose to cancel and go back to my bill payment$/ do
  page.driver.browser.switch_to.alert.dismiss
end

When /^I choose to confirm the cancellation of my bill payment$/ do
  page.driver.browser.switch_to.alert.accept
end

Given /^I should see the payment is going towards MSISDN "(.*?)"$/ do |msisdn|
  step %Q{I should see "#{I18n.t 'bill_payments.review.msisdn'}" within ".review-msisdn-ban-label"}
  step %Q{I should see "#{msisdn}" within ".review-msisdn-ban"}
end

Given /^I should see the payment is going towards billing account number "(.*?)"$/ do |ban|
  step %Q{I should see "#{I18n.t 'bill_payments.review.ban'}" within ".review-msisdn-ban-label"}
  step %Q{I should see "#{ban}" within ".review-msisdn-ban"}
end

Then /^I should see a successful payment message$/ do
  step %Q{I should see "#{I18n.t 'receipts.show.thankyou'}"}
end

Then /^I should see a message confirming that the bill payment could not be processed$/ do
  step %Q{I should see "#{I18n.t 'bill_payments.review.processing.disable'}"}

end

Then /^I should see a receipt message with "(.*?)"$/ do |receipt_number|
  step %Q{I should see "#{I18n.t 'receipts.show.receipt'} #{receipt_number}"}
end

Then /^I should see an internal server error message$/ do
  step %Q{I should see "#{I18n.t 'internal_server_error.message'}"}
end

Then /^I should see a "(.*?)" error$/ do |message_key|
  expected_message_key = "bill_payments.#{message_key}.title"
  step %Q{I should see "#{I18n.t expected_message_key}"}
  expected_message_key = "bill_payments.#{message_key}.message"
  step %Q{I should see "#{I18n.t expected_message_key}"}
end

Then /^I should see a credit card error title$/ do
  step %Q{I should see "#{I18n.t 'bill_payments.credit_card_error.title'}"}
end

Then /^I should see a credit card error message$/ do
  step %Q{I should see "#{I18n.t 'bill_payments.credit_card_error.message'}"}
end

When /^I choose to try another payment$/ do
  click_link I18n.t 'bill_payments.error.retry'
end

When /^I choose to view bills and payments$/ do
  within '.container' do
    click_link I18n.t 'bill_payments.error.abort'
  end
end

Then /^I should not see an option to view bills and payments$/ do
  step %Q{I should not see "#{I18n.t 'bill_payments.error.abort'}"}
end

When /^I choose to make another payment$/ do
  click_link I18n.t 'receipts.show.another_payment'
end

Then /^I should see a missing mandatory field error title$/ do
  step %Q{I should see "#{I18n.t 'bill_payments.missing_mandatory_field.title'}"}
end

Then /^I should see a missing mandatory field error message$/ do
  step %Q{I should see "#{I18n.t 'bill_payments.missing_mandatory_field.message'}"}
end

Then(/^I should see an amount paid message with "(.*?)"$/) do |amount|
  step %Q{I should see "#{I18n.t 'receipts.show.amount'} #{amount}"}
end

Given /^the payment server is busy$/ do
  page.driver.execute_script(
    %Q{
      window.old_post_method = $.post;
      $.post = function() { window.old_post_call_arguments = arguments; }
    }
  )
end

Then /^the progressing payment page should not have the back button$/ do
  page.should_not have_selector('.nav-back-button')
  page.should have_selector('#main-nav a')
end

Then /^I should see the account number tooltip$/ do
  page.find(".pay-bill-msisdn-ban-label").click
  step %Q{I should see "#{I18n.t 'bill_payments.form.msisdn_ban_tooltip'}" within "#pay-bill-msisdn-ban-tooltip"}
end

Then /^I should see an error message saying that the credit card holder name cannot be empty$/ do
  see_an_error I18n.t 'shared.credit_card.credit_card_error.holderName.empty'
end

Then /^I should see an error message saying that the credit card number is invalid$/ do
  see_an_error I18n.t 'shared.credit_card.credit_card_error.number.invalid'
end

Then /^I should see an error message saying that the credit card expiry date is invalid$/ do
  see_an_error I18n.t 'shared.credit_card.credit_card_error.expiryDate.invalid'
end

Then /^I should see an error message saying that the credit card ccv is invalid$/ do
  see_an_error I18n.t 'shared.credit_card.credit_card_error.ccv.invalid'
end

Then /^I should see an error message saying that the credit card ccv cannot be empty$/ do
  see_an_error I18n.t 'shared.credit_card.credit_card_error.ccv.empty'
end

def see_an_error error
  step %Q{I should see "#{error}"}
end

def show_invisible_field(id_selector, html_element='div')
  page.driver.execute_script(
    %Q{ jQuery('#{html_element}[id ^= "#{id_selector}"]').toggle(); }
  )
end

When /^I enter a bill payment amount of "([^\"]*)"$/ do |amount|
  step %Q{I fill in "amount" with "#{amount}"}
end

Given /^I open pay my bill non loggedin page$/ do
  visit(paybill_url)
end

When(/^I navigate to Bills & Payments Page$/) do
  if ENV['MOBILE']
    step %Q{I toggle the mobile hamburger menu open}
    step %Q{I follow "#{I18n.t 'side_navigation.account_balance'}" within "#main-side-navigation"}    
  else
    step %Q{I follow "#{I18n.t 'desktop_navigation.account_balance'}" within "#secondary-nav"}
  end
end

When(/^I make a payment$/) do
  step %Q{I follow "#{I18n.t 'account_balances.show.link'}"}
end

Then(/^I should see Bills & Payments page title$/) do
  step %Q(I should see page title as "#{I18n.t 'account_balances.show.title'}")
end

When(/^I click Pay Bill Next button$/) do
  step %Q{I press "#{I18n.t 'bill_payments.form.next'}"}
end

When(/^I click Pay Bill Pay button$/) do
  step %Q{I press "#{I18n.t 'bill_payments.review.pay'}"}
end

And (/^I navigate to my account from My Usage$/) do
  step %Q{I follow "#{I18n.t 'home.index.account_link'}"}
end

And (/^I should see Extra Usage information/) do
  step %Q{I should see "#{I18n.t 'home.index.extra_usage'}"}
end
