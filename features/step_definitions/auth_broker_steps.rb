
Then(/^I should see Auth Broker call in the page source code$/) do
  page.should have_selector('script[src^="https://auth-broker.services.vodafone.com.au/v1/uuid/create/"]')
end