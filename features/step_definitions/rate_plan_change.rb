And(/^I navigate to Change plan$/) do
  Capybara.ignore_hidden_elements = true
  step %Q(I follow "#{I18n.t('account_settings.index.service.rate_plan_change')}")
  Capybara.ignore_hidden_elements = false
end

Then(/^I should see an error page with a proper message$/)do
  step %Q{I should see "#{I18n.t 'orpc.forbidden_page.title'}"}
  step %Q{I should see "#{I18n.t 'orpc.forbidden_page.message'}"}
end

Then(/^I should see current Plan details on the page$/)do
   step %Q{I should see "#{I18n.t 'orpc.current_plan_page.curr_plan_text'}"}
end

Then(/^I should see Compare plans page$/)do
  page.should have_selector("div[class='carousel ng-isolate-scope theme']")
end  

Then /^I should see Compare plans page with the recomended plan "(.*?)" as highlighted$/ do |planID|
	within(".current-item") do
   		find ("##{planID}")
	end
end	

Then(/^I compare my plan with plan id "(.*?)" and "(.*?)" it$/) do |planID, option|
 Capybara.ignore_hidden_elements = true
 isPlanPresent= search_plan(planID)
 if isPlanPresent == true then
  page.should have_selector("##{planID}")
  within("##{planID}") do
    page.should have_selector("a[class='rate-plan__plans__compare-plan spl-btn spl-btn-small']")
    find("a[class='rate-plan__plans__compare-plan spl-btn spl-btn-small']").click
    sleep 1
  end
  within("#compare_details_section") do
    page.should have_selector("#compare_current_section")
    page.should have_selector("#compare_selected_section")
  end
  if option == "choose" then
    find("#rate-plan__compare__select-plan").click
  else
    find("#close_compare").click
  end
 else
  raise "Can't find plan with id #{planID}"
 end

  Capybara.ignore_hidden_elements = false    
end

Then(/^I select a plan with plan id "(.*?)"$/) do |planID|
  isPlanPresent= search_plan(planID)
  if isPlanPresent == true then
    expect(page).to have_selector("##{planID}")
    within("##{planID}") do
      expect(page).to have_selector("a[class='btn-primary']")
      click_link ('Change to this plan')
    end
  end  
end

def search_plan(planID)
  Capybara.ignore_hidden_elements = true
  checkedRightSide=false
  checkedLeftSide=false
  isPlanPresent=false
  while checkedRightSide == false do
  		if page.all("##{planID}").empty? ==true or page.all("##{planID}").nil? == true then
	 		  if page.all("div.nav-next").empty? == false then
	 			 find("div.nav-next").click
         sleep 0.5
	 		  else
        checkedRightSide =true		  	
			 end	
 		 else
        isPlanPresent=true
        checkedRightSide =true
      end 
    end
  while checkedLeftSide==false do
    if page.all("##{planID}").empty? ==true or page.all("##{planID}").nil? == true then
      if page.all("div.nav-prev").empty? == false then
        find("div.nav-prev").click
        sleep 0.5
      else
        checkedLeftSide=true  
      end
    else
      isPlanPresent=true
      checkedLeftSide=true
    end
  end		 		
	expect(page).to have_selector("##{planID}")
  Capybara.ignore_hidden_elements = false
  return isPlanPresent
end

When(/^I go to Compare other plans page from my Current Plan details page$/) do
  find("#rpc__change-plan").click
end

Then(/^I come on the plan change summary page$/) do
 step %Q{I should see "Selected plan"}
 expect(page).to have_selector("#rpc__confirm-plan-change")
end

Then(/^I "(.*?)" all addons from my Current Add\-ons page$/) do |userOperation|
  step %Q{I should see "Add-ons"}
  if userOperation == "remove" then
    find("#rpc__review-plan--remove-addons").click
  elsif userOperation == "keep" then
  find("#rpc__review-plan--keep-addons").click
  end 
end

Then(/^I see my current addon "(.*?)" on my Current Plan details page$/) do |addonName|
  within("#rate-plan_addons-section") do
   addonName = addonName.split
   addonName.each{
     |addonData| 
     step %Q{I should see "#{addonData}"}
   }
 end
end

Then(/^I can see the addon "(.*?)" in the "(.*?)" section of plan change$/) do |addOnDesc, sectionType|
  classToLoad = ""
  if sectionType =="exit fees" then
    classToLoad = "div[class='plan-details-sub-block exit-fees ng-scope']"
  elsif sectionType =="New monthly costs" then
    classToLoad = "div[class='plan-details-sub-block monthly-costs ng-scope']"
  end 
  within ("#{classToLoad}") do
    step %Q{I should see "#{addOnDesc}"}
  end
end

Then(/^I change to new plan$/) do
  find("#rpc__confirm-plan-change").click
end

Then(/^I see an error message on the plan change summary page$/) do
  step %Q{I should see "#{I18n.t 'orpc.tnc_error_msg.message'}"}
end

When(/^I click on Change$/) do
  within(".account-overview")do
    click_link ('Change')
  end
end