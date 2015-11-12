require "selenium-webdriver"

When /^I wait (\d+) seconds?$/ do |seconds|
  sleep seconds.to_i
end

Then /^I should see an successfull recharge message and receipt number$/ do
step %Q{I should see "#{I18n.t 'express_recharge.payment.receipt.paragraphs.msisdn'}"}
step %Q{I should see "#{I18n.t 'express_recharge.payment.receipt.paragraphs.receipt'}"}
step %Q{I should see "#{I18n.t 'express_recharge.payment.receipt.paragraphs.update'}"}
end

Given /^I should see page title as "(.*)"$/ do |title_name|
  expect(page).to have_content(title_name)
end

Given /^I delete all cookies$/ do
  page.driver.browser.manage.delete_all_cookies
end

def random_commercial_offer
  a = ["FlexiCap", "TXT & Talk", "365 Day", "Vodafone International", "Vodafone All-Time", "Cap"]
  @offer = a.sample
  @offer
end

When /^I click change button$/ do
  step %Q{I follow "#{I18n.t 'shared.buttons.change_service_link'}" within ".account-overview"}
end

And /^I should see "(.*?)" as my service number$/ do |msisdn_type|
  step %Q{I should see "#{formatted_msisdn_string(msisdn_type)}"}
end

Then /^I should see "(.*)" as my account name$/ do |msisdn_type|
  step %Q{I should see "#{find_msisdn_info(msisdn_type,'account_name')}"}
end

Then /^I should see "(.*)" as my account number$/ do |msisdn_type|
  step %Q{I should see "#{find_msisdn_info(msisdn_type,'ban')}"}
end

And /^I should see MSISDN string for "(.*?)"$/ do |msisdn_type|
  step %Q{I should see "#{msisdn_string(msisdn_type)}"}
end

And /^I should see a message saying no entitlements register$/ do
  step %Q{I should see "You have no remaining credit. To continue to use this service, add credit to your prepaid account."}
end

Then /^I visit the T&Cs page$/ do
  step %Q{I follow "#{I18n.t 'express_recharge.recharge.new_card.card.terms_and_conditions'}"}
  step %Q{I should see "Terms & Conditions"}
end

Then /^I move back from the T&Cs page$/ do
  step %Q{I press by id "close-terms-and-conditions"}
end

Then /^I should see link Critical Information$/ do
  step %Q{I should see "#{I18n.t 'express_recharge.recharge.recharge.critical_information_summary'}"}
end

Then /^I should see a link to recharge option details$/ do
  step %Q{I should see "#{I18n.t 'express_recharge.recharge.recharge.recharge_options'}"}
end

Then /^I should see link Voucher recharge$/ do
  step %Q{I should see "#{I18n.t 'express_recharge.recharge.recharge.voucher_options'}"}
end

And /^I click back$/ do
  step %Q{I press by id "back"}
end

And /^I mouse hover Support$/ do
  page.execute_script((page.find('#menugroup-1317276856497').trigger(:mouseover)))
  #page.find('#menugroup-1317276856497').trigger(:mouseover)
end

And /^I click Bills and Payments$/ do
  step %Q{I press by id "main_navigation_account_balance"}
end

And /^I should messsage related with manage credit card$/ do
  step %Q{I should see "#{I18n.t 'en.express_recharge.payment.receipt.paragraphs.auto_recharge.manage_credit_cards.text'}"}
end

When /^an express recharge for valid MBB msisdn is started on e2e$/ do
  step %Q{an express recharge for msisdn "#{E2E_DEFAULT_PREPAY_MBB_MSISDN_NUMBER}" is started on e2e}
end

Given /^an express recharge for valid MBB msisdn with saved cc is started on e2e$/ do
  step %Q{an express recharge for msisdn "#{E2E_DEFAULT_PREPAY_MBB_MSISDN_WITH_CC}" is started on e2e}
end

Given /^I clear the "(.*)" field$/ do |field_id|
  fill_in("#{field_id}", :with => "")
end

Then /^I visit e2e PATH with ACCESSIBILITY for the PAGE$/ do |table|
  table.hashes.each_with_index do |row, index|
    path = row['PATH']
    accessibility = row['ACCESSIBILITY']
    page = row['PAGE']
    
    visit (E2E_RECHARGE_URL_BASE+"#{path}")
    if accessibility == 'accessible'
      step %Q{On e2e I should see "#{path}" with "#{page}"}
    elsif accessibility == 'inaccessible'
      step %Q{I should be shown a friendly 403 error page}
    elsif accessibility == 'requiring authentication'
      step %Q{I am redirected to the e2e WSSA authentication page}
    else
      raise "unknown accessibility param, I know about: 'accessible', 'inaccessible' and 'accessible to authenticated users only'"
    end
  end
end

Then /^I am redirected to the e2e WSSA authentication page$/ do
   find('title').native.text.should have_content("Log in to MyVodafone")
end

Then /^On e2e I should see "(.*?)" with "(.*?)"$/ do |path, page|
  step %Q{I should see "#{I18n.t (e2e_title_of(page))}"}
end

Then /^I select back or logout$/ do
  if page.has_link? "back"
    step %Q{I press by id "back"}
  end
  step %Q{I follow "main-navbar-toggle"}
  step %Q{I follow "Sign out"}
end

Given /^honeypot field filled by a spam bot$/ do
  honeypot_input_id = 'a_comment_body'
  show_invisible_field honeypot_input_id
  field = page.find(:xpath, '//*[@id="' + honeypot_input_id + '"]')
  field.set("Some Spam")
end

Then /^I am in pay my bill non loggedin page$/ do 
  step %Q{I should see "#{I18n.t 'bill_payments.new.title'}"}
end

Then /^I should see message Recharge this number$/ do
  step %Q{I should see "#{I18n.t 'express_recharge.recharge.new.number'}"}
end 

And /^I click My Vodafone$/ do
  step %Q{I follow "#{I18n.t 'express_recharge.payment.receipt.paragraphs.manage_credit_cards.link'}"}
end

And /^I should see my "(.*?)" plan name$/ do |msisdn_type|
  step %Q{I should see "#{find_msisdn_info(msisdn_type,'plan_name')}" within ".account-overview"}
end

When /^I enter a pin "(.*?)"$/ do |pin|
  fill_in 'pin[pin]', :with => pin
  if Capybara::current_driver == :rack_test
    page.find('#new_pin').submit_form!
  end
end

When /^I enter a valid pin and submit$/ do
  step %Q{I should see "#{I18n.t 'pins.new.title'}"}
  fill_in 'pin[pin]', :with => "#{pin}"
  step %Q{I press "#{I18n.t 'pins.new.next'}"}
end

Then /^I should see the Vodafone prepay customer specific disclaimer$/ do
  step %Q{I should see "#{I18n.t 'disclaimer.prepay'}" within ".disclaimer"}
end

Then /^I should see the Vodafone postpay customer specific disclaimer$/ do
  step %Q{I should see "#{I18n.t 'disclaimer.postpay'}" within ".disclaimer.visible-mobile"}
end

When /^I should not see the Bills and Payments link$/ do
  page.all('#content a').select { |link| link.text == I18n.t('side_navigation.bill_payment') }.should be_empty
end

Then /^I should not see a commercial offer and amount$/ do
  page.should have_no_css('.customer-plan')
end

When(/^I choose to make a payment$/) do
  within "form-actions--two-buttons.hidden-mobile" do
    click_link I18n.t('account_balances.show.link')
  end
end

When /^I change the phone number I want to recharge$/ do
  step %Q{I follow "#{I18n.t 'express_recharge.recharge.recharge.change'}"}
end

When /^I follow view "(.*?)"$/ do |msisdn_type|
  step %Q{I follow "View #{build_msisdn_string(msisdn_type)}"}
end

Then /^I should see the Vodafone postpay customer specific disclaimer for non-mobile$/ do
  step %Q{I should see "#{I18n.t 'disclaimer.postpay'}" within ".disclaimer.hidden-mobile"}
end

Then /^I should see an internal server error title$/ do
  step %Q{I should see "#{I18n.t 'internal_server_error.title'}"}
end

Then /^I capture a screenshot$/ do
  current_path = "tmp/screenshots/"
  if ENV['SCREENSHOT'] == "true"
    step %Q{I wait 2 seconds}
    @scenario_counter += 1
    filename = "#{current_path}#{@scenario_name}-step-#{@scenario_counter}.png"
    Capybara.save_screenshot(filename)
  end
end

def check_if_something_went_wrong(page_name,selector)
  failed = true
  for i in 0..2
    step %Q{I navigate to the Account Settings page}
    Capybara.ignore_hidden_elements = true
    step %Q{I follow "#{page_name}"}
    Capybara.ignore_hidden_elements = false
    if page.has_selector?(selector)
      failed = false 
      break
    end
  end
  if failed == true
    raise Exception.new("Something did not go to plan even after 3 retries. Please check the fusion logs")
  end
end

Then(/^I change the msisdn service to "(.*?)"$/) do |msisdn|
  step %Q{I select option with value "#{msisdn}" from element "service_id"}
end

def e2e_title_of(page_name)
    case page_name
      when /home/
        'home.index.title'
      when /sign out/
        'sessions.destroy.title'
      when /pin entry/
        'pins.new.title'
      when /the express recharge enter MSISDN page/
        'express_recharge.recharge.new.title'
      when /account balance/
        'account_balances.show.title'
      when /setup direct debit/
        'direct_debits.new.title'
      when /direct debit confirmation/
        'direct_debits.confirm.title'
      when /pay bill/
        'bill_payments.new.title'
      when /recharge now options/
        'recharge_now.new.title'
      when /receipts/
        'receipts.show.title'
      when /receipts/
        'receipts.show.title'
      when /services/
        'services.index.title'
      when /account usage/
        'accounts.index.title'
      when /manage my credit cards/
        'credit_cards.index.title'
      when /auto top-up/
        'auto_recharges.index.title'
      when /auto topup/
        'services.index.title'
      else
        "#{path_to(page_name).gsub(/^\/([^\/]+).*$/, '\1')}.index.title"
    end
end
