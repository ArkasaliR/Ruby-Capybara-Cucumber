Then(/^I press the more usage button if I have 6 and more days of my billing DOM for "(.*)"$/) do |msisdn_type|
  sleep(7)
  n = check_days_unbilled(msisdn_type)
  puts "Button Show More should appear:"
  puts n
  for i in 1..n
   page.find('#more-usage-button').click
   sleep(5)
  end
end

def billing_cycle_start_date_for(billing_dom)
    month_offset = Date.today.day < billing_dom ? 1 : 0
    Date.new(Date.today.year, Date.today.month, billing_dom) - month_offset.months
end

def check_days_unbilled(msisdn_type)
  days = (Date.today - billing_cycle_start_date_for(find_msisdn_info(msisdn_type,'billing_dom').to_i)).to_i
  if days - 5 < 0
     n = 0
  elsif ((days - 5) / 7) == 0 
     n = 1
  else ((days - 5) / 7) > 0 
    n = ((days - 5) / 7) + (((days - 5) % 7) > 0 ? 1 : 0)
  end
end

Then (/^I should be informed I had no usage for "(.*)"$/) do |day|  
  day = check_day(day)
  step %Q{I should see "#{I18n.t('my_usage.show.no_usage')}" within "##{day} .no-usage"}
end

Then (/^I (should|should not)? be informed I had "(.*)" usage for "(.*)" for "(.*)"$/) do |should, usage_template, day, msisdn_type|
  day = check_day(day)
  if should == 'should'
     step %Q{I should see "#{I18n.t('my_usage.show.day.voice.title')}" within "##{day} .voice"}
     step %Q{I should see "#{I18n.t('usage_test_data.show.'+usage_template+'.voice.used')}" within "##{day} .voice"}
     step %Q{I should see "#{I18n.t('my_usage.show.day.txt.title')}" within "##{day} .text"}
     step %Q{I should see "#{I18n.t('usage_test_data.show.'+usage_template+'.txt.used')}" within "##{day} .text"}
     step %Q{I should see "#{I18n.t('my_usage.show.day.other.title')}" within "##{day} .other"}
     step %Q{I should see "#{I18n.t('usage_test_data.show.'+usage_template+'.other.used')}" within "##{day} .other"}
  else
    billing_dom = find_msisdn_info(msisdn_type,'billing_dom')
    day = Date.parse(billing_dom) - 1
    step %Q{I should not see the "##{day} .voice" element}
    step %Q{I should not see the "##{day} .text" element}
    step %Q{I should not see the "##{day} .other" element}
  end
end
#WIP
Then (/^I select previous billing period for "(.*)"$/) do |day, msisdn_type|    
    billing_dom = find_msisdn_info(msisdn_type,'billing_dom')
    day = Date.parse(billing_dom) - 1
    step %Q{I should see the "##{day} .voice" element}
    step %Q{I should see the "##{day} .text" element}
    step %Q{I should see the "##{day} .other" element}
end

Then (/I filter usage by "(.*)"$/) do |usage_type|
  filter_usage(usage_type)
end

def filter_usage(usage_type) 
  Capybara.ignore_hidden_elements = true
  step %Q{I select showing filter}
  step %Q{I select "#{usage_type}" usage filter type}
  step %Q{I capture a screenshot}
  step %Q{I choose to update filter}
  Capybara.ignore_hidden_elements = false
end

Then (/^I select showing filter$/) do
  page.find(".usage-filter-toggle").click
end

Then (/^I select "(.*)" usage filter type$/) do |usage_type|
  page.find(".filter-#{usage_type}").click
end

Then (/I choose to update filter$/) do
  page.find(".filter-btn").click
end 

Then (/^I (should|should not)? be informed I had "(.*)" usage$/) do |should, usage_type|
  if should == 'should'
    step %Q{I should see the ".#{usage_type}" element}
  else
    step %Q{I should not see the ".#{usage_type}" element}
  end
end

# wip
Then (/^I should be informed I had "(.*)" call details for "(.*)"$/) do |usage_template, day|
  day = check_day(day)
  # step %Q{I should see "#{I18n.t('usage_test_data.show.'+usage_template+'.voice .record')}" within "##{day} .voice .record-details"}
  step %Q{I should see "#{I18n.t('usage_test_data.show.'+usage_template+'.text .record')}" within "##{day} .voice .record-details"}
  step %Q{I should see "#{I18n.t('usage_test_data.show.'+usage_template+'.other .record')}" within "##{day} .voice .record-details"}
end

When (/^I choose to expand all groups for "(.*)"$/) do |day|
  day = check_day(day)

  page.find("##{day} .voice .indicator .accordian-down-arrow").click
  page.find("##{day} .text .indicator .accordian-down-arrow").click
  page.find("##{day} .other .indicator .accordian-down-arrow").click
end

When (/^I choose to contract all groups for "(.*)"$/) do |day|
  day = check_day(day)

  page.find("##{day} .voice .indicator .accordian-up-arrow").click
  page.find("##{day} .text .indicator .accordian-up-arrow").click
  page.find("##{day} .other .indicator .accordian-up-arrow").click
end 

Then /^I should not see the "(.*?)" element$/ do |selector|
   page.should have_no_selector(selector)
end

Then /^I should see the "(.*?)" element$/ do |selector|
   page.should have_selector(selector)
end

And /^I follow voice and text overview link$/ do
    step %Q{I follow "#{I18n.t 'desktop_navigation.more_services'}"}
end

Then /^I should see All Usage link$/ do
  step %Q{I should see "View all usage"}
end

When(/^I follow All Usage link$/) do
  step %Q(I follow "View all usage")
end

Then /^I should see Data Usage link$/ do
  step %Q{I should see "View data usage"}
end

When(/^I follow Data Usage link$/) do
  step %Q(I follow "View data usage")
end

When(/^I follow Show charged items link$/) do
  step %Q(I follow "Show charged items")
end

When(/^I follow Show all usage link$/) do
  step %Q(I follow "Show all usage")
end

Then /^I should see Show all usage link$/ do
  showAllUsageLink = "#{I18n.t 'my_usage.show.postpay.show_all'}"
  step %Q{I should see "#{showAllUsageLink}"}
end

Then /^I should see Show charged items link$/ do
  showChargedItemsLink = "#{I18n.t 'my_usage.show.postpay.show_extra_charges'}"
  step %Q{I should see "#{showChargedItemsLink}"}
end

Then /^I should see Show all usage page title/ do
  showAllUsagePageTitle = "#{I18n.t 'my_usage.show.title'}"
  step %Q{I should see "#{showAllUsagePageTitle}"}
end

Then /^I should see Show charged items page title/ do
  showChargedItemsPageTitle = "#{I18n.t 'my_usage.show.title_charged'}"
  step %Q{I should see "#{showChargedItemsPageTitle}"}
end

def check_day(day)
    if day == "today"
      day = Time.now.strftime('%F')
    else day == "yesterday"
      day = (Time.now - 60*60*24).strftime('%F')
    end
    day
end

Then(/^I should see my usage page$/) do
  step %Q{I should see "#{I18n.t 'my_usage.show.title'}" within "h1.page-title"}
end

Then(/^I should see data usage page$/) do
  step %Q{I should see "#{I18n.t 'data_usage.show.title'}"}
end