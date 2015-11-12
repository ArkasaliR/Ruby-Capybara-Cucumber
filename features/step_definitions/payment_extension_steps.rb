Then /^I should (not )?see a link to request a payment extension$/ do |not_flag|
  step %Q{I should #{not_flag}see "#{I18n.t 'account_balances.show.payment_extension.link.text'}"}
end

Then /^I follow the link to request a payment extension$/ do
  step %Q{I follow "#{I18n.t 'account_balances.show.payment_extension.link.text'}"}
end

Then /^I should see a link to find out more about payment extensions$/ do
  step %Q{I should see "#{I18n.t 'account_balances.payment_extension.more_link'}"}
end
