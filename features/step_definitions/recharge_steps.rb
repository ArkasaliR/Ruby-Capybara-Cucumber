require "selenium-webdriver"


Given /^a recharge for authenticated msisdn "(.*?)" is started on e2e$/ do |msisdn_type|
  step %Q{I open e2e WSS login page}
  step %Q{I log in with a valid msisdn with "#{msisdn_type}"}
end

And /^I change the number I want to recharge as "(.*?)"$/ do |msisdn_type|
  step %Q{I follow "#{I18n.t 'express_recharge.recharge.recharge.change'}"}
  step %Q{I fill in "msisdn" with "#{find_msisdn_info(msisdn_type,'msisdn')}"}
  step %Q{I press "Next"}
end 

Given /^I navigate to express recharge page$/ do
  page.find(".recharge-number .button--minor").click
end

Given /^I navigate to recharge page$/ do
    page.find('.spl-icon.spl-i-phone-recharge').click
end



When(/^I click change logged in plan button$/) do
   page.find("#change-logged-in-plan").click
end

When(/^I change to original logged in plan for "(.*?)"$/) do |msisdn_type|
  step %Q{I select "#{find_msisdn_info(msisdn_type,'plan_name')}" from "plan_name"}
  step %Q{I select "$50" from "price_point_recharge_amount"}
end

When(/^I change logged in plan with the following$/) do |table|
  fill_logged_in_plan(table)
end

def fill_logged_in_plan(table)
    row = table.hashes.first
    fill_plan(row) 
end

def fill_plan(row) 
  step %Q{I select "#{row['Plan Name']}" from "plan_name"}  if row['Plan Name']
  step %Q{I select "#{row['Price']}" from "price_point_recharge_amount"}  if row['Price']
end

When(/^I click use new CC button$/) do
   step %Q{I follow "#{I18n.t 'express_recharge.recharge.registered_card.card.change'}" within ".change-card-link"}
end

When(/^I provide recharge with new CC details with the following$/) do |table|
  fill_cc_form(table)
end

def fill_cc_form(table)
  row = table.hashes.first
  fill_cc_details(row) 
end

def fill_cc_details(row)
  sleep 3
  page.within_frame("paymentFrame") do
  step %Q{I fill in "cardHolderName" with "#{row['Name On Card']}"}  if row['Name On Card']
  step %Q{I fill in "cardNo" with "#{row['Card No']}"}  if row['Card No']
  step %Q{I fill in "cardExpiry" with "#{row['Expiry']}" within "#new-card-form"}  if row['Expiry']
  step %Q{I fill in "cardSecureId" with "#{row['CCV']}"}  if row['CCV']
  end
end

When(/^I provide recharge with registered CC details for "(.*?)"$/) do |msisdn_type|
  step %Q{I fill in "last_four_digits" with "#{find_msisdn_info(msisdn_type,'last_four_digits')}" within "#registered-card-form"} 
  step %Q{I fill in "cardExpiry" with "#{find_msisdn_info(msisdn_type,'expiry_date')}" within "#registered-card-form"}
end

Then(/^I submit recharge with (new|registered) CC details$/) do |cc_type|
  submit_cc_form(cc_type)
end

def submit_cc_form(cc_type)
  if cc_type == "new"
    step %Q{I press "#{I18n.t 'express_recharge.recharge.recharge.card.submit'}" within "#new-card-form"}
  else
    step %Q{I press "#{I18n.t 'express_recharge.recharge.recharge.card.submit'}" within "#registered-card-form"}
  end
end

Then(/^I check the accept T&C checkbox$/) do
  find('#acceptTermsAndConditions').click
end

Then(/^I should see Payment Confirmation$/) do
  step %Q{I should see page title as "#{I18n.t('express_recharge.payment.receipt.receipt_title')}"}
end

Given /^I navigate to My Usage page$/ do
  step %Q{I follow "Back to my usage"}
  #page.find(".button--primary").click
end


Then(/^I select recharge$/) do
  step %Q{I navigate to recharge page}
end