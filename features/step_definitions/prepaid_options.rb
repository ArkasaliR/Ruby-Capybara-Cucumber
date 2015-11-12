When /^I navigate to the Prepaid Options page$/ do
   if ENV['MOBILE'] == "true"
    step %Q{I toggle the mobile hamburger menu open}
    step %Q{I follow "#{I18n.t 'side_navigation.prepaid_options'}" within "#main-side-navigation"}     
  else
    step %Q{I follow "#{I18n.t 'desktop_navigation.prepaid_options'}" within "#secondary-nav"}
  end
end

When /^I should see the prepaid options links$/ do
  if ENV['MOBILE'] == "true"
    step %Q{I should not see "#{I18n.t 'prepaid_options.index.view_plan_info'}"}   
    step %Q{I should not see "#{I18n.t 'prepaid_options.index.auto_recharge'}"}   
    step %Q{I should not see "#{I18n.t 'prepaid_options.index.view_adjustment_history'}"}   
  else
    step %Q{I should see "#{I18n.t 'prepaid_options.index.view_plan_info'}"}   
    step %Q{I should see "#{I18n.t 'prepaid_options.index.auto_recharge'}"}   
    step %Q{I should see "#{I18n.t 'prepaid_options.index.view_adjustment_history'}"}   
  end
  step %Q{I should see "#{I18n.t 'prepaid_options.index.recharge_now'}"}   
  step %Q{I should see "#{I18n.t 'prepaid_options.index.view_prepaid_usage_details'}"}   
end