# Then(/^I should see two same recharges under plans$/) do
#   page.all('td', :text => '10').count == 3
# end

Given(/^I select the price point of "([^"]*)" with 1 GB data$/) do |price_point|
  sleep(3)
  indicator = find('.recharge__price-point-indicator .recharge__price-point-indicator__details .recharge__price-point-indicator__inclusion', text: '1 GB', visible: true)
  indicator.click
end

When(/^I choose to Buy an add\-on$/) do
  click_link "Buy an add-on"
end

Then(/^I should see Data Add-ons carousel page with commercial offers$/) do
  expect(page).to have_selector('.vha-carousel__indicator')
end

# Given(/^I select the price point of "([^"]*)" with 500 MB data$/) do |price_point|
#   page.all('.recharge__price-point-indicator__details:first')[1].click
# end

# Given(/^I select the price point of "([^"]*)" with 2 GB data$/) do |price_point|
#   indicator = find('.recharge__price-point-indicator .recharge__price-point-indicator_details .recharge__price-point-indicator__inclusion', text: '2 GB', visible: true)
#   indicator.click
# end