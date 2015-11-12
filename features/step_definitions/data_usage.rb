# encoding: UTF-8
days_left=1
data_left=1
datamessage=""


Then (/^I should retrieve my entitlements$/) do
  days_left=page.find('.billing_cycle', :visible=> true).text() 
  data_left=page.find('#dataGauge').text()
  data_left=data_left.gsub("Created with Raphaël 2.1.2","")
  #data_left=data_left.delete("Created with Raphaël 2.1.2")
  data_left=data_left.delete("left")
  #data_left=data_left.sub("GB", " GB")
  #data_left=data_left.sub("MB", " MB")
end

Then(/^I should see data usage dials$/) do
  expect(page).to have_selector('.usage-category__main__content', :visible => true)
  #page.should have_selector('#daysGauge', :visible => true)
end

Then(/^data usage dials must match with my entitlements$/) do
  within('.usage-category__main__content') {page.should have_content "#{data_left}" }
   # within('.remaining-label') {page.should have_content "#{data_left}" }
  
  within('#daysGauge') do
    within('.remaining-label') {page.should have_content "#{days_left}" }
  end
end

Then(/^I retrieve the data left message$/) do
  data1=page.find('#dataUsageGauge .gauge__subtitle .gauge__data-used').text()
  data2=page.find('#dataUsageGauge .gauge__subtitle .gauge__data-total').text()
  data2=data2.sub("used","data used")
  if data1 == "0MB"
    datamessage = "No data usage found"
  else
    datamessage = data1+" of "+data2
  end
end

Then(/^I click the dailybreakdown tab$/) do
  step %Q(I follow "#{I18n.t 'data_usage.show.tabs.daily_breakdown'}")
end

Then(/^the data usage graphs must match the data usage dials$/) do
  expect(page).to have_content "#{datamessage}"
end




