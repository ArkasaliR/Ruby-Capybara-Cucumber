Then(/^I should see information on Vodafone Alerts$/) do
	expect(page).to have_selector('a', :text => "#{I18n.t 'home.index.alerts.link_text'}")
end

When(/^I navigate to the Vodafone Alerts page from the My usage page$/) do
  step %Q{I follow "#{I18n.t 'home.index.alerts.link_text'}"}
end

And (/^I navigate to the Alert page$/) do
  step %Q(I navigate to the Account Settings page)
  Capybara.ignore_hidden_elements = true
  step %Q(I follow "#{I18n.t 'account_settings.index.service.vodafone_alerts'}")
  Capybara.ignore_hidden_elements = false
end

Then(/^I should not see any reference to Vodafone Alerts on my usage page$/) do
	expect(page).not_to have_selector('a', :text => "#{I18n.t 'home.index.alerts.link_text'}")
end

When(/^I change my Vodafone Alerts settings$/) do 
    step %Q{I change my "alert-status" switch}
end

Then(/^I should see my Alerts settings status$/) do
  selector = "#alert-status"
  if page.has_selector?(selector) || page.has_text?("#{I18n.t 'alerts.errors.timeout'}")
    unless page.has_selector?("selector") 
      check_if_something_went_wrong("#{I18n.t 'account_settings.index.service.vodafone_alerts'}",selector)
    end
  end
end

