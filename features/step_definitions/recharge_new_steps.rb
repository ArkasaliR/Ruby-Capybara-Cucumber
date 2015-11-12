
price=""
offer=""
flag=false

When /^I choose to recharge$/ do
  click_button I18n.t('recharge.cc_or_paypal')
end

When /^I choose to use the same recharge$/ do
  click_link 'recharge-last'
end

When /^I choose to recharge with something else$/ do
  click_link 'recharge-change'
end

When /^I choose to recharge with a voucher$/ do
  click_link I18n.t('express_recharge.recharge.last.link_to_voucher_button_text')
end

 When /^I choose recharge with voucher big button$/ do
    step %Q{I follow "Redeem now"}
 end

When /^I choose Recharge with voucher big button$/ do
  find(:xpath, "//a[@href='/voucher_recharge/validate']").click
end

When /^I enter my recharge voucher pin$/ do |voucher_pin|
  step %Q{I enter a recharge voucher pin "#{DEFAULT_VOUCHER_PIN}" and submit}
end

Given(/^I select the price point of "([^"]*)"$/) do |price_point|
   if flag == true
      price_point = "$20"
   end
  indicator = find('.recharge__price-point-indicator .recharge__price-point-indicator__details .recharge__price-point-indicator__value', text: price_point, visible: true)
  indicator.click
end

Given(/^I select the mbb price point of "([^"]*)"$/) do |price_point|
  price = "$"+price
   if price == price_point
      price_point = "$45"
   end
  indicator = find('.recharge__price-point-indicator', text: price_point)
  indicator.click
end

Given(/^I select the commercial offer "([^"]*)"$/) do |commercial_offer|
   if offer != "Prepaid MBB" and offer == commercial_offer
      commercial_offer = "365 Day"
      flag = true
   end
   indicator = find('.recharge__plan-indicator', text: commercial_offer)
   indicator.click
  end

# This is for the commerical offers descriptions page
Given(/^I choose the "(.*?)" commercial offer on the offers list page$/) do |commercial_offer|
  find("a[alt='Choose #{commercial_offer}']").click
  #step %Q{I follow "Choose" within ".vf_cap_co"}
end

When(/^I confirm my recharge selection$/) do
  first('.select-recharge__confirm').click
end

When(/^I view the selected recharge terms and conditions$/) do
  find('.select-recharge__terms-and-conditions-link').click
end

When(/^I see the default pricepoint of "([^"]*)" is selected$/) do |price_point|
  page.should have_selector('.vha-carousel__indicator--active .recharge__price-point-indicator', :text => price_point)
end


 Then(/^I should get my last recharge details$/) do
  offer = page.find('.widget-module__header').text()
  price = page.find('.lockup__price').find('.lockup__amount').text()
end 

Then(/^I should see my last recharge details$/) do
  expect(page).to have_content "#{offer}"
  expect(page).to have_content "#{price}"
end


Then(/^I select the Credit card payment method$/) do
page.find('.recharge__pay-by-credit-card__title').click
end

Given(/^I click the I want this one button$/) do
  Capybara.ignore_hidden_elements = true
  #find(".vha-carousel__item-detail--active .select-recharge__confirm btn-primary").click
  step %Q{I press "Continue"}
  Capybara.ignore_hidden_elements = false
end
 
When(/^I enter a recharge voucher pin "(.*?)" and submit$/) do |pin|  
  pin.each_char do |c|
    step %Q{I press the "numpad#{c}" key associated with "voucher_pin"}
  end
  page.find('.btn-primary').click
end 

 When /^I press the "([^"]*)" key associated with "([^"]*)"$/ do |key, field|
   find_field(field).native.send_key(key.downcase.to_sym)
 end

 Then /^I should see voucher carousel page with commercial offers$/ do
  expect(page).to have_selector('.vha-carousel__indicator--active')
  #page.should have_content "Prepaid Cap"
  #page.should have_content "365 Day"
  #page.should have_content "Vodafone International"
 end

 Then /^I should see mbb voucher carousel page$/ do
  expect(page).to have_selector('.vha-carousel__indicator--active')
  expect(page).to have_content "Mobile Broadband"
 end

When /^I choose to recharge an addon$/ do
   step %Q{I press "Buy an add-on"}
end
