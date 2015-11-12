require 'selenium-webdriver'
require 'capybara/cucumber'
require 'capybara/session'

When /^I toggle the mobile hamburger menu open$/ do
  page.find('#main-navbar-toggle').click
  page.should have_selector('#main-side-navigation')
end

When(/^I hit the browser back button$/) do
  case Capybara::current_driver
  when :selenium
    page.driver.browser.navigate.back
    # Back button not loading the page, only changing URL in broser
    page.driver.browser.navigate.refresh
    accept_dialog
  end
end

Then (/^I switch to new window$/) do
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
end

Then (/^I close new window$/) do
    within_window(page.driver.browser.window_handles.last) do
       page.driver.browser.close
    end
end

And /^I should see More Services link$/ do
    step %Q{I should see "#{I18n.t 'account_settings.index.service.more_services'}"}
end

And /^I follow More Services link$/ do
    Capybara.ignore_hidden_elements = true
    step %Q{I follow "#{I18n.t 'account_settings.index.service.more_services'}"}
    Capybara.ignore_hidden_elements = false
end

And /^I navigate to My Usage page through secondary navigation$/ do
  if ENV['MOBILE']
    step %Q{I toggle the mobile hamburger menu open}
    step %Q{I follow "#{I18n.t 'side_navigation.usage'}" within "#main-side-navigation"}
  else
    step %Q{I follow "#{I18n.t 'desktop_navigation.usage'}" within "#secondary-nav"}
  end
end
