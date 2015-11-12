And (/^I navigate to the International Calling page$/) do
  step %Q(I navigate to the Account Settings page)
  step %Q(I follow "#{I18n.t 'account_settings.index.service.international_calling'}")
end

Then(/^I should see my International Calling setting as "(.*?)"$/) do |display_status|
  ['enabled', 'disabled'].include?(display_status).should be_true
  if display_status == 'enabled'
    step %Q{I see the styled checkbox "international-calling-status" is checked}
  elsif display_status == 'disabled'
    step %Q{I see the styled checkbox "international-calling-status" is unchecked}
  end
end

And(/^the IDD status is set to "(.*?)" for "(.*?)"$/) do |idd_status, msisdn|
  idd_status = idd_status == 'ON' ? 'Unbarred' : 'Barred'
  builder_for(:GenericSelfServiceRequest,msisdn_param(MsisdnUtils.format_msisdn msisdn)
    .merge(builder_class: FusionStub::Builder::RetrieveRoamingSettingsEnvelope)).with_idd idd_status
  builder_for :get_available_products, msisdn_param(MsisdnUtils.format_msisdn msisdn)
end

Then(/^I should see my International Calling settings status$/) do
  selector = "#international-calling-status"
  if page.has_selector?(selector) || page.has_text?("#{I18n.t 'international_calling.errors.title'}")
    unless page.has_selector?(selector) 
      check_if_something_went_wrong("#{I18n.t 'account_settings.index.service.international_calling'}",selector)
    end
  end
end

When(/^I change my International Calling settings$/) do 
    step %Q{I change my "international-calling-status" switch}
end

Then(/^I save the International Calling settings$/) do
  step %Q{I press "#{I18n.t 'international_calling.show.save_settings'}"}
end

Then(/^I am informed that the International Calling settings are being updated$/) do
  step %Q{I should see "#{I18n.t 'international_calling.update.success.message'}"}
end

When(/^I change International Calling status to "(.+)" for service "(.+)"$/) do |idd_status, service_no|
    step %Q{I change the service number to "#{service_no}"}
    step %Q{I should see my International Calling setting as "#{idd_status == 'ON' ? 'disabled' : 'enabled'}"}
    step %Q{I change my International Calling settings to "#{idd_status}"}
end

Then(/^I should be able to follow information on calling rates$/) do
  step %Q{I follow "#{I18n.t 'international_calling.show.rates.link_text'}"}
end