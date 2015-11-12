Given /^I open e2e WSS login page$/ do
  visit(login_url)
end

Given /^I open the data usage deep link page$/ do
  visit(data_usage_deeplink_url)
end

Given /^I open the add ons deep link page$/ do
visit(manage_addons_deeplink_url)
end


Given /^I open prepaid SIM activation page$/ do
  visit(activate_url)
end

Given /^I open subscriptions login page$/ do
  visit(subscriptions_url)
end

Given /^I open the rate plan change deep link page using "(.*?)"$/ do |deep_link_url|
  visit(login_url << deep_link_url)
end


And /^I logout$/ do
  if ENV['MOBILE']
    step %Q{I toggle the mobile hamburger menu open}
    step %Q{I follow "#{I18n.t 'side_navigation.sign_out'}" within "#main-side-navigation"}
    step %Q{I should see "#{I18n.t 'sessions.destroy.message'}"}
  else
    step %Q{I follow "#{I18n.t 'side_navigation.sign_out'}" within "#secondary-nav"}
    step %Q{I should see "#{I18n.t 'sessions.destroy.message'}"}
  end
  @login = "false"
end

And /^I logout accepting popup$/ do
  if ENV['MOBILE']
    step %Q{I toggle the mobile hamburger menu open}
    step %Q{I follow "#{I18n.t 'side_navigation.sign_out'}" within "#main-side-navigation"}
    step %Q{I accept popup}
    step %Q{I should see "#{I18n.t 'sessions.destroy.message'}"}
  else
    step %Q{I follow "#{I18n.t 'desktop_navigation.sign_out'}" within "#secondary-nav"}
    step %Q{I accept popup}
    step %Q{I should see "#{I18n.t 'sessions.destroy.message'}"}
  end
  @login = "false"
end

When /^I log in with a valid msisdn with "(.*?)"$/ do |msisdn_type|
  step %Q{I fill in "userid" with "#{find_msisdn_info(msisdn_type,'msisdn')}"}
  step %Q{I fill in "password" with "#{password}"}
  step %Q{I press "loginButton"}
  step %Q{I should see "#{I18n.t 'home.index.title'}"}
  @login = "true"
end

When /^I log in with a valid new AAA MSISDN with "(.*?)"$/ do |msisdn_type|
  step %Q{I fill in "userid" with "#{find_msisdn_info(msisdn_type,'msisdn')}"}
  step %Q{I fill in "password" with "#{password}"}
  step %Q{I press "loginButton"}
  step %Q{I should see "#{I18n.t 'home.index.title'}"}
  @login = "true"
end

When /^I log in with a valid msisdn for new AAA with "(.*?)"$/ do |msisdn_type|
  step %Q{I fill in "userid" with "#{find_msisdn_info(msisdn_type,'msisdn')}"}
  step %Q{I fill in "password" with "#{password}"}
  step %Q{I press "loginButton"}
  step %Q{I should see "#{I18n.t 'home.index.title'}"}
  @login = "true"
end

When /^I log in with a subscription msisdn with "(.*?)"$/ do |msisdn_type|
  Capybara.ignore_hidden_elements = true
  step %Q{I fill in "txtUserID" with "#{find_msisdn_info(msisdn_type,'msisdn')}"}
  step %Q{I fill in "txtPassword" with "#{password}"}
  step %Q{I press "Sign in"}
  Capybara.ignore_hidden_elements = false
end

When /^I log in with a invalid subscription msisdn with "(.*?)"$/ do |msisdn_type|
  Capybara.ignore_hidden_elements = true
  step %Q{I fill in "txtUserID" with "#{find_msisdn_info(msisdn_type,'msisdn')}"}
  step %Q{I fill in "txtPassword" with "#{password}"}
  step %Q{I press "Sign in"}
  Capybara.ignore_hidden_elements = false
end

When (/^I confirm authentication dialog$/) do 
	authenticate_dialog
end

And /^I click to login again link$/ do
  step %Q{I follow "#{I18n.t 'sessions.destroy.sign_in_again_link'}" within ".session-destroy__actions"}
  step %Q{I should see page title as "My Vodafone"}
end

Then(/^I should see My Vodafone Login page$/) do
  step %Q{I should see page title as "#{I18n.t 'login.index.title'}"}
end

 Given(/^I go to the dealer activation page$/) do
   visit(dealer_url)
 end

When /^I log into self service directly with "(.*?)"$/ do |msisdn_type|
    require 'pli_decoder'
    if pli_params_present?
          msisdn = find_msisdn_info msisdn_type,'msisdn'
          pli = WSSA::PliDecoder.new(ENV['PLI_KEY'], ENV['PLI_IV']).generate_pli msisdn
           visit pli_login_url pli
        else
                abort "ERROR: No PLI PARAMS found, aborting. To avoid this set ENV['PLI_KEY'] and ENV['PLI_ID']"
        end
end
