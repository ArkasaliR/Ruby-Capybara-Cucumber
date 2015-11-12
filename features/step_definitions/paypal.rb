Given(/^I should see How would you like to pay section$/) do
  expect(page).to have_selector '.module__content>h2', text: 'How would you like to pay?'
end

Given(/^I should see pay with new Credit card option$/) do
  expect(page).to have_css ('.accordion.recharge__pay-by-credit-card.accordion')
  expect(page).to have_css ('#new-credit-card')
end

Given(/^I should see pay with PayPal option$/) do
  expect(page).to have_css ('.accordion.recharge__pay-by-paypal.accordion')
  expect(page).to have_css ('.recharge__pay-by-paypal__title')
end

Given(/^I should be able to pay with saved Credit card details$/) do
  expect(page).to have_selector '.change-card-header>h2', text: 'Pay with saved card'
  expect(page).to have_selector '.module__content--basic>h3', text: 'Confirm the last four digits and expiry date'
  expect(page).to have_selector '.module--form--long>label', text: 'Last four digits'
  expect(page).to have_selector '.module--form--long>label', text: 'Expiry'
end

Given(/^I select pay with CC$/) do
  find('.accordion.recharge__pay-by-credit-card.accordion').click
end

Given(/^I open PayPal accordion$/) do
  find('.recharge__pay-by-paypal__title').click
end

Given(/^I should see CC accordion is open$/) do
   expect(page).to have_selector '.accordion__additional-content.recharge__payment-options__credit-card__content', style='display: block;'
   expect(find('.accordion__additional-content.recharge__payment-options__credit-card__content')).to have_selector "input[type='submit'][value='#{I18n.t 'express_recharge.recharge.recharge.card.submit'}']"
end

Given(/^I should see CC accordion is close$/) do
  expect(page).to_not have_selector '.accordion.recharge__pay-by-credit-card.accordion accordion--visible'
end

Given(/^I should see PayPal accordion is open$/) do
  expect(page).to have_selector '.accordion recharge__pay-by-paypal accordion--visible'
end

Given(/^I should see PayPal accordion is close$/) do
  expect(page).to_not have_selector '.accordion recharge__pay-by-paypal accordion--visible'
end

Given(/^I confirm the PayPal transaction$/) do
  find('#continue').click
end

When(/^I select pay with PayPal$/) do
  find('.recharge__pay-by-paypal__title').click
  find('#paypal-payment', visible: true).click
end

When(/I choose the following recharge options$/) do | recharge_table |
  # | Recharge option | Recharge amount |
  # If previously recharged plan is selected change it
  if page.has_css?('#last-recharge-value')
    if page.has_css?('#change-logged-in-plan')
      find('#change-logged-in-plan',visible: true).click
    else  
      find('#change-plan',visible: true).click
    end
  end
  recharge_selection = recharge_table.hashes.first
  step %Q{I select "#{recharge_selection['Recharge option']}" from "plan_name"} unless recharge_selection['Recharge option'].blank?
  step %Q{I select "#{recharge_selection['Recharge category']}" from "category_label"} unless recharge_selection['Recharge category'].blank?
  step %Q{I select "#{recharge_selection['Recharge amount']}" from "price_point_recharge_amount"} unless recharge_selection['Recharge amount'].blank?
end

When(/I login with existing PayPal account$/) do
  step %Q{I fill in "login_email" with "#{paypal_id}"}
  step %Q{I fill in "login_password" with "#{paypal_password}"}
  find('input[type="submit"][value="Log In"]').click
end

When(/^I navigate to My Vodafone page$/) do
  find('.my-vodafone-link').click
end

When(/^I navigate to My Usage page from PayPal recharge page$/) do
  find('.my-usage-link').click
end

When(/^I navigate to Recharge Other page$/) do
  step %Q{I follow "Recharge Other"}
  #step %Q{I follow "#{I18n.t 'express_recharge.recharge.payment_methods.paypal.receipt.recharge_other'}"}
end

When(/^I cancel the PayPal transaction$/) do
  find('span.buttonAsLink input[name="cancel_return"]').click
end

Then(/^I should see error message to select a recharge option$/) do
  expect(page).to have_selector '#plan-options > fieldset > div.spl-alert--error', text: "#{I18n.t 'javascript.commercial_offer_validator.errorMessages.plan.empty'}"
end

Then(/^I should see error message to select a recharge amount$/) do
  expect(page).to have_selector 'li.price_point > fieldset > div.spl-alert--error', text: "#{I18n.t 'javascript.commercial_offer_validator.errorMessages.amount.empty'}"
end

Then(/^I should be redirected to the PayPal website with information for msisdn "(.*?)"$/) do | msisdn_type, recharge_detail |
  row = recharge_detail.hashes.first
  msisdn = formatted_paypal_msisdn_string(msisdn_type)

  eventually {
    actual_product_description = page.find('.itmdet span.accessAid', visible: false).text(:all)
    expect(actual_product_description).to include(msisdn)
    expect(actual_product_description).to include(row['Recharge product']) if row['Recharge product']
    expect(page.find('.itmdet span.amount').text).to include(row['Recharge amount']) if row['Recharge amount']
  }

end

Then(/^I should see the following PayPal recharge summary for msisdn "(.*?)"$/) do | msisdn_type, table|
  row = table.hashes.first
  msisdn = formatted_msisdn_string msisdn_type
  receipt_msisdn = formatted_paypal_msisdn_string msisdn_type
  formatted_date = Time.now.strftime('%y%m%d')

  expect(page.find('.paypal-recharge__msisdn').text).to eql(msisdn)
  expect(page.find('.paypal-recharge__receipt__text').text).to include(formatted_date)
  expect(page.find('.paypal-recharge__receipt__text').text).to include(receipt_msisdn)
  expect(page.find('.paypal-recharge__product').text).to include(row['Recharge product']) if row['Recharge product']
  expect(page.find('.paypal-recharge__product').text).to include(row['Recharge amount']) if row['Recharge amount']
end

Then(/^I should be on the recharge page for msisdn "(.*?)" and the CC accordion is (open|close)$/) do | msisdn_type, cc_accordion_state |
  msisdn = formatted_msisdn_string msisdn_type

  step %Q{I should see link Critical Information}
  step %Q{I should see a link to recharge option details}
  step %Q{I should see How would you like to pay section}
  step %Q{I should see CC accordion is #{cc_accordion_state}}
  step %Q{I should see pay with PayPal option}
  step %Q{I should see PayPal accordion is close}

  Capybara.ignore_hidden_elements = false
  expect(page.find('#msisdn-label').text).to eql(msisdn)
  expect(page).to have_field('plan_name')
  expect(page).to have_field('category_label')
  expect(page).to have_field('price_point_recharge_amount')
  Capybara.ignore_hidden_elements = true
end

Then(/^I should see the link to My Vodafone$/) do
  expect(page).to have_selector('.my-vodafone-link', visible: true)
end

Then(/^I should see the link to My Usage$/) do
  expect(page).to have_selector('.my-usage-link', visible: true)
end

Then(/^I should see the link to Recharge Other$/) do
  expect(page).to have_selector('.btn-secondary', text: 'Recharge Other')
end

Then(/^I should be on the My Usage page$/) do
  step %Q{I should see "My usage"}
  expect(page).to have_selector "input[type='submit'][value='#{I18n.t 'home.index.recharge_link'}']"
end