
And(/^I navigate to the Call & service settings page$/) do
  step %Q{I navigate to the Account Settings page}
  step %Q{I follow "#{I18n.t 'account_settings.index.service.network_settings'}"}
end


Then(/^I see the current status for "([^"]*)"$/) do |network_setting|
  if network_setting == "Allow call conference"
    @call_conference_status = extract_settings_from_page(network_setting, '.network-settings__call-conference h3', '.network-settings__call-conference span')

  else network_setting == "Show caller ID"
    @caller_id_status = extract_settings_from_page(network_setting, '.network-settings__outgoing-caller-id h3', '.network-settings__outgoing-caller-id span' )
  end

end

When(/^I change the status for "([^"]*)"$/) do |network_setting|
  if network_setting == "Allow call conference"
    page.find('#call_conference', visible: false ).click

  elsif network_setting == "Show caller ID"
    page.find('#outgoing_caller_id', visible: false).click
  end
end

Then(/^I should see the changed status for "([^"]*)"$/) do |network_setting|
  if network_setting == "Allow call conference"
    @call_conference_status.should_not eq(page.find('.network-settings__call-conference span').text)

  elsif network_setting == "Show caller ID"
    @caller_id_status.should_not eq(page.find('.network-settings__outgoing-caller-id span').text)
  end
end

def extract_settings_from_page(network_setting, title_selector, value_selector)
  expect(page).to have_selector(title_selector, text: network_setting)
  find(value_selector).text
end


Then(/^I should see the PUK code displayed under Call&Service Settings$/) do
  expect(page).to have_selector('.puk_code')
end

And(/^I click on Save Settings button$/) do
  click_button('Save changes')
end

Then(/^I should see call barring status as Inactive$/) do
  step %Q{I should see "Inactive" within ".network-settings__call-barring"}
end

Then(/^I should see outgoing call barring status$/) do
  step %Q{I should see "Outgoing barring" within ".spl-message-orange.network-settings__outgoing-barring"}
end

