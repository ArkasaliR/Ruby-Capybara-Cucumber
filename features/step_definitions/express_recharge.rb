require "selenium-webdriver"

Given /^an express recharge for unauthenticated msisdn "(.*?)" is started on e2e$/ do |msisdn_type|
  step %Q{I open e2e express recharge page}
  step %Q{I fill in "msisdn" with "#{find_msisdn_info(msisdn_type,'msisdn')}"}
end

Given /^an express recharge for unauthenticated invalid msisdn is started on e2e$/ do 
  step %Q{I open e2e express recharge page}
  step %Q{I fill in "msisdn" with "61409999999"}
end

Given(/^I select recharge using credit card$/) do
  step %Q{I press "#{I18n.t('express_recharge.recharge.new.credit_card_paypal')}"}
end

Given(/^I select recharge using voucher$/) do
  step %Q{I press "#{I18n.t('express_recharge.recharge.create.use_voucher')}"}
end

Given /^I open e2e express recharge page$/ do
  visit (recharge_url)  
end

When /^I select the "([^\"]+)" recharge amount$/ do |amount|
  page.select amount, :from => 'price_point_recharge_amount'
end

And /^I select the second option from amount$/ do
  second_option = find(:xpath, "//*[@id='price_point_recharge_amount']/option[3]").text
  select(second_option, :from => 'price_point_recharge_amount')
end

When /^I select the random commercial offer$/ do
	page.select random_commercial_offer, :from => 'plan_name'
end

Then /^I should see my previous commercial offer(?: within "([^\"]*)")?$/ do |selector|
  with_scope(selector) do
    if page.respond_to? :should
      page.should have_content(@offer)
    else
      assert page.has_content?(@offer)
    end
  end
end

Then /^I should see an error message saying my MSISDN was not found$/ do
  step %Q{I should see "#{I18n.t 'express_recharge.recharge.new.error.account_not_found'}"}
end

Then(/^I should see the express recharge enter MSISDN page$/) do
  step %Q{I should see page title as "#{I18n.t 'express_recharge.title.logged_out'}"}
  expect(page).to have_selector 'form#recharge-form input#msisdn'
end