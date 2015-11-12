When /^I navigate to the Account Settings page$/ do
   if ENV['MOBILE'] == "true"
    step %Q{I toggle the mobile hamburger menu open}
    step %Q{I follow "#{I18n.t 'side_navigation.account_settings'}" within "#main-side-navigation"}     
  else
    step %Q{I follow "#{I18n.t 'desktop_navigation.account_settings'}" within "#secondary-nav"}
  end
end

When /^I should see the prepay account settings links$/ do
  if ENV['MOBILE'] == "true"
    step %Q{I should not see "#{I18n.t 'account_settings.index.account.change_my_vodafone_password'}"}   
    step %Q{I should not see "#{I18n.t 'account_settings.index.account.get_puk_code'}"}   
    step %Q{I should not see "#{I18n.t 'account_settings.index.service.premium_text'}"}   
    step %Q{I should not see "#{I18n.t 'account_settings.index.service.divert_calls'}"}   
    step %Q{I should not see "#{I18n.t 'account_settings.index.service.change_phone_settings'}"}   
  #  step %Q{I should not see "#{I18n.t 'account_settings.index.payment.link_another_mobile_service'}"}   
    step %Q{I should not see "#{I18n.t 'account_settings.index.payment.more_payment_options'}"}   
    #step %Q{I should see "#{I18n.t 'account_settings.index.service.parental_lock'}"}   
  else
    step %Q{I should see "#{I18n.t 'account_settings.index.account.change_my_vodafone_password'}"}   
    step %Q{I should see "#{I18n.t 'account_settings.index.account.get_puk_code'}"}   
    step %Q{I should see "#{I18n.t 'account_settings.index.service.premium_text'}"}   
    step %Q{I should see "#{I18n.t 'account_settings.index.service.divert_calls'}"}   
    step %Q{I should see "#{I18n.t 'account_settings.index.service.change_phone_settings'}"}   
   # step %Q{I should see "#{I18n.t 'account_settings.index.payment.link_another_mobile_service'}"}   
    step %Q{I should see "#{I18n.t 'account_settings.index.payment.more_payment_options'}"}   
    #step %Q{I should not see "#{I18n.t 'account_settings.index.service.parental_lock'}"}   
  end
  step %Q{I should see "#{I18n.t 'account_settings.index.account.sim_swap'}"}   
  step %Q{I should see "#{I18n.t 'account_settings.index.service.international_roaming'}"}   
  step %Q{I should see "#{I18n.t 'account_settings.index.service.international_calling'}"}   
  step %Q{I should see "#{I18n.t 'account_settings.index.payment.proof_of_purchase'}"}   
end

When /^I should see the postpay account settings links$/ do
  if ENV['MOBILE'] == "true"
    step %Q{I should not see "#{I18n.t 'account_settings.index.account.change_my_vodafone_password'}"}   
    step %Q{I should not see "#{I18n.t 'account_settings.index.account.get_puk_code'}"}   
    step %Q{I should not see "#{I18n.t 'account_settings.index.service.premium_text'}"}   
    step %Q{I should not see "#{I18n.t 'account_settings.index.service.divert_calls'}"}   
    step %Q{I should not see "#{I18n.t 'account_settings.index.service.change_phone_settings'}"}   
    step %Q{I should not see "#{I18n.t 'account_settings.index.payment.manage_direct_debit'}"}   
    step %Q{I should not see "#{I18n.t 'account_settings.index.payment.manage_billing_options'}"}   
    #step %Q{I should see "#{I18n.t 'account_settings.index.service.parental_lock'}"}   
  else
    step %Q{I should see "#{I18n.t 'account_settings.index.account.change_my_vodafone_password'}"}   
    step %Q{I should see "#{I18n.t 'account_settings.index.account.get_puk_code'}"}   
    step %Q{I should see "#{I18n.t 'account_settings.index.service.premium_text'}"}   
    step %Q{I should see "#{I18n.t 'account_settings.index.service.divert_calls'}"}   
    step %Q{I should see "#{I18n.t 'account_settings.index.service.change_phone_settings'}"}   
    step %Q{I should see "#{I18n.t 'account_settings.index.payment.manage_direct_debit'}"}   
    step %Q{I should see "#{I18n.t 'account_settings.index.payment.manage_billing_options'}"}   
    #step %Q{I should not see "#{I18n.t 'account_settings.index.service.parental_lock'}"}   
  end
  step %Q{I should see "#{I18n.t 'account_settings.index.account.manage_contact_details'}"}   
  step %Q{I should see "#{I18n.t 'account_settings.index.account.change_account_pin'}"}   
  step %Q{I should see "#{I18n.t 'account_settings.index.account.sim_swap'}"}   
  step %Q{I should see "#{I18n.t 'account_settings.index.service.vodafone_alerts'}"}   
  step %Q{I should see "#{I18n.t 'account_settings.index.service.manage_add_ons'}"}   
  step %Q{I should see "#{I18n.t 'account_settings.index.service.international_roaming'}"}   
  step %Q{I should see "#{I18n.t 'account_settings.index.service.international_calling'}"}   
  step %Q{I should see "#{I18n.t 'account_settings.index.payment.proof_of_purchase'}"}   
end
