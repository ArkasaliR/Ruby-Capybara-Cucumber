Then /^I should see my roaming status set to "([^\"]+)"$/ do |status|
  if status == 'ON'
    find('#roamings-status').has_checked_field?('#global_roaming')
  elsif status == 'OFF'
    find('#roamings-status').has_no_checked_field?('#global_roaming')
  end
end

Then(/^the (DAS|VF Traveller) option should be "(.*?)"$/) do |field, chosen_option|
  selector = case field
    when 'DAS'
      'das'
    when 'VF Traveller'
      'vf_traveller'
    else
      raise "Unknown option '#{field}'"
  end
  case chosen_option.downcase
  when "on"
#    find(:css, "das").set(true)
    has_checked_field?(selector).should be_true
  when "off"
#    find(:css, "das").set(false)
    has_unchecked_field?(selector).should be_true
  when "unavailable"
    expect(page).not_to have_selector('#' + selector, visible: true)
  else
    raise "Unknown value for DAS Option '#{chosen_option}'"
  end
end

Then(/^I should see my International Roaming settings status$/) do
  selector = "#global_roaming"
  if page.has_selector?(selector) || page.has_text?("#{I18n.t 'roaming.errors.error_title'}")
    unless page.has_selector?(selector)
      check_if_something_went_wrong("#{I18n.t 'account_settings.index.service.international_roaming'}",selector)
    end
  end
end

And /^I should see international roaming section on my usage$/ do
  step %Q{I should see "#{I18n.t 'home.index.roaming.link_text'}"}
end

And (/^I navigate to the International Roaming page from My Usage$/) do
  step %Q{I follow "#{I18n.t 'home.index.roaming.link_text'}"}
end

And (/^I navigate to the International Roaming page$/) do
  Capybara.ignore_hidden_elements = true
  step %Q(I navigate to the Account Settings page)
  step %Q(I follow "International roaming" within ".module")
  #step %Q(I follow "#{I18n.t 'account_settings.index.service.international_roaming'}")
  Capybara.ignore_hidden_elements = false
end

Then(/^I should( not)? have the option to select a different service on my account$/) do |not_flag|
  if not_flag == ' not'
    expect(page).not_to have_selector(".account-overview select#service_id")
  else
    expect(page).to have_selector(".account-overview select#service_id")
  end
end

Then(/^I should see "(.*?)" button$/) do |link_text|
  step %Q{I should see "#{link_text}" within ".button.my-usage-link"}
end

And (/^I should not see manage add-ons from International Roaming$/) do
  if ENV['MOBILE'] == "true"
    page.should_not have_selector(".roaming-data-pack-hss")
  else
    page.should_not have_selector(".roaming-data-pack-wss")
  end
end

And (/^I navigate to rates and offers from International Roaming$/) do
  step %Q{I follow "#{I18n.t 'roaming.show.prepay_rates.link_text'}"}
end

When(/^I change my International Roaming settings$/) do 
    step %Q{I change my "global_roaming" switch}
end

Then(/^I save the International Roaming settings$/) do
  step %Q{I press "#{I18n.t 'roaming.show.save_settings'}"}
end

Then(/^I am informed that the International Roaming settings are being updated$/) do
  step %Q{I should see "#{I18n.t 'roaming.processing.alert_title'}"}
end

Then(/^I check International Roaming T&Cs$/) do
  step %Q{I check the styled checkbox "terms-and-conditions"}
end
