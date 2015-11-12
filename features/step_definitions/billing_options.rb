When(/^I navigate to the Billing Options page$/) do
  Capybara.ignore_hidden_elements = true
  step %Q(I navigate to the Account Settings page)
  step %Q(I follow "Manage billing options")
  Capybara.ignore_hidden_elements = false
end

When(/^I edit the Billing presentation options to not show call details$/) do
	page.find('#billing-options-bill-presentation-summary').click
 end

When(/^I edit the Billing presentation options to show call details$/) do
  page.find('#billing-options-bill-presentation-detailed').click
end

When(/^I save the option$/) do
  step %Q(I press "Save changes")
end

Then(/^I should see a Success page$/) do
  step %Q{I should see "Success"}
end

Then(/^I should see the Billing options set to show call details$/) do
  expect(page.find("#billing-options-bill-presentation-detailed")).to be_checked
end

Then(/^I should see the Billing options set to not show call details$/) do
 expect(page.find("#billing-options-bill-presentation-summary")).to be_checked
end

When(/^I edit the Billing delivery options to paperless$/) do
  step %q{I check the styled checkbox "paperless-bill"}
end

Then(/^I edit the Billing delivery options to paper billing option$/) do
  step %q{I uncheck the styled checkbox "paperless-bill"}
end

When(/^I edit the Billing notifications options to TXT$/) do
  step %q{I check the styled checkbox "notification-txt-check"}
end

Then(/^I should see the Billing notifications set to TXT$/) do
  expect(page.find("#notification-txt-check")).to be_checked
end

When(/^I edit the Billing notifications options to Email$/) do
  step %Q{I fill in "billing-email" with "test@gmail.com"}
end

Then(/^I should see the Billing notifications set to Email$/) do
  expect(page).to have_field('billing-email', with: 'test@gmail.com')
end

